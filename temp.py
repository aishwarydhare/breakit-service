from miscellaneous.route_engine_helper import get_eta

result = get_eta(23.0351322, 75.2327951, 23.8235219, 75.9843863)
print(result.distance_str, result.distance_val, result.duration_str, result.duration_val)
