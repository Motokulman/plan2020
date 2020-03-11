from catalog.models import *
from catalog.modules import calc
# from catalog.modules import porotherm44




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
import pickle



def index(request):
    """View function for home page of site."""

    # # Generate counts of some of the main objects
    # num_books = Book.objects.all().count()
    # num_instances = BookInstance.objects.all().count()

    # # Available books (status = 'a')
    # num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # # The 'all()' is implied by default.
    # num_authors = Author.objects.count()

    context = {
        # 'num_books': num_books,
        # 'num_instances': num_instances,
        # 'num_instances_available': num_instances_available,
        # 'num_authors': num_authors,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)


class WallMaterialPricesListView(LoginRequiredMixin, generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    model = RockWallMaterialPrice
    template_name = 'catalog/wall_materials_prices.html'
    paginate_by = 100

    def get_queryset(self):
        return RockWallMaterialPrice.objects.filter(owner=self.request.user)


class PileGrillageFoundationWorkPricesDetailView(generic.DetailView):
    model = PileGrillageFoundationWorkPrices


def works_content_list(request):
    """View function for списка работ/услуг, оказываемых данных подрядчиком."""

    context = {

    }

    return render(request, 'works_content_list.html', context=context)


class PlanListView(generic.ListView):
    model = Plan


class PlanDetailView(generic.DetailView):
    model = Plan


class PlanCreate(CreateView):
    model = Plan
    fields = '__all__'
    initial = {'title': 'New plan'}


class PlanDelete(DeleteView):
    model = Plan
    success_url = reverse_lazy('plans')




def edit_scheme(request, pk):
    """View function for editing scheme of a specific plan"""

    plan = get_object_or_404(Plan, pk=pk)
    plan_title = plan.title
    plan_id = plan.id

    # a, b = calc.calc(request)
    plan_scheme = plan.scheme
    if plan_scheme != None:
        # test = calc.calc_variants(request, pk)
        # city = get_city()
        algorithms = calc.get_algorithms(calc.get_materials(calc.get_city(request))) # получили уникальные алгоритмы
        algorithms = serializers.serialize('json', algorithms)
    else:
        algorithms = "Нет данных"

    context = {
        'plan_title': plan_title,
        'plan_id': plan_id,
        'test': algorithms,
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


# Создаем нового пользователя
def register(request):
    if request.method == 'POST':
        user_form = UserRegistrationForm(request.POST)
        if user_form.is_valid():
            # Создаем нового пользователя, но пока не сохраняем в базу данных.
            new_user = user_form.save(commit=False)
            # Задаем пользователю зашифрованный пароль.
            new_user.set_password(user_form.cleaned_data['password'])
            # Сохраняем пользователя в базе данных.
            new_user.save()
            # Создание профиля пользователя
            Profile.objects.create(user=new_user)
            return render(request, 'register/register_done.html', {'new_user': new_user})
    else:
        user_form = UserRegistrationForm()
    return render(request, 'register/register.html', {'user_form': user_form})


# Изменение профиля пользователя
@login_required
def edit(request):
    if request.method == 'POST':
        user_form = UserEditForm(instance=request.user,data=request.POST)
        profile_form = ProfileEditForm(instance=request.user.profile, data=request.POST, files=request.FILES)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
    else:
        user_form = UserEditForm(instance=request.user)
        profile_form = ProfileEditForm(instance=request.user.profile)
    return render(request,'register/edit.html', {'user_form': user_form,'profile_form': profile_form})

def set_scheme(request, pk):
    """Сохранение, изменение схемы"""
    return_dict = dict()
    data = request.POST
    e = get_object_or_404(Plan, pk=pk)
    e.scheme = data.get("d")
    e.save()

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