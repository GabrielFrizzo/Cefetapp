from django.contrib.auth.decorators import login_required
from rest_framework import viewsets

from .serializers import SubjectSerializer, GradeSerializer, RentedBookSerializer, GradeHistorySerializer
from .models import Subject, Grade, RentedBook


class SubjectViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer


class GradeViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = GradeSerializer

    def get_queryset(self):
        return self.request.user.grade_set.all()


class GradeHistoryViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = GradeHistorySerializer

    def get_queryset(self):
        return self.request.user.gradehistory_set.all()


class RentedBookViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = RentedBookSerializer

    def get_queryset(self):
        return self.request.user.rentedbook_set.all()

