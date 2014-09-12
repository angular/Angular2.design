# Insights

# Directives vs Services

You can not accidently inject a wrong Service because you have to reffer to it by type. 
But you can accidently trigger a component. For this reason injection of service types
crosses shadow boundries, but directives configuration for compiler does not

New Modules (ie new services) can only be introduced by templates and therefore is done
implicitly on shadow boundries, or explicitly by directive such as ng-view.

# ng-include

When loading templates dynamically <ng-include> needs to compile the template. 
In order to compile we need to know which directives are active. This means that
directive enumeration needs to be with template not with container (such as ng-include
or @Component)


# Repo

Single repo for both JS and Dart and broken down by subdirectories representing parts
which can be swaped out and published independently.