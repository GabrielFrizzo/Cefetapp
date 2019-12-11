from django.db import models
from django.contrib.auth.models import AbstractUser
from api.models import UserConfig

class CefetUser(AbstractUser):
    name = models.CharField(max_length=80)
    portal_username = models.CharField(max_length=80)
    portal_password = models.CharField(max_length=80)
    ra = models.CharField(max_length=10)
    pergamum_password = models.CharField(max_length=80)

    def __str__(self):
        return self.name

    def config_setup(self, config_name, config_value):
    	if config_name == "Notification":
    		if config_value in ["15", "30", "45", "Não"]:
    			UserConfig.create(user = self, config_name = config_name, config_value = config_value)
    			return True
    		return False
