from django.db import models


class Authors(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'authors'


class Books(models.Model):
    article = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    unit = models.ForeignKey('Unit', models.DO_NOTHING, blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    producer = models.ForeignKey('Producers', models.DO_NOTHING, blank=True, null=True)
    category = models.ForeignKey('Categories', models.DO_NOTHING, blank=True, null=True)
    current_discount = models.IntegerField(blank=True, null=True)
    quantity_in_stock = models.IntegerField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    photo = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'books'


class BooksAuthors(models.Model):
    book = models.ForeignKey(Books, models.DO_NOTHING)
    author = models.ForeignKey(Authors, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'books_authors'


class BooksInOrders(models.Model):
    order = models.ForeignKey('Orders', models.DO_NOTHING, blank=True, null=True)
    book = models.ForeignKey(Books, models.DO_NOTHING, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'books_in_orders'


class Categories(models.Model):
    name = models.TextField(db_collation='C', blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'categories'


class OrderStatus(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order_status'


class Orders(models.Model):
    order_date = models.DateField(blank=True, null=True)
    delivery_date = models.DateField(blank=True, null=True)
    pickup_point = models.ForeignKey('PickupPoints', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    code_for_receive = models.IntegerField(blank=True, null=True)
    order_status = models.ForeignKey(OrderStatus, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orders'


class PickupPoints(models.Model):
    index = models.IntegerField(blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    street = models.CharField(max_length=255, blank=True, null=True)
    building = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pickup_points'


class Producers(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'producers'


class Roles(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'roles'


class Unit(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'unit'


class Users(models.Model):
    role = models.ForeignKey(Roles, models.DO_NOTHING, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    father_name = models.CharField(max_length=255, blank=True, null=True)
    mail = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'
