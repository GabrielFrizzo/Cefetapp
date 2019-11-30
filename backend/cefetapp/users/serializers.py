from rest_framework import serializers

from .models import CefetUser


class CefetUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CefetUser
        fields = ('portal_username', 'ra')
