from django.contrib import admin
from portafolio_app.db.models import (RegionesStates, ProvincesTownships, CommunesTowns,
    Addresses, Categories, Cart, Documents, Customers, Emails, Employees,Genders, Inventory, 
    Persons, Offices, Payments, PaymentsTypes, Sales, SalesDetails, ShoppingSession, Products)
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth.models import Permission, Group
#from django.contrib.auth.admin import GroupAdmin


#class GroupAdmin(GroupAdmin):
#    # Update display table
#    list_display = ('name',)
#    # Filter 
#    list_filter = ('name',)
#    # 10 item per page
#    list_per_page = 10 

class ContentTypeAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('app_label', 'model')
    # Filter 
    list_filter = ('app_label',)
    # 10 item per page
    list_per_page = 10 

class PermissionAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'content_type', 'codename')
    # Filter 
    list_filter = ('name', 'content_type', 'codename')
    # 10 item per page
    list_per_page = 10 

class RegionesStatesAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'latitude', 'longitude')
    # Filter 
    list_filter = ('name',)
    # 10 item per page
    list_per_page = 10 

class ProvincesTownshipsAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'latitude', 'longitude', 'get_region_name')
    # Filter 
    list_filter = ('name', 'regiones_states')
    # 10 item per page
    list_per_page = 10 
    ## Update regions_states display by name
    def get_region_name(self, obj):
        return obj.regiones_states.name
    # Update column title by regions_states
    get_region_name.short_description = 'Region Name'
    # Update order field regions_states by Region Name
    get_region_name.admin_order_field = 'regiones_states__name'

class CommunesTownsAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'latitude', 'longitude', 'provinces_townships')
    # Filter 
    list_filter = ('name', 'provinces_townships')
    # 10 item per page
    list_per_page = 10 

class GendersAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'description',)
    # Filter 
    list_filter = ('name', 'description')
    # 10 item per page
    list_per_page = 10

class PaymentsTypesAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'description',)
    # Filter 
    list_filter = ('name', 'description')
    # 10 item per page
    list_per_page = 10

class AddressesAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'block', 'department', 'enumeration', 'latitude', 
                    'longitude', 'zipcode', 'communes_towns')
    list_per_page = 10
    
    
class OfficesAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'description', 'addresses')
    list_per_page = 10

class CategoriesAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'description')
    list_per_page = 10

class CartAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('price', 'quantity', 'products', 'shopping_session')
    list_per_page = 10

class DocumentsAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('name', 'description')
    list_per_page = 10

class PersonsAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('national_identification', 'names', 'lastname', 'second_lastname', 'genders')
    # Filter 
    list_filter = ('national_identification', 'names', 'lastname', 'second_lastname', 'genders')
    # 10 item per page
    list_per_page = 10 

class CustomersAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('persons', 'communes_towns')
    list_filter = ('persons', 'communes_towns')
    # 10 item per page
    list_per_page = 10

class EmailsAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('mail', 'persons')
    list_filter = ('mail', 'persons')
    # 10 item per page
    list_per_page = 10 

class EmployeesAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('persons', 'communes_towns', 'offices', 'user')
    list_filter = ('persons', 'communes_towns', 'offices', 'user')
    # 10 item per page
    list_per_page = 10   
    
class PaymentsAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('amount', 'payment_date', 'sales', 'customers', 'payments_types')
    # Filter 
    list_filter = ('amount', 'payment_date', 'sales', 'customers', 'payments_types')
    # 10 item per page
    list_per_page = 10

class InventoryAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('quantity', 'price', 'create_at', 'products',)
    # Filter 
    list_filter = ('quantity', 'price', 'create_at', 'products',)
    # 10 item per page
    list_per_page = 10

class InventoryAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('quantity', 'price', 'create_at', 'products',)
    # Filter 
    list_filter = ('quantity', 'price', 'create_at', 'products',)
    # 10 item per page
    list_per_page = 10 

class ShoppingSessionAdmin(admin.ModelAdmin):
    # Update display table
    list_display = ('customers', 'create_at', 'state',)
    # Filter 
    list_filter = ('customers', 'create_at', 'state',)
    # 10 item per page
    list_per_page = 10       

# UNREGISTER DEFAULT GROUP
#admin.site.unregister(Group) 
# REGISTER DJANGO MODELS
#admin.site.register(Group, GroupAdmin)
admin.site.register(Permission, PermissionAdmin)
admin.site.register(ContentType, ContentTypeAdmin)
# REGISTER CUSTOM MODELS
admin.site.register(RegionesStates, RegionesStatesAdmin)
admin.site.register(ProvincesTownships, ProvincesTownshipsAdmin)
admin.site.register(CommunesTowns, CommunesTownsAdmin)
admin.site.register(Genders, GendersAdmin)
admin.site.register(PaymentsTypes, PaymentsTypesAdmin)
admin.site.register(Addresses, AddressesAdmin)
admin.site.register(Offices, OfficesAdmin)
admin.site.register(Categories, CategoriesAdmin)
admin.site.register(Documents, DocumentsAdmin)
admin.site.register(Persons, PersonsAdmin)
admin.site.register(Customers, CustomersAdmin)
admin.site.register(Emails, EmailsAdmin)
admin.site.register(Employees, EmployeesAdmin)
admin.site.register(Inventory, InventoryAdmin)
admin.site.register(Payments, PaymentsAdmin)
admin.site.register(Cart, CartAdmin)
admin.site.register(ShoppingSession, ShoppingSessionAdmin)
admin.site.register(Sales)
admin.site.register(SalesDetails)
admin.site.register(Products)
