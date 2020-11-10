from catalog.models import *
from catalog.modules import calc
from materials.models import RoofCoverType
# from catalog.modules import porotherm44
# from catalog.forms import SelectRoofMaterialTypeForm
from .forms import PlanCreateForm

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
# from catalog.forms import UserRegistrationForm, UserEditForm, ProfileEditForm
import json


def index(request):
    """View function for home page of site."""

    # # Generate counts of some of the main objects
    num_plans = Plan.objects.all().count()
    plan_list = Plan.objects.all()
    # num_instances = BookInstance.objects.all().count()

    # # Available books (status = 'a')
    # num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # # The 'all()' is implied by default.
    # num_authors = Author.objects.count()

    context = {
        'num_plans': num_plans,
        'plan_list': plan_list,
        # 'num_instances': num_instances,
        # 'num_instances_available': num_instances_available,
        # 'num_authors': num_authors,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)






# class MyPlansListView(generic.ListView):
#     model = Plan
#     context_object_name = 'my_book_list'   # your own name for the list as a template variable
#     queryset = Plan.objects.filter(author=self.user_id) # Get 5 books containing the title war
#     template_name = 'books/my_arbitrary_template_name_list.html'  # Specify your own template name/location
    
#     def get_context_data(self, **kwargs):
#         # Call the base implementation first to get the context
#         context = super(BookListView, self).get_context_data(**kwargs)
#         # Create any data and add it to the context
#         context['some_data'] = 'This is just some data'
#         return context


class PlanListView(generic.ListView):
    model = Plan


class PlanDetailView(generic.DetailView):
    model = Plan


class PlanCreateView(CreateView):
    template_name = 'catalog/plan_form.html'
    form_class = PlanCreateForm


    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.author = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_initial(self, *args, **kwargs):
        initial = super(PlanCreateView, self).get_initial(**kwargs)
        initial['title'] = 'Новый проект'
        # initial['author'] = user
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(PlanCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['author'] = self.request.user
        return kwargs


class PlanDelete(DeleteView):
    model = Plan
    success_url = reverse_lazy('plans')


def edit_scheme(request, pk):
    """View function for editing scheme of a specific plan"""

    plan = get_object_or_404(Plan, pk=pk)
    plan_title = plan.title
    plan_id = plan.id
    # roof_material = RoofCoverMaterial.objects.all()
    # test = Plan.objects.all()
    # a, b = calc.calc(request)
    plan_scheme = plan.scheme
    # if plan_scheme != None:
        # test = calc.calc_variants(request, pk)
    #     # city = get_city()
    #     algorithms = calc.get_algorithms(calc.get_materials(
    #         calc.get_city(request)))  # получили уникальные алгоритмы
    #     algorithms = serializers.serialize('json', algorithms)
    # else:
    #     algorithms = "Нет данных"

    context = {
        'plan_title': plan_title,
        'plan_id': plan_id,
        # 'test': roof_material,
    }

    return render(request, 'catalog/edit_scheme.html', context)


def edit_variant(request, pk):
    """View function for add new variant of a specific plan"""

    plan = get_object_or_404(Plan, pk=pk)
    plan_title = plan.title
    plan_id = plan.id
    # num_instances_available=BookInstance.objects.filter(status__exact='a').count()

    context = {
        'plan_title': plan_title,
        'plan_id': plan_id,
    }

    return render(request, 'catalog/edit_variant.html', context)

# форма создания архиткурного скина
# def arch_skin(request, pk):
#     """форма создания архиткурного скина"""
#     plan = get_object_or_404(Plan, pk=pk)

#     # If this is a POST request then process the Form data
#     if request.method == 'POST':

#         # Create a form instance and populate it with data from the request (binding):
#         form = SelectRoofMaterialTypeForm(request.POST)

#         # Check if the form is valid:
#         if form.is_valid():
#             # process the data in form.cleaned_data as required (here we just write it to the model due_back field)
#             book_instance.due_back = form.cleaned_data['renewal_date']
#             book_instance.save()

#             # redirect to a new URL:
#             return HttpResponseRedirect(reverse('all-borrowed') )

#     # If this is a GET (or any other method) create the default form.
#     else:
#         proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
#         form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

#     context = {
#         'form': form,
#         'book_instance': book_instance,
#     }

#     return render(request, 'catalog/book_renew_librarian.html', context)


def set_scheme(request, plan_id):
    """Сохранение, изменение схемы"""
    return_dict = dict()
    if request.POST:
        data = request.POST
        e = get_object_or_404(Plan, id=plan_id)
        e.scheme = data.get("json")
        try:
            e.save()
            return_dict={"id":plan_id,"status":"save"}
        except:
            return_dict = {"id": plan_id, "status": "false"}
    # если проект имеет статус завершенного, сразу вычисляем его стоимость для всех городов и всех поставщиков
    else:
        t = Plan.objects.get(id=plan_id)
        return_dict={"id":plan_id,"json":t.scheme}
    return JsonResponse(return_dict)


def get_plan(request, pk):
    """Получение схемы """
    d = Plan.objects.filter(id=pk)
    d = serializers.serialize('json', d)

    return JsonResponse(d, safe=False)


def get_cost(request, pk):
    """Рассчитываем все исходя из схемы. В будущем реализовать механизм сессий, чтоб каждый раз не искать проект в базе"""
    d = Plan.objects.filter(id=pk)
    d = serializers.serialize('json', d)

    # plan_title = plan.title
    # plan_id = plan.id

    return JsonResponse(d, safe=False)


# проверка проекта
def check_plan(request, pk):
    plan = get_object_or_404(Plan, pk=pk)  # получили объект проекта
    scheme = json.loads(plan.scheme)
    elements = scheme['elements']

    # проверим, вся ли информация, необходимая для расчетов, задана
    errMsg = dict()
    for element in elements:
        if element['type'] == "wall":
            if element['wallType'] == '':
                errMsg[len(errMsg)] = {
                    'element': element['id'],
                    'message': "Нет информации о типе стены",
                }               


            # if element['bearType'] != "partition" and element['bearType'] != "bearing":
            #     errMsg[len(errMsg)] = {
            #         'element': element['id'],
            #         'message': "Не задано: это перегородка или несущая стена?",
            #     }

            # if element['liveType'] != "living" and element['liveType'] != "uninhabited":
            #     errMsg[len(errMsg)] = {
            #         'element': element['id'],
            #         'message': "Не задано: стена смежная с жилым помещением или нет",
            #     }

            # if element['bearType'] == "bearing":
            #     if element['outdoorType'] != "outdoor" and element['outdoorType'] != "indoor":
            #         errMsg[len(errMsg)] = {
            #             'element': element['id'],
            #             'message': "Не задано: несущая стена, смежная с нежилым помещением, внутренняя или ограждающая?",
            #         }

    # если ошибок нет, сохраняем в проекте, что он проверен
    if len(errMsg) == 0:
        errMsg[len(errMsg)] = {
            'element': 0,
            'message': "Ошибок нет",
        }
        plan.checked = True
        plan.save()

    return JsonResponse(errMsg)

# расчет проекта для выкладки на сайте: формирование записей в бд по каждому типу стенового материала, доступного в регионе
def calc_plan_for_catalog():
    # бежим по всем городам
    # бежим по стеновым материалам, доступным в городе
    # находим самого дешевого поставщика 
    # для найденного материала делаем расчет
    # заносим в базу строчку
    a = dict()
    return a

# актуализация цен на проекты
def act_plans_cost():
    # Бежим по всем проектам
    calc_plan_for_catalog()
    a = dict()
    return a

# выкладка проекта
def post_plan(request, pk):
    # plan = get_object_or_404(Plan, pk=pk)  # получили объект проекта
    # if (plan.checked == True): # продолжаем только если проект прошел проверку
    #     scheme = json.loads(plan.scheme)
    #     elements = scheme['elements']
    #     lines = scheme['lines']
    #     points = scheme['points']



    #     # проверим, вся ли информация, необходимая для расчетов, задана
    #     errMsg = dict()
    #     for element in elements:
    #         if element['type'] == "wall":
    #             if element['bearType'] != "partition" and element['bearType'] != "bearing":
    #                 errMsg[len(errMsg)] = {
    #                     'element': element['id'],
    #                     'message': "Не задано: это перегородка или несущая стена?",
    #                 }

    #             if element['liveType'] != "living" and element['liveType'] != "uninhabited":
    #                 errMsg[len(errMsg)] = {
    #                     'element': element['id'],
    #                     'message': "Не задано: стена смежная с жилым помещением или нет",
    #                 }

    #             if element['bearType'] == "bearing":
    #                 if element['outdoorType'] != "outdoor" and element['outdoorType'] != "indoor":
    #                     errMsg[len(errMsg)] = {
    #                         'element': element['id'],
    #                         'message': "Не задано: несущая стена, смежная с нежилым помещением, внутренняя или ограждающая?",
    #                     }

    #     # если ошибок нет, сохраняем в проекте, что он проверен
    #     if len(errMsg) == 0:
    #         errMsg[len(errMsg)] = {
    #             'element': 0,
    #             'message': "Ошибок нет",
    #         }
    #         plan.checked = True
    #         plan.save()

    return JsonResponse(errMsg)