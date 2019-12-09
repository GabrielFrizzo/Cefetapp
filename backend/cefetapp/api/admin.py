from django.contrib import admin
from api.models import Subject, Grade, RentedBook, GradeHistory

admin.site.register(Subject)
admin.site.register(Grade)
admin.site.register(GradeHistory)
admin.site.register(RentedBook)
