from django.shortcuts import render
from .forms import LandCreateForm, GeologicalSurveyCreateForm
from django.views.generic.edit import CreateView, UpdateView, DeleteView    
from django.views import generic
from land.models import *
from django.urls import reverse
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required


# обработка создания участков
class LandCreateView(CreateView):
    template_name = 'land/land_form.html'
    form_class = LandCreateForm


    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.owner = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_initial(self, *args, **kwargs):
        initial = super(LandCreateView, self).get_initial(**kwargs)
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(LandCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['owner'] = self.request.user
        return kwargs


# class LandDetailView(generic.DetailView):
#     model = Land

@login_required
def land_detail_view(request, pk):
    land = get_object_or_404(Land, pk=pk)
    my_geologicalsurveys_list = GeologicalSurvey.objects.filter(land=land)

    context = {
        'land': land,
        'my_geologicalsurveys_list': my_geologicalsurveys_list,
    }

    return render(request, 'land/land_detail.html', context)


class LandDelete(DeleteView):
    model = Land
    success_url = reverse_lazy('dashboard')

# Обработка создания геологических исследований
class GeologicalSurveyCreateView(CreateView):
    template_name = 'geologicalsurvey/geologicalsurvey_form.html'
    form_class = GeologicalSurveyCreateForm


    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.contractor = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_initial(self, *args, **kwargs):
        initial = super(GeologicalSurveyCreateView, self).get_initial(**kwargs)
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(GeologicalSurveyCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['contractor'] = self.request.user
        return kwargs


class GeologicalSurveyDetailView(generic.DetailView):
    template_name = 'geologicalsurvey/geologicalsurvey_detail.html'
    model = GeologicalSurvey

class GeologicalSurveyDelete(DeleteView):
    model = GeologicalSurvey
    template_name = 'geologicalsurvey/geologicalsurvey_confirm_delete.html'
    success_url = reverse_lazy('dashboard')


# @login_required
# def dashboard(request):
#     # user = User.objects.filter(username=request.user.username)
#     # user = request.user
#     my_plans_list = Plan.objects.filter(author=request.user)
#     my_lands_list = Land.objects.filter(owner=request.user)
#     my_geologicalsurveys_list = GeologicalSurvey.objects.filter(contractor=request.user)

#     context = {
#         'my_plans_list': my_plans_list,
#         'my_lands_list': my_lands_list,
#         'my_geologicalsurveys_list': my_geologicalsurveys_list,
#     }
#     return render(request, 'account/dashboard.html', context)