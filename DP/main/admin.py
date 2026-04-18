from django.contrib import admin
from .models import Computer, WakeLog

# Register your models here.
admin.site.register(Computer)
admin.site.register(WakeLog)
