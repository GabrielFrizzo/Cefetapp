from rest_framework import serializers

from .models import Subject, Grade, RentedBook


class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subject
        fields = ('class_times', 'name')


class GradeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Grade
        fields = ('user', 'subject', 'grade')


class RentedBookSerializer(serializers.ModelSerializer):
    class Meta:
        model = RentedBook
        fields = ('user', 'book', 'renewal_count', 'renewal_date')
