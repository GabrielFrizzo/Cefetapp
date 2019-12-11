from django.urls import include, path
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register('subjects', views.SubjectViewSet)
router.register('grades', views.GradeViewSet, basename='grades')
router.register('books', views.RentedBookViewSet, basename='books')
router.register('search', views.SearchBookViewSet, basename='search')
router.register('grade_history', views.GradeHistoryViewSet, basename='grade_history')
router.register('user_config', views.UserConfigViewSet, basename='user_config')

urlpatterns = [
    path('', include(router.urls)),
    path('users/', include('users.urls')),
    path('rest-auth/', include('rest_auth.urls')),
    path('rest-auth/registration/', include('rest_auth.registration.urls')),
]