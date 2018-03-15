from decimal import Decimal
from domain import Rates
import json
import urllib.request

API_KEY = 'c15dab3a23b14a1d82ef0ab60b3b417d'
URL = "https://openexchangerates.org/api/latest.json?app_id={}".format(API_KEY)


def build_rates_db() -> Rates:
    req = urllib.request.Request(URL)
    with urllib.request.urlopen(req) as response:
        result = json.loads(response.read().decode('utf-8'))

    rates = result['rates']
    base = result['base']
    timestamp = result['timestamp']

    rt = {k: Decimal(rates[k]) for k in rates}
    openexc_rates = Rates(base, rt, timestamp)
    #print(openexc_rates)
    return openexc_rates

