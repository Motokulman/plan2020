from django.shortcuts import render
from graphics.models import *

def set_texture(request, texture_id):
    """Сохранение, изменение texture"""
    return_dict = dict()
    if request.POST:
        data = request.POST
        e = get_object_or_404(Texture, id=texture_id)
        e.json = data.get("json")
        try:
            e.save()
            return_dict={"id":texture_id,"status":"save", "json": data }
        except:
            return_dict = {"id": texture_id, "status": "false"}
    else:
        t = Texture.objects.get(id=texture_id)
        return_dict={"id":texture_id,"json":t.json}
    return JsonResponse(return_dict)
