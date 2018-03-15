from _decimal import Decimal

from domain import Rates

USD_BASE_RATES = {'CZK': Decimal(20.568423),
                  "EUR": Decimal(0.807146),
                  "USD": Decimal(1.0),
                  "PLN": Decimal(3.39753)}


def build_rates_db() -> Rates:
    return Rates("USD", USD_BASE_RATES, 1521014400)


#print(USD_BASE_RATES)
#print(Decimal(100)/Decimal('20.57'))