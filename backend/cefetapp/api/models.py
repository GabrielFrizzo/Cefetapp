from django.db import models
from users.models import CefetUser


class Subject(models.Model):
    class_times = models.CharField(max_length=400)
    name = models.CharField(max_length=80)

    def __str__(self):
        return self.name


class Grade(models.Model):
    user = models.ForeignKey(CefetUser, on_delete=models.CASCADE)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    grade = models.FloatField()

    def __str__(self):
        return str(self.grade)


class UserConfig(models.Model):
    user = models.ForeignKey(CefetUser, on_delete=models.CASCADE)

    config_name = models.CharField(max_length=80)
    config_value = models.CharField(max_length=80)

    def __str__(self):
        return self.config_name + '->' + self.config_value


class RentedBook(models.Model):
    user = models.ForeignKey(CefetUser, on_delete=models.CASCADE)

    book = models.CharField(max_length=80)
    renewal_count = models.IntegerField()
    renewal_date = models.DateField()

    def __str__(self):
        return self.book
