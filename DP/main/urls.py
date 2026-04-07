from django.urls import path
from django.views.generic import TemplateView
from .views import DocumentUploadView

app_name = 'main'  # Добра практика е да задаваме име на приложението

urlpatterns = [
    # 1. Път за основната страница с интерфейса (Frontend с Vue.js)
    # Използваме вградения TemplateView, за да заредим директно HTML файла,
    # който ще създадем в следващата стъпка.
    path('', TemplateView.as_view(template_name='main/index.html'), name='home'),
    path('old', TemplateView.as_view(template_name='main/index_old.html'), name='home'),

    # 2. Път за API-то, което приема снимката и връща извлечения текст (Backend)
    path('api/upload/', DocumentUploadView.as_view(), name='api-document-upload'),
]