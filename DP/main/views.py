from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import DocumentSerializer
import pytesseract
from PIL import Image
import cv2
import numpy as np
import re

pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'


class DocumentUploadView(APIView):
    def _order_points(self, pts):
        rect = np.zeros((4, 2), dtype="float32")
        s = pts.sum(axis=1)
        rect[0] = pts[np.argmin(s)]
        rect[2] = pts[np.argmax(s)]

        diff = np.diff(pts, axis=1)
        rect[1] = pts[np.argmin(diff)]
        rect[3] = pts[np.argmax(diff)]
        return rect

    def _four_point_transform(self, image, pts):
        rect = self._order_points(pts)
        (tl, tr, br, bl) = rect

        width_a = np.linalg.norm(br - bl)
        width_b = np.linalg.norm(tr - tl)
        max_width = max(int(width_a), int(width_b))

        height_a = np.linalg.norm(tr - br)
        height_b = np.linalg.norm(tl - bl)
        max_height = max(int(height_a), int(height_b))

        dst = np.array([
            [0, 0],
            [max_width - 1, 0],
            [max_width - 1, max_height - 1],
            [0, max_height - 1]
        ], dtype="float32")

        matrix = cv2.getPerspectiveTransform(rect, dst)
        warped = cv2.warpPerspective(image, matrix, (max_width, max_height))
        return warped

    def _correct_perspective(self, image):
        orig = image.copy()
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        blurred = cv2.GaussianBlur(gray, (5, 5), 0)
        edged = cv2.Canny(blurred, 75, 200)

        contours, _ = cv2.findContours(edged.copy(), cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
        contours = sorted(contours, key=cv2.contourArea, reverse=True)[:5]

        for c in contours:
            peri = cv2.arcLength(c, True)
            approx = cv2.approxPolyDP(c, 0.02 * peri, True)

            if len(approx) == 4:
                return self._four_point_transform(orig, approx.reshape(4, 2))

        return image

    def _deskew(self, image):
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        gray = cv2.bitwise_not(gray)
        thresh = cv2.threshold(
            gray, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU
        )[1]

        coords = np.column_stack(np.where(thresh > 0))
        if len(coords) == 0:
            return image

        angle = cv2.minAreaRect(coords)[-1]
        if angle < -45:
            angle = -(90 + angle)
        else:
            angle = -angle

        (h, w) = image.shape[:2]
        center = (w // 2, h // 2)
        matrix = cv2.getRotationMatrix2D(center, angle, 1.0)
        rotated = cv2.warpAffine(
            image, matrix, (w, h),
            flags=cv2.INTER_CUBIC,
            borderMode=cv2.BORDER_REPLICATE
        )
        return rotated

    def _auto_rotate_orientation(self, image):
        try:
            pil_image = Image.fromarray(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
            osd = pytesseract.image_to_osd(pil_image)
            angle = 0

            for line in osd.split('\n'):
                if 'Rotate:' in line:
                    angle = int(line.split(':')[1].strip())
                    break

            if angle == 90:
                return cv2.rotate(image, cv2.ROTATE_90_COUNTERCLOCKWISE)
            if angle == 180:
                return cv2.rotate(image, cv2.ROTATE_180)
            if angle == 270:
                return cv2.rotate(image, cv2.ROTATE_90_CLOCKWISE)
        except Exception:
            pass

        return image

    def _normalize_line(self, line):
        line = re.sub(r'\s+', ' ', line).strip()
        line = re.sub(r'\s+([,.;:!?])', r'\1', line)
        line = re.sub(r'([(\[])\s+', r'\1', line)
        line = re.sub(r'\s+([)\]])', r'\1', line)
        return line

    def _looks_like_list_item(self, line):
        return bool(re.match(r'^(\d+[\.\)]|[-•*])\s+', line.strip()))

    def _looks_like_heading(self, line):
        stripped = line.strip()
        if len(stripped) < 3:
            return False
        if stripped.endswith(':'):
            return True
        if stripped.isupper() and len(stripped) <= 80:
            return True
        return False

    def _should_join_lines(self, previous_line, current_line):
        prev = previous_line.rstrip()
        curr = current_line.lstrip()

        if not prev:
            return False

        if prev.endswith((':', '—', '-', '(', '[', '/')):
            return True

        if self._looks_like_list_item(prev) or self._looks_like_list_item(curr):
            return False

        if self._looks_like_heading(prev) or self._looks_like_heading(curr):
            return False

        if prev[-1] in '.!?':
            return False

        if len(prev) < 40:
            return True

        return True

    def _postprocess_text(self, text):
        # 1) Премахване на пренос с тире
        text = re.sub(r'(\w)-\s*\n\s*(\w)', r'\1\2', text)

        # 2) Почистване на празни редове и редове
        raw_lines = [line.rstrip() for line in text.splitlines()]
        cleaned_lines = []

        for line in raw_lines:
            line = line.strip()
            if not line:
                cleaned_lines.append('')
                continue
            cleaned_lines.append(self._normalize_line(line))

        # 3) Сглобяване на абзаци по-умно
        paragraphs = []
        current_paragraph = []

        for line in cleaned_lines:
            if not line:
                if current_paragraph:
                    paragraphs.append(' '.join(current_paragraph).strip())
                    current_paragraph = []
                continue

            if not current_paragraph:
                current_paragraph.append(line)
                continue

            previous_line = current_paragraph[-1]

            if self._should_join_lines(previous_line, line):
                current_paragraph[-1] = previous_line + ' ' + line
            else:
                current_paragraph.append(line)

        if current_paragraph:
            paragraphs.append(' '.join(current_paragraph).strip())

        # 4) Финално нормализиране
        text = '\n\n'.join(paragraphs)
        text = re.sub(r'[ \t]+', ' ', text)
        text = re.sub(r'\n{3,}', '\n\n', text)

        # 5) Чести OCR корекции
        replacements = {
            "документътт": "документът",
            "снимкаа": "снимка",
            "текстаа": "текста",
            "записваа": "записва",
            "приложениее": "приложение",
            "разпознаванетo": "разпознаването",
        }

        for wrong, correct in replacements.items():
            text = text.replace(wrong, correct)

        return text.strip()

    def _preprocess_image(self, img):
        image = np.array(img)
        image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)

        # 1) Корекция на перспектива
        image = self._correct_perspective(image)

        # 2) Автоматично завъртане по ориентация
        image = self._auto_rotate_orientation(image)

        # 3) Изправяне (deskew)
        image = self._deskew(image)

        # Допълнителна OCR предобработка
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        gray = cv2.resize(gray, None, fx=2, fy=2, interpolation=cv2.INTER_CUBIC)
        gray = cv2.GaussianBlur(gray, (3, 3), 0)
        gray = cv2.threshold(
            gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU
        )[1]

        return Image.fromarray(gray)

    def post(self, request, *args, **kwargs):
        serializer = DocumentSerializer(data=request.data)

        if serializer.is_valid():
            document = serializer.save()

            try:
                img = Image.open(document.image.path).convert("RGB")
                img = self._preprocess_image(img)

                config = '--oem 1 --psm 4'
                extracted_text = pytesseract.image_to_string(
                    img,
                    lang='bul+eng',
                    config=config
                ).strip()

                extracted_text = self._postprocess_text(extracted_text)

                document.extracted_text = extracted_text
                document.save()

                return Response({
                    'message': 'Документът е обработен успешно!',
                    'document_id': document.id,
                    'extracted_text': document.extracted_text,
                    'image_url': document.image.url
                }, status=status.HTTP_201_CREATED)

            except Exception as e:
                return Response(
                    {'error': f'Грешка при обработката на изображението: {str(e)}'},
                    status=status.HTTP_500_INTERNAL_SERVER_ERROR
                )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
