from django.shortcuts import render
from rest_framework import generics

from users.models import CefetUser
from users.serializers import CefetUserSerializer


class UserListView(generics.ListAPIView):
    queryset = CefetUser.objects.all()
    serializer_class = CefetUserSerializer
