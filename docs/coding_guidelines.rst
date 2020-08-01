*****************
Coding Guidelines
*****************

1. **DO NOT** use tabs for indentation, use multiples of 4 spaces
2. Avoid **abbreviations** in names of class, variable, method, function, method etc. Instead of:
    .. code-block:: python
   
        auser = "something"

   be more verbose:
    .. code-block:: python
    
        is_admin_user = "something"

    Abbreviations may save you some micro-seconds while typing, but down the road, they will waste hours while trying to understand that piece of code.

3. Class names should be in **CamelCase**, for example:
    .. code-block:: python
   
        class SomeClass:  # should not be some_class, someClass, Some_Class or any other way
            pass

   Model class names have one more rule, they should be singular noun too.
    .. code-block:: python
    
        class User(models.Model):  # should not be Users
            pass

4. Variable, function, method and package names should be in **snake_case**, for example:
    .. code-block:: python
    
        some_variable = "some value"

        def amazing_function(some_parameter):  # avoid amazingFunction(), this is not Java!
            pass

5. Constants should be in **SCREAMING_SNAKE_CASE**, example:
    .. code-block:: python
   
        class SomeClass(models.Model):
            INFANT = 1
            TEENAGER = 13
            ADULT = 20  # note these

            AGE_GROUP_CHOICES = (  # note this
                (INFANT, 'Infant'),
                (TEENAGER, 'Teenager'),
                (ADULT, 'Adult')
            )

6. Avoid wildcard import statements.
    .. code-block:: python
   
        from some_module import SomeStuff, SomeMoreStuff  # avoid import *


7. Also use relative imports wherever possible (especially in apps)For example, if you are importing some model from authentication/models.py in authentication/views.py:
    .. code-block:: python
   
        # authentication/views.py
        # instead of
        from authentication.models import User
        # do this
        from .models import User

8. Strive to keep **cyclomatic complexity** of a method or function as **low** as possible. [1]_ 


9. Write small functions. *Break large functions into small functions*. Apart from enhancing readability, it also helps manage cyclomatic complexity. For example:

    .. code-block:: python
    
        def greet_user(user):
            if user.prefers_being_greeted:
                if its_morning:
                    return "Good Morning"
                else:
                    return "Good Evening"
            else:
                return ""


   can be refactored as:
    .. code-block:: python
    
        def greet_user(user):
            if user.prefers_being_greeted:
                return get_greeting_message()
            else:
                return ""

        def get_greeting_message():
            return "Good Morning" if its_morning else "Good Evening"


10. Avoid *broad Exception clauses*, try to catch **specific exceptions** as much as possible. For example:
     .. code-block:: python
    
         try:
             User.objects.get(name="username")
         except Exception:  # bad idea since along with User.DoesNotExist, even User.MultipleObjectsReturned exception got masked
             do_something_if_you_couldnt_get()

11. Read **PEP8 guidelines** for more information. Also note PyCharm helps you adhere to PEP8 guidelines, just watch out for those wavy underlines.
    
12. Use Named Url Patterns, and use namespaces while including an app's urls in root urlconfig.



.. [1] Cyclomatic complexity is defined as the no. of independent paths a piece of code may take to reach the last line. For example if a function contains an if else block, the cyclomatic complexity is 2 since the execution flow may either go through if block or else block, so there are two independent paths. Nested if statements can increase the complexity exponentially, besides making the function incomprehensible and difficult to write unit tests for.
