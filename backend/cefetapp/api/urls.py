from django.urls import include, path
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register('subjects', views.SubjectViewSet)
router.register('grades', views.GradeViewSet, basename='grades')
router.register('books', views.RentedBookViewSet, basename='books')
router.register('grade_history', views.GradeHistoryViewSet, basename='grade_history')

urlpatterns = [
    path('', include(router.urls)),
    path('users/', include('users.urls')),
    path('rest-auth/', include('rest_auth.urls')),
]