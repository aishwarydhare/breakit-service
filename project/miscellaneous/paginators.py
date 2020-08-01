from collections import OrderedDict

from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

__author__ = 'amrullahzunzunia'


class CustomPagination(PageNumberPagination):
    def get_paginated_response(self, data):
        next_url = ''
        previous_url = ''
        url = self.request.build_absolute_uri()
        if 'http' in url:
            if self.get_next_link():
                if 'http' in self.get_next_link():
                    next_url = self.get_next_link()
            if self.get_previous_link():
                if 'http' in self.get_previous_link():
                    previous_url = self.get_previous_link()
        elif 'https' in url:
            if self.get_next_link():
                if 'https' not in self.get_next_link():
                    next_url = 'https' + self.get_next_link().split('http')[1]
            if self.get_previous_link():
                if 'https' not in self.get_previous_link():
                    previous_url = 'https' + self.get_previous_link().split('http')[1]

        if '%2C' in next_url:
            next_url = ",".join(next_url.split('%2C'))
        if '%2C' in previous_url:
            previous_url = ",".join(previous_url.split('%2C'))
        meta = {
            "count": self.page.paginator.count,
            "next": next_url,
            "previous": previous_url
        }
        response_data = OrderedDict([('meta', meta), ('data', data)])
        return Response(response_data)
        # return Response(OrderedDict([
        #     ('meta', [
        #         ('count', self.page.paginator.count),
        #         ('next', self.get_next_link()),
        #         ('previous', self.get_previous_link()),
        #     ]),
        #     ('data', data)
        # ]))


class FiftyPagination(CustomPagination):
    page_size = 50


class ThirtyPagination(CustomPagination):
    page_size = 30


class HundredPagination(CustomPagination):
    page_size = 100


class TwoHundredPagination(CustomPagination):
    page_size = 200
