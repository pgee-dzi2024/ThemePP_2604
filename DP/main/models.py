from django.db import models


class Document(models.Model):
    # Поле за самата снимка. Снимките ще се запазват в папка media/documents/
    image = models.ImageField(upload_to='documents/', verbose_name='Снимка на документа')

    # Поле за текста, който ще извлечем. Може да бъде празно първоначално.
    extracted_text = models.TextField(blank=True, null=True, verbose_name='Извлечен текст')

    # Автоматично запазва датата и часа на качване на файла
    uploaded_at = models.DateTimeField(auto_now_add=True, verbose_name='Дата на качване')

    def __str__(self):
        # Това определя как ще се показва обектът в административния панел
        return f"Документ {self.id} - {self.uploaded_at.strftime('%d.%m.%Y %H:%M')}"
