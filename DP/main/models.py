from django.db import models
from django.core.validators import RegexValidator
from django.contrib.auth.models import User

# Валидатор за MAC адрес
mac_validator = RegexValidator(
    regex=r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$',
    message='Въведете валиден MAC адрес във формат XX:XX:XX:XX:XX:XX или XX-XX-XX-XX-XX-XX.'
)


class Computer(models.Model):
    name = models.CharField(max_length=100, verbose_name="Име на компютър")
    mac_address = models.CharField(max_length=17, validators=[mac_validator], verbose_name="MAC адрес")
    ip_address = models.GenericIPAddressField(
        null=True,
        blank=True,
        verbose_name="IP / Broadcast адрес",
        help_text="Опционално: Оставете празно за стандартен локален broadcast (255.255.255.255)"
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Добавен на")

    def __str__(self):
        return f"{self.name} ({self.mac_address})"

    class Meta:
        verbose_name = "Компютър"
        verbose_name_plural = "Компютри"
        ordering = ['-created_at']


class WakeLog(models.Model):
    STATUS_CHOICES = (
        ('success', 'Успешно изпратен'),
        ('error', 'Грешка при изпращане'),
    )

    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Потребител")
    computer = models.ForeignKey(Computer, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Компютър")
    target_mac = models.CharField(max_length=17, verbose_name="Целеви MAC адрес")
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name="Време на изпращане")
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='success', verbose_name="Статус")
    message = models.TextField(blank=True, null=True, verbose_name="Съобщение / Детайли")

    def __str__(self):
        return f"WOL пакет до {self.target_mac} от {self.user} на {self.timestamp.strftime('%Y-%m-%d %H:%M')}"

    class Meta:
        verbose_name = "WOL Лог"
        verbose_name_plural = "WOL Логове"
        ordering = ['-timestamp']