from django.shortcuts import render
from catalog.models import Plan, PileGrillageFoundationWorkPrices, WallMaterialType, ClassBLight, MarkD, MarkM, RockWallMaterialStandardSize, Application, ProductBrand, TradeMark, TradeMarkSeries, DirectProducer, ProviderActivityType, TaxSystemType, Provider, ProviderOutlet, City, RockWallMaterialUnit, RockWallMaterialPricePosition
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import generic
from django.contrib.auth.decorators import permission_required
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy


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

class WallMaterialPricesListView(LoginRequiredMixin,generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    model = RockWallMaterialPricePosition
    template_name ='catalog/wall_materials_prices.html'
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