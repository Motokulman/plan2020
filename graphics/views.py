from django.shortcuts import render
from graphics.models import *
import json
from django.http import HttpResponse, JsonResponse
from django.core import serializers
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.shortcuts import render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import generic
from django.contrib.auth.decorators import permission_required
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from graphics.forms import TextureCreateForm, TextureTypeCreateForm
from django.contrib.auth.models import User

def set_texture(request, texture_id):
    """Сохранение, изменение texture"""
    return_dict = dict()
    if request.POST:
        data = request.POST
        e = get_object_or_404(Texture, id=texture_id)
        e.json = data.get("json")
        e.anyfile = request.FILES
        try:
            e.save()
            return_dict={"id":texture_id,"status":"save", "json": data }
        except:
            return_dict = {"id": texture_id, "status": "false"}
    else:
        t = Texture.objects.get(id=texture_id)
        return_dict={"id":texture_id,"json":t.json}
    return JsonResponse(return_dict)

# создание тектуры методами django
class TextureCreateView(CreateView):
    model = Texture
    template_name = 'texture/texture_form.html'
    form_class = TextureCreateForm

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.author = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_initial(self, *args, **kwargs):
        initial = super(TextureCreateView, self).get_initial(**kwargs)
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(TextureCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['author'] = self.request.user
        return kwargs

class TextureListView(generic.ListView):
    model = Texture
    template_name = 'texture/texture_list.html'


class TextureDetailView(generic.DetailView):
    model = Texture
    template_name = 'texture/texture_detail.html'

class TextureDelete(DeleteView):
    model = Texture
    template_name = 'texture/texture_confirm_delete.html'
    success_url = reverse_lazy('textures')



# создание типа тектуры методами django
class TextureTypeCreateView(CreateView):
    model = TextureType
    template_name = 'texture_type/texture_type_form.html'
    form_class = TextureTypeCreateForm

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

class TextureTypeListView(generic.ListView):
    model = TextureType
    template_name = 'texture_type/texture_type_list.html'


class TextureTypeDetailView(generic.DetailView):
    model = TextureType
    template_name = 'texture_type/texture_type_detail.html'

class TextureTypeDelete(DeleteView):
    model = TextureType
    template_name = 'texture_type/texture_type_confirm_delete.html'
    success_url = reverse_lazy('texture_types')


def graphics(request):
    # user = User.objects.filter(username=request.user.username)
    # user = request.user
    # my_plans_list = Plan.objects.filter(author=request.user)
    # my_lands_list = Land.objects.filter(owner=request.user)
    # my_surveys_list = Survey.objects.filter(contractor=request.user)

    context = {
    #     'my_plans_list': my_plans_list,
    #     'my_lands_list': my_lands_list,
    #     'my_surveys_list': my_surveys_list,
    }
    return render(request, 'graphics.html', context)