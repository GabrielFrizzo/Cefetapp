from django.db import models
from django.contrib.auth.models import AbstractUser


class CefetUser(AbstractUser):
    name = models.CharField(max_length=80)
    portal_username = models.CharField(max_length=80)
    portal_password = models.CharField(max_length=80)
    ra = models.CharField(max_length=10)
    pergamum_password = models.CharField(max_length=80)

    def __str__(self):
        return self.name
