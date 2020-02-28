from catalog.models import Brand
from catalog.models import SubBrand_1
from catalog.models import SubBrand_2
from catalog.models import Algorithm
from catalog.models import Factory
from catalog.models import City
from catalog.models import Country
from catalog.models import Region
from catalog.models import MarkM
from catalog.models import MarkD
from catalog.models import MarkF
from catalog.models import ClassB
from catalog.models import ClassАverageDensity
from catalog.models import NFSize
from catalog.models import RockWallMaterialUnit
from catalog.models import Plan
from catalog.models import Profile
from catalog.models import RockWallMaterialPricePosition
from catalog.models import PileGrillageFoundationWorkPrices
from catalog.models import Provider
from catalog.models import Activity
from catalog.models import Outlet


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
from django.http import HttpResponse, JsonResponse
from django.core import serializers
from django.contrib.auth.decorators import login_required
from catalog.forms import UserRegistrationForm, UserEditForm, ProfileEditForm


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
    model = RockWallMaterialPricePosition
    template_name = 'catalog/wall_materials_prices.html'
    paginate_by = 100

    def get_queryset(self):
        return RockWallMaterialPricePosition.objects.filter(owner=self.request.user)


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

# Нащи вычисления:
def calc(request):
    indoor_temperature = 20 # температура по умолчанию внутри помещения
    profile = Profile.objects.get(user__username=request.user) # получаем профиль текущего пользователя
    city_name = profile.city # кзнаем из профиля город пользователя
    city = City.objects.get(name=city_name) # получаем объект города   
    gsop = int((indoor_temperature - city.heating_period_temperature)*city.heating_period_duration) # определяем ГСОП https://www.teplo-info.com/snip/otopitelniy_period
    R_req = {} # определяем тепловое сопротивленеие      
    R_req["wall"] = round(0.00035*gsop + 1.4, 1)
    R_req["roof"] = round(0.0005*gsop + 2.2, 1)
    R_req["floor"] = round(0.00045*gsop + 1.9, 1)
    # определяем тепловое сопротивленеие для окон.Оно нелинейно меняестся: СП 50.13330.2012 Тепловая защита зданий., табл 4
    if gsop <= 6000:
        R_req["window"] = round(0.000075*gsop + 0.15, 2)
    elif gsop < 8000:
        R_req["window"] = round(0.0000833333*gsop + 0.1, 2)    
    else:
        R_req["window"] = round(0.00008125*gsop + 0.05, 2)

    return gsop, R_req


def edit_scheme(request, pk):
    """View function for editing scheme of a specific plan"""

    plan = get_object_or_404(Plan, pk=pk)
    plan_title = plan.title
    plan_id = plan.id

    a, test = calc(request)

    context = {
        'plan_title': plan_title,
        'plan_id': plan_id,
        'test': test,
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

# Попытка обновить ДОМ без перезагрузки
def answer_me(request, pk):
    field = request.GET.get('inputValue')
    # field = pk
    answer = 'You typed: ' + str(field)

    data = {
        'respond': answer
            }
    return JsonResponse(data)
