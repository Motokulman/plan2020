from django.contrib import admin
from .models import Land, CottageCommunity, GeologicalSurvey, SurveyWell, EngineeringLayer

admin.site.register(Land)
admin.site.register(CottageCommunity)
admin.site.register(GeologicalSurvey)
admin.site.register(SurveyWell)
admin.site.register(EngineeringLayer)

