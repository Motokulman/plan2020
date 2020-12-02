from django import forms
from django.forms import ModelForm
from land.models import Land, Survey, Well, Layer
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


class SurveyCreateForm(forms.ModelForm):
    class Meta:
        model = Survey
        fields = 'land', 'legal_entity', 'customer', 

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('contractor', None)
        super(SurveyCreateForm, self).__init__(*args, **kwargs)


class WellCreateForm(forms.ModelForm):
    class Meta:
        model = Well
        fields = ('number', 'height', 'Hw0', 'Hw1',)

    # def __init__(self, *args, **kwargs):
    #     self.survey = kwargs.pop('survey', None)
    #     super(WellCreateForm, self).__init__(*args, **kwargs)


class LayerCreateForm(forms.ModelForm):
    class Meta:
        model = Layer
        fields = ('number', 'power', 'non_consolidated', 'debris', 'W','WP','WL', 'Ros', 'Rod', 'm', 'm250', 'm125', 'm063', 'm0315', 'm016')

    # def __init__(self, *args, **kwargs):
    #     self.well = kwargs.pop('well', None)
    #     super(LayerCreateForm, self).__init__(*args, **kwargs)


# class WellCreateForm(forms.Form):
#     number = forms.IntegerField(unique=True, verbose_name='Номер скважины')    
#     height = forms.IntegerField(default=0, verbose_name='Высота в сантиметрах устья скважины относительно других скважин, если есть. Самая низкая = 0')