from django import forms
from django.forms import ModelForm
from land.models import Land, GeologicalSurvey
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404

class LandCreateForm(forms.ModelForm):
    class Meta:
        model = Land
        # exclude = ('owner',)
        fields = 'cadastral_number', 'cottage_community', 

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('owner', None)
        self.user_id = get_object_or_404(User, username=self.user) 
        super(LandCreateForm, self).__init__(*args, **kwargs)

    def clean_cadastral_number(self):
        cadastral_number = self.cleaned_data['cadastral_number']
        if Land.objects.filter(owner=self.user_id, cadastral_number=cadastral_number).exists():
            raise forms.ValidationError("У Вас уже есть участок с таким кадастровым номером")
        return cadastral_number


class GeologicalSurveyCreateForm(forms.ModelForm):
    class Meta:
        model = GeologicalSurvey
        fields = 'land', 'legal_entity', 'customer', 

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('contractor', None)
        super(GeologicalSurveyCreateForm, self).__init__(*args, **kwargs)
