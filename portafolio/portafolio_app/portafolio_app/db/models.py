from django.db import models


class Addresses(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    block = models.CharField(max_length=50, blank=True, null=True)
    department = models.CharField(max_length=50, blank=True, null=True)
    enumeration = models.CharField(max_length=10, blank=True, null=True)
    latitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)
    longitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)
    zipcode = models.IntegerField(blank=True, null=True)
    communes_towns = models.ForeignKey('CommunesTowns', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'addresses'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Cart(models.Model):
    price = models.IntegerField(blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    products = models.OneToOneField('Products', models.DO_NOTHING, primary_key=True)  # The composite primary key (products_id, shopping_session_id) found, that is not supported. The first column is selected.
    shopping_session = models.ForeignKey('ShoppingSession', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'cart'
        unique_together = (('products', 'shopping_session'),)


class Categories(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=150, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'categories'


class CommunesTowns(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    latitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)
    longitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)
    provinces_townships = models.ForeignKey('ProvincesTownships', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'communes_towns'


class Customers(models.Model):
    persons = models.ForeignKey('Persons', models.DO_NOTHING, blank=True, null=True)
    communes_towns = models.ForeignKey(CommunesTowns, models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customers'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Documents(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=150, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'documents'


class Emails(models.Model):
    mail = models.CharField(max_length=150, blank=True, null=True)
    persons = models.ForeignKey('Persons', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'emails'


class Employees(models.Model):
    persons = models.ForeignKey('Persons', models.DO_NOTHING, blank=True, null=True)
    communes_towns = models.ForeignKey(CommunesTowns, models.DO_NOTHING, blank=True, null=True)
    offices = models.ForeignKey('Offices', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employees'


class Genders(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=150, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'genders'


class Inventory(models.Model):
    quantity = models.IntegerField(blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    create_at = models.DateTimeField(blank=True, null=True)
    products = models.ForeignKey('Products', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'inventory'


class Offices(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=150, blank=True, null=True)
    addresses = models.ForeignKey(Addresses, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'offices'


class Payments(models.Model):
    amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    payment_date = models.DateField(blank=True, null=True)
    sales = models.ForeignKey('Sales', models.DO_NOTHING, blank=True, null=True)
    customers = models.ForeignKey(Customers, models.DO_NOTHING, blank=True, null=True)
    payments_types = models.ForeignKey('PaymentsTypes', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'payments'


class PaymentsTypes(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=150, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'payments_types'


class Persons(models.Model):
    national_identification = models.CharField(max_length=30, blank=True, null=True)
    names = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=120, blank=True, null=True)
    second_lastname = models.CharField(max_length=120, blank=True, null=True)
    genders = models.ForeignKey(Genders, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'persons'


class Phones(models.Model):
    phone = models.CharField(max_length=150, blank=True, null=True)
    persons = models.ForeignKey(Persons, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'phones'


class Products(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=150, blank=True, null=True)
    sale_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    categories = models.ForeignKey(Categories, models.DO_NOTHING, blank=True, null=True)
    image = models.CharField(max_length=300, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'products'


class ProvincesTownships(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    latitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)
    longitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)
    regiones_states = models.ForeignKey('RegionesStates', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'provinces_townships'


class RegionesStates(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    latitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)
    longitude = models.DecimalField(max_digits=9, decimal_places=6, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'regiones_states'


class Sales(models.Model):
    created_at = models.DateTimeField(blank=True, null=True)
    government_taxes = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    state_taxes = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    total = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    documents = models.ForeignKey(Documents, models.DO_NOTHING, blank=True, null=True)
    offices = models.ForeignKey(Offices, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sales'


class SalesDetails(models.Model):
    price = models.IntegerField(blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    total = models.IntegerField(blank=True, null=True)
    sales = models.ForeignKey(Sales, models.DO_NOTHING, blank=True, null=True)
    products = models.ForeignKey(Products, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sales_details'


class ShoppingSession(models.Model):
    customers = models.ForeignKey(Customers, models.DO_NOTHING, blank=True, null=True)
    create_at = models.DateTimeField(blank=True, null=True)
    state = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shopping_session'