from rest_framework import serializers
from .models import Document


class DocumentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Document
        # Изброяваме полетата, които искаме да бъдат достъпни през API-то
        fields = ['id', 'image', 'extracted_text', 'uploaded_at']

        # Правим extracted_text само за четене при първоначалното качване,
        # тъй като бекендът ще го попълни автоматично след OCR обработката
        read_only_fields = ['extracted_text', 'uploaded_at']