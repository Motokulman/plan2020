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
