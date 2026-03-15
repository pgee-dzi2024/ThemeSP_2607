from django.shortcuts import render
from rest_framework import viewsets, status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Computer, WakeLog
from .serializers import ComputerSerializer, WakeLogSerializer
from .utils import send_magic_packet


# Този изглед връща основната HTML страница, където ще живее Vue.js
def index(request):
    return render(request, 'main/index.html')


class ComputerViewSet(viewsets.ModelViewSet):
    """ API endpoint за CRUD операции с компютри """
    queryset = Computer.objects.all()
    serializer_class = ComputerSerializer


class WakeLogViewSet(viewsets.ReadOnlyModelViewSet):
    """ API endpoint само за четене на историята/логовете """
    queryset = WakeLog.objects.all()
    serializer_class = WakeLogSerializer


@api_view(['POST'])
def wake_computer(request):
    """
    API endpoint за изпращане на WOL пакет.
    Приема 'mac_address' (за ръчно въвеждане) ИЛИ 'computer_id' (за запазен компютър).
    """
    mac_address = request.data.get('mac_address')
    computer_id = request.data.get('computer_id')

    if not mac_address and not computer_id:
        return Response({'error': 'Моля, предоставете MAC адрес или ID на компютър.'},
                        status=status.HTTP_400_BAD_REQUEST)

    computer = None
    if computer_id:
        try:
            computer = Computer.objects.get(id=computer_id)
            mac_address = computer.mac_address
        except Computer.DoesNotExist:
            return Response({'error': 'Компютърът не е намерен.'}, status=status.HTTP_404_NOT_FOUND)

    # Извикваме мрежовата функция от utils.py
    success, message = send_magic_packet(mac_address)

    # Записваме резултата в базата данни
    WakeLog.objects.create(
        user=request.user if request.user.is_authenticated else None,
        computer=computer,
        target_mac=mac_address,
        status='success' if success else 'error',
        message=message
    )

    if success:
        return Response({'message': message, 'mac_address': mac_address}, status=status.HTTP_200_OK)
    else:
        return Response({'error': message, 'mac_address': mac_address}, status=status.HTTP_400_BAD_REQUEST)