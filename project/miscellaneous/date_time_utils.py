intervals = (
    ('weeks', 604800),  # 60 * 60 * 24 * 7
    ('days', 86400),  # 60 * 60 * 24
    ('hours', 3600),  # 60 * 60
    ('minutes', 60),
    ('seconds', 1),
)


def display_time(seconds, granularity=2):
    result = []
    for name, count in intervals:
        value = seconds // count
        if value:
            seconds -= value * count
            if value == 1:
                name = name.rstrip('s')
            result.append("{} {}".format(int(value), name))
    return ', '.join(result[:granularity])


def __eta_time_to_slot_mapper(hour_digit):
    if 00 <= hour_digit < 13:
        return '10 AM - 1 PM'
    elif 13 <= hour_digit < 15:
        return '1 PM - 3 PM'
    elif 15 <= hour_digit < 19:
        return '3 PM - 6 PM'
    else:
        return '10 AM - 1 PM'


def display_eta(actual_eta_seconds):
    import datetime
    from datetime import timedelta
    buffer_eta = 7200  # 2hours
    eta_show = actual_eta_seconds + buffer_eta
    current_datetime = datetime.datetime.now()
    current_date = current_datetime.date()
    eta = current_datetime + timedelta(seconds=eta_show)
    eta_date = eta.date()
    eta_time_hour = int(eta.time().hour)
    if eta_date > current_date:
        pass
    return __eta_time_to_slot_mapper(eta_time_hour)
