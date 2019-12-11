from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from users.models import CefetUser


class CefetUserCreationForm(UserCreationForm):
    class Meta:
        model = CefetUser
        fields = ('email','name', 'portal_username', 'portal_password', 'ra', 'pergamum_password')


class CefetUserChangeForm(UserChangeForm):
    class Meta:
        model = CefetUser
        fields = UserChangeForm.Meta.fields

