from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from users.forms import CefetUserCreationForm, CefetUserChangeForm
from users.models import CefetUser


class CefetUserAdmin(UserAdmin):
    add_form = CefetUserCreationForm
    form = CefetUserChangeForm
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Personal info',
         {'fields': ('name', 'portal_username', 'portal_password', 'ra', 'pergamum_password')})
    )
    model = CefetUser
    list_display = ('email', 'name', 'portal_username', 'ra')


admin.site.register(CefetUser, CefetUserAdmin)
