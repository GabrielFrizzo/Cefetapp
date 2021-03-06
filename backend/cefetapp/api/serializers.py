from rest_framework import serializers

from .models import Subject, Grade, RentedBook, GradeHistory, UserConfig


class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subject
        fields = ('class_times', 'name')


class GradeSerializer(serializers.ModelSerializer):
    subject = SubjectSerializer(read_only=True)
    class Meta:
        model = Grade
        fields = ('user', 'subject', 'grade')


class GradeHistorySerializer(serializers.ModelSerializer):
    grade = GradeSerializer(read_only=True)

    class Meta:
        model = GradeHistory
        fields = ('user', 'grade', 'semester')


class RentedBookSerializer(serializers.ModelSerializer):
    class Meta:
        model = RentedBook
        fields = ('id', 'user', 'book', 'renewal_count', 'renewal_date')


class UserConfigSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserConfig
        fields = ('id', 'user', 'config_name', 'config_value')

