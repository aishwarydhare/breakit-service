from config.settings import ROUTE_SERVICE_HOST
from miscellaneous.logging_utils import show_error


class __GenericRouteEngineResponse:
    distance_str = None
    distance_val = None  # in meters
    duration_str = None
    duration_val = None  # in seconds

    def __init__(self, dist_str, dist_val, dur_str, dur_val):
        self.distance_str = dist_str
        self.distance_val = dist_val
        self.duration_str = dur_str
        self.duration_val = dur_val

    K_DIST_STR = 'distance_str'
    K_DIST_VAL = 'distance_val'
    K_DUR_STR = 'duration_str'
    K_DUR_VAL = 'duration_val'


def get_eta(origin_lat, origin_lon, dest_lat, dest_lon, eta_engine=1) -> __GenericRouteEngineResponse:
    try:
        if eta_engine == 1:
            import requests
            import json
            url = 'http://' + ROUTE_SERVICE_HOST + '/route'
            source_point = str(origin_lat) + ',' + str(origin_lon)
            dest_point = str(dest_lat) + ',' + str(dest_lon)
            querystring = {"point": [source_point, dest_point]}
            ret = requests.get(url, params=querystring, timeout=6)
            if ret.status_code == 200:
                response_data = ret.json()
                distance_time_data = response_data['paths'][0]
                duration_val = distance_time_data['time'] / 1000
                return __GenericRouteEngineResponse(
                    dist_str=str(distance_time_data['distance']),
                    dist_val=distance_time_data['distance'],
                    dur_str=str(distance_time_data['time']),
                    dur_val=duration_val)
            else:
                show_error("!!!!!!!! ERROR IN ETA ENGINE !!!!!!!!")
                return -1
                # return __GenericRouteEngineResponse(
                #     dist_str=None,
                #     dist_val=None,
                #     dur_str=None,
                #     dur_val=None)

        elif eta_engine == 2:
            # todo: implement google ETA Calculation here
            pass
    except Exception as e:
        print(e)
        return -1
