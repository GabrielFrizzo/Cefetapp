from django.urls import include, path

from users.views import UserListView

urlpatterns = [
    path('', UserListView.as_view())
]

