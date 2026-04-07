from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import DocumentSerializer
import pytesseract
from PIL import Image
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'


class DocumentUploadView(APIView):
    def post(self, request, *args, **kwargs):
        # Подаваме данните от заявката (включително файла) на сериализатора
        serializer = DocumentSerializer(data=request.data)

        if serializer.is_valid():
            # Запазваме документа в базата данни (записва се само снимката засега)
            document = serializer.save()

            try:
                # Отваряме запазената снимка чрез библиотеката Pillow
                img = Image.open(document.image.path)

                # Извличаме текста чрез Tesseract.
                # Задаваме български и английски език (lang='bul+eng').
                # Уверете се, че сте инсталирали българския езиков пакет за Tesseract!
                extracted_text = pytesseract.image_to_string(img, lang='bul+eng')

                # Обновяваме записа в базата данни с извлечения текст
                document.extracted_text = extracted_text
                document.save()

                # Връщаме успешен отговор към frontend-а с извлечения текст и URL на снимката
                return Response({
                    'message': 'Документът е обработен успешно!',
                    'document_id': document.id,
                    'extracted_text': document.extracted_text,
                    'image_url': document.image.url
                }, status=status.HTTP_201_CREATED)

            except Exception as e:
                return Response({'error': f'Грешка при обработката на изображението: {str(e)}'},
                                status=status.HTTP_500_INTERNAL_SERVER_ERROR)

                # Ако данните не са валидни (напр. не е качен файл)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

