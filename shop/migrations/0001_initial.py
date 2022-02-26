# Generated by Django 4.0.1 on 2022-01-26 12:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Products',
            fields=[
                ('product_id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('product_name', models.CharField(max_length=200)),
                ('product_price', models.PositiveIntegerField()),
                ('product_mfd', models.DateField()),
                ('product_epd', models.DateField()),
                ('product_quantity', models.PositiveIntegerField()),
            ],
        ),
    ]