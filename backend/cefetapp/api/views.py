from django.contrib.auth.decorators import login_required
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from django.db.models import Q

from .serializers import SubjectSerializer, GradeSerializer, RentedBookSerializer, GradeHistorySerializer, UserConfigSerializer
from .models import Subject, Grade, RentedBook, UserConfig


class SubjectViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer


class GradeViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = GradeSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated:
            return self.request.user.grade_set.all()
        else:
            return []


class GradeHistoryViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = GradeHistorySerializer

    def get_queryset(self):
        if self.request.user.is_authenticated:
            return self.request.user.gradehistory_set.all()
        else:
            return []


class RentedBookViewSet(viewsets.ModelViewSet):
    serializer_class = RentedBookSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated:
            return self.request.user.rentedbook_set.all()
        else:
            return []

    @action(detail=True, methods=['post'])
    def renew(self, request, pk):
        book = RentedBook.objects.get(pk=pk)
        if book:
            if book.renew():
                return Response({'status': 'SUCESSO', 'renovacoes': book.renewal_count})
            return Response({'status': 'ERRO', 'mensagem': 'Limite de renovações atingido'})

        return Response({'status': 'ERRO', 'mensagem': 'Falha ao renovar o livro'})

class SearchBookViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = RentedBookSerializer

    def get_queryset(self): # new
        query = self.request.GET.get('q')
        object_list = RentedBook.objects.filter(
            Q(book__icontains=query)
        )
        return object_list


class UserConfigViewSet(viewsets.ModelViewSet):
    serializer_class = UserConfigSerializer

    def get_queryset(self):
        if self.request.user.is_authenticated:
            return self.request.user.userconfig_set.all()
        else:
            return []
