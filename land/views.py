from django.shortcuts import render
from .forms import LandCreateForm, SurveyCreateForm, WellCreateForm, LayerCreateForm
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

# функция просмотра пользователем геологического исследования для своего учатска. Фильтация исследований по участку и по заказчику
@login_required
def land_detail_view(request, pk):
    land = get_object_or_404(Land, pk=pk)
    my_surveys_list = Survey.objects.filter(land=land, customer=request.user)

    context = {
        'land': land,
        'my_surveys_list': my_surveys_list,
    }

    return render(request, 'land/land_detail.html', context)


class LandDelete(DeleteView):
    model = Land
    success_url = reverse_lazy('dashboard')

# Обработка создания геологических исследований
class SurveyCreateView(CreateView):
    template_name = 'survey/survey_form.html'
    form_class = SurveyCreateForm


    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.contractor = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_initial(self, *args, **kwargs):
        initial = super(SurveyCreateView, self).get_initial(**kwargs)
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(SurveyCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['contractor'] = self.request.user
        return kwargs


# class SurveyDetailView(generic.DetailView):
#     template_name = 'survey/survey_detail.html'
#     model = Survey

# функция просмотра деталей геологического исследования. Выводит скважины, какие в нем есть. Добавлять и редактировать скважины нужно чтобы могли только с соотв. правами - это пока не сделано
@login_required
def survey_detail_view(request, pk):
    survey = get_object_or_404(Survey, pk=pk)
    my_wells_list = Well.objects.filter(survey=survey)

    new_well = None # задаем переменную, отвечающую за создание скважины
    if request.method == 'POST':
        well_form = WellCreateForm(request.POST)
        if well_form.is_valid():
            new_well = well_form.save(commit=False) # создаем скважину, но еще не сохраняем ее в базе данных
            new_well.survey = survey # указываем, от какого исследования эта скважина
            new_well.save() # и только потом сохраняем
    else:
        well_form = WellCreateForm()

    context = {
        'survey': survey,
        'my_wells_list': my_wells_list,
        'new_well': new_well,
        'well_form': well_form,
    }

    return render(request, 'survey/survey_detail.html', context)


@login_required
def well_detail_view(request, pk):
    well = get_object_or_404(Well, pk=pk)
    my_layers_list = Layer.objects.filter(well=well)
    
    new_layer = None
    if request.method == 'POST':
        layer_form = LayerCreateForm(request.POST)
        if layer_form.is_valid():
            new_layer = layer_form.save(commit=False) 
            new_layer.well = well 
            new_layer.save() 
    else:
        layer_form = LayerCreateForm()

    well.bearing_resistance_pile_2000_300 = well.bearing_resistance_pile_2000_300 + 1
    well.save() 

    context = {
        'well': well,
        'my_layers_list': my_layers_list,
        'new_layer': new_layer,
        'layer_form': layer_form,
    }

    return render(request, 'well/well_detail.html', context)




class SurveyDelete(DeleteView):
    model = Survey
    template_name = 'survey/survey_confirm_delete.html'
    success_url = reverse_lazy('dashboard')

# создание скважины для геологического исследования



# class WellCreateView(CreateView):
#     template_name = 'well/well_form.html'
#     form_class = WellCreateForm
#     # survey = get_object_or_404(Survey, pk=pk)

#     def form_valid(self, form):
#         self.object = form.save(commit=False)
#         # survey = get_object_or_404(Survey, pk=pk)
#         # self.object.survey = survey
#         self.object.save()
#         return HttpResponseRedirect(self.get_success_url())

        







class WellDelete(DeleteView):
    model = Well
    template_name = 'well/well_confirm_delete.html'
    success_url = reverse_lazy('dashboard')

# создание грунтового слоя в скважине
# class LayerCreateView(CreateView):
#     template_name = 'layer/layer_form.html'
#     form_class = LayerCreateForm

#     def form_valid(self, form):
#         self.object = form.save(commit=False)
#         # self.object.well = self.request.well
#         self.object.save()
#         return HttpResponseRedirect(self.get_success_url())

class LayerDetailView(generic.DetailView):
    template_name = 'layer/layer_detail.html'
    model = Layer

class LayerDelete(DeleteView):
    model = Layer
    template_name = 'layer/layer_confirm_delete.html'
    success_url = reverse_lazy('dashboard')