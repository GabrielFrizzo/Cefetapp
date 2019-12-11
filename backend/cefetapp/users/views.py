from django.shortcuts import render
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.decorators import action


from users.models import CefetUser
from users.serializers import CefetUserSerializer


class UserListView(generics.ListAPIView):
    queryset = CefetUser.objects.all()
    serializer_class = CefetUserSerializer

    @action(detail=True, methods=['post'])
    def config_setup(self, request, pk):

    	user = self.request.user
    	config_name = request.data['config_name']
    	config_value = request.data['config_value']
    	if user.config_setup(config_name, config_value):
    		return Response({'status': 'SUCESSO'})
    	return Response({'status': 'ERRO'})