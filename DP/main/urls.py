from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

# Регистрираме изгледите за компютри и логове
router = DefaultRouter()
router.register(r'computers', views.ComputerViewSet)
router.register(r'logs', views.WakeLogViewSet)

urlpatterns = [
    # Основен изглед за фронтенда
    path('', views.index, name='index'),

    # API endpoints от рутера (напр. /api/computers/ и /api/logs/)
    path('api/', include(router.urls)),

    # Custom API endpoint за самото събуждане
    path('api/wake/', views.wake_computer, name='wake_computer'),
]