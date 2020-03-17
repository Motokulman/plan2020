from materialprices.models import *
from catalog.modules import calc

from django.shortcuts import render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import generic
from django.contrib.auth.decorators import permission_required
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from django.contrib.auth.models import User
from django.contrib.auth.models import Permission, Group
from django.http import HttpResponse, JsonResponse
from django.core import serializers
from django.contrib.auth.decorators import login_required
from catalog.forms import UserRegistrationForm, UserEditForm, ProfileEditForm
import json

class WallMaterialPricesListView(LoginRequiredMixin, generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    model = RockWallMaterialPrice
    template_name = 'catalog/wall_materials_prices.html'
    paginate_by = 100

    def get_queryset(self):
        return RockWallMaterialPrice.objects.filter(owner=self.request.user)