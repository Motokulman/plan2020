from django import forms
from django.forms import ModelForm
from catalog.models import Plan
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404

class PlanCreateForm(forms.ModelForm):
    class Meta:
        model = Plan
        exclude = ('author',)
        fields = 'title',

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('author')
        self.user_id = get_object_or_404(User, username=self.user)
        super(PlanCreateForm, self).__init__(*args, **kwargs)

    def clean_title(self):
        title = self.cleaned_data['title']
        if Plan.objects.filter(author=self.user_id, title=title).exists():
            raise forms.ValidationError("Уже есть проект с таким названием. Назовите его как-нибудь по другому, пожалуйста.")
        return title