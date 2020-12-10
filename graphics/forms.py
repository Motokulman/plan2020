from django import forms
from django.forms import ModelForm
from .models import Texture, TextureType
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404

class TextureCreateForm(forms.ModelForm):
    class Meta:
        model = Texture
        exclude = ('author',)
        # fields = 'cadastral_number', 'cottage_community', 
        # fields = '__all__'

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('author', None)
        self.user_id = get_object_or_404(User, username=self.user) 
        super(TextureCreateForm, self).__init__(*args, **kwargs)

    def clean_name(self):
        name = self.cleaned_data['name']
        if Texture.objects.filter(name=name).exists():
            raise forms.ValidationError("Уже есть текстура с таким названием. Выберите другое")
        return name


class TextureTypeCreateForm(forms.ModelForm):
    class Meta:
        model = TextureType
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super(TextureTypeCreateForm, self).__init__(*args, **kwargs)

    def clean_name(self):
        name = self.cleaned_data['name']
        if TextureType.objects.filter(name=name).exists():
            raise forms.ValidationError("Уже есть тип текстуры с таким названием. Назовите ее как-нибудь по другому, пожалуйста.")
        return name