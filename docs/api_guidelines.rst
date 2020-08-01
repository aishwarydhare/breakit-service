**************
API Guidelines
**************

API's have to follow **REST Guidelines**, key points include:

1. Proper Use of HTTP status codes, for example:

     a) 500 for exception
     b) 400 for invalid request
     c) 401 for invalid authentication credentials
     d) 403 for unauthorised access, etc.
        
2. Proper use of HTTP methods

   	 a) For an API that fetches some data, the method should be **GET**.
   	 b) If API is to create new object in database, the method should be **POST**.
   	 c) Likewise, if API is to update an existing object in database, the method should be **PATCH/PUT**.  (and so on)


3. If you serve a 5XX or a 4XX (excluding 403) response, make sure to contain a "message" parameter with a user-friendly message (if possible, or exception message)
    Example:
        .. code-block:: python

           {
               'message': 'Failed to send Email, please try again.'
           }


4. the format of any datetime field in API should be strictly in **YYYY-MM-DDTHH:MM:SS**.

5. For more guidelines refer this `slide`_ and this `webpage`_ 

.. _webpage: http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api

.. _slide: http://www.slideshare.net/AshishGore3/dt-meetup-django-rest-framework-vs-tasty-pie?qid=0b9e2741-e11f-48fd-b722-3637d3229492&v=qf1&b=&from_search=1