import random

from geopy.distance import distance


def __get_random_number(min_num, max_num):
    return random.randrange(min_num, max_num, 1)


def get_4_digit_random_number():
    return __get_random_number(1000, 9999)


ones = ["", "one ", "two ", "three ", "four ", "five ",
        "six ", "seven ", "eight ", "nine "]
tens = ["ten ", "eleven ", "twelve ", "thirteen ", "fourteen ",
        "fifteen ", "sixteen ", "seventeen ", "eighteen ", "nineteen "]
twenties = ["", "", "twenty ", "thirty ", "forty ",
            "fifty ", "sixty ", "seventy ", "eighty ", "ninety "]
thousands = ["", "thousand ", "lacs ", "crore ", "trillion ",
             "quadrillion ", "quintillion ", "sextillion ", "septillion ", "octillion ",
             "nonillion ", "decillion ", "undecillion ", "duodecillion ", "tredecillion ",
             "quattuordecillion ", "quindecillion", "sexdecillion ", "septendecillion ",
             "octodecillion ", "novemdecillion ", "vigintillion "]


def int2word(n):
    try:
        """
        convert an integer number n into a string of english words
        """
        # break the number into groups of 3 digits using slicing
        # each group representing hundred, thousand, million, billion, ...
        n3 = []
        r1 = ""
        # create numeric string
        ns = str(n)
        for k in range(3, 33, 3):
            r = ns[-k:]
            q = len(ns) - k
            # break if end of ns has been reached
            if q < -2:
                break
            else:
                if q >= 0:
                    n3.append(int(r[:3]))
                elif q >= -1:
                    n3.append(int(r[:2]))
                elif q >= -2:
                    n3.append(int(r[:1]))
            r1 = r

        # print n3  # test

        # break each group of 3 digits into
        # ones, tens/twenties, hundreds
        # and form a string
        nw = ""
        for i, x in enumerate(n3):
            b1 = x % 10
            b2 = (x % 100) // 10
            b3 = (x % 1000) // 100
            # print b1, b2, b3  # test
            if x == 0:
                continue  # skip
            else:
                t = thousands[i]
            if b2 == 0:
                nw = ones[b1] + t + nw
            elif b2 == 1:
                nw = tens[b1] + t + nw
            elif b2 > 1:
                nw = twenties[b2] + ones[b1] + t + nw
            if b3 > 0:
                nw = ones[b3] + "hundred " + nw
        return nw
    except Exception as e:
        print(e)
        import os, sys
        exc_type, exc_obj, exc_tb = sys.exc_info()
        fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        print(exc_type, fname, exc_tb.tb_lineno)
        # return HttpResponse("something went wrong", content_type='application/text', status=500)


def get_random_with_n_digits(n):
    from random import randint
    range_start = 10 ** (n - 1)
    range_end = (10 ** n) - 1
    return randint(range_start, range_end)


def get_distance_between_lat_lon(source_lat, source_lon, dest_lat, dest_lon):
    source = (dest_lat, dest_lon)
    dest = (source_lat, source_lon)
    return distance(source, dest).km
