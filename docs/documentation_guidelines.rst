************************
Documentation Guidelines
************************

1. Every function, method and class has to **compulsorily have a docstring**. Docstrings are of two types, **single-line** and **multi-line**.

2. Single-line docstrings are used for very obvious cases, for example:
    .. code-block:: python
   
        def mark_present(student):
            """
                Marks Student Present
            """
            pass


3. Multi-Line Docstrings are used for not-so-obvious or complex cases,
    .. code-block:: python
   
        def some_very_complex_function(some_parameter):
            """
                Short Description of what you are doing

                Detail explanation of working.(perhaps a short paragraph)
            """
            pass


4. Apart from  Description, also mention these details in docstring:

     a) Created by, **{{ your_name }}** on **{{ date in DD/MM/YYYY format }}**
     b) Last Modification by, **{{ your_name }}** on **{{ date in DD/MM/YYYY format }}** [1]_

5. In a method's docstring, it's not necessary to write **"Created by.."**. Writing **"Created by.."** in class' docstring is enough. But **"Last Modification by..."** should not be omitted when making changes to that method.

6. A sample documentation example: [2]_ [3]_
    .. code-block:: python
    
        class SomeCoolClass(object):
            """
                Does some cool stuff.

                Created by, James Bond on 21/02/2014
            """

            def some_method(self, some_parameter):
            	"""
            		Do some amazing Calculation and return unbelievable results

            		A short paragraph describing **how** and/or **why** you are doing it.

            		:param some_parameter: brief description of what's the use of this parameter.
            		:return: brief description of what will the result be, (for eg. square of some_parameter)

            		Last Modified by, Jason Bourne on 04/09/2015
            	"""
            	pass


.. [1] add this if you are modifying someone else's code, if this already exists, just add your name and change the date

.. [2] Note that the tone of first line of documentation is imperative, not descriptive (ie. instead of writing "It does so and so", write "Do so and so"). Also the first line should answer **What** this piece of code is doing

.. [3] ":param some_parameter:" automatically shows up in PyCharm, you don't have to type it. This is necessary for Sphinx documentation generation, so is important