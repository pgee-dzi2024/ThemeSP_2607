from rest_framework import serializers
from .models import Computer, WakeLog

class ComputerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Computer
        fields = '__all__'

class WakeLogSerializer(serializers.ModelSerializer):
    # Добавяме името на компютъра и потребителя за по-лесно четене във фронтенда
    computer_name = serializers.CharField(source='computer.name', read_only=True, default='Ръчно въведен')
    username = serializers.CharField(source='user.username', read_only=True, default='Анонимен')

    class Meta:
        model = WakeLog
        fields = ['id', 'username', 'computer', 'computer_name', 'target_mac', 'timestamp', 'status', 'message']