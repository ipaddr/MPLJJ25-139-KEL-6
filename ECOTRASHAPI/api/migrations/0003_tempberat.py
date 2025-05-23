# Generated by Django 5.2.1 on 2025-05-15 08:34

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_trashprice_kategori_trashprice_poin_per_kg'),
    ]

    operations = [
        migrations.CreateModel(
            name='TempBerat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('berat', models.DecimalField(decimal_places=2, max_digits=6)),
                ('waktu', models.DateTimeField(auto_now=True)),
                ('nasabah', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='data_berat_sementara', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
