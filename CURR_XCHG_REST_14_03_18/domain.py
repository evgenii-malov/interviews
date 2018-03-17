from decimal import Decimal

import datetime

Currencies_symbols = ["CZK", "EUR", "USD", "PLN"]
Currencies_symbols_lables = {"CZK": "Czech koruna", "EUR": "EURO", "USD": "US dollar", "PLN": "Polish złoty"}


class DomainValidationError(Exception):
    pass


class Currency:
    def __init__(self, symbol, amount):

        self.symbol = Symbol(symbol) if not isinstance(symbol, Symbol) else symbol

        try:
            self.amount = Decimal(amount)
        except Exception:
            raise DomainValidationError('Wrong currency amount value {} use decimal number'.format(amount))

        if self.amount < 0:
            raise DomainValidationError('Wrong currency amount value {} use positive number'.format(amount))

    def __str__(self):
        return str(self.symbol) + " : " + str(self.amount)


class Symbol:
    def __init__(self, symbol):
        if symbol not in Currencies_symbols:
            raise DomainValidationError('Wrong curr {} use only {}'.format(symbol, Currencies_symbols))

        self.symbol = symbol

    def __str__(self):
        return "{} {}".format(self.symbol, Currencies_symbols_lables.get(self.symbol, self.symbol))


class Rates:
    def __init__(self, base, base_rates, timestamp):
        self.base = base
        self.base_rates = base_rates
        self.timestamp = timestamp

    def get_rate(self, symbol: Symbol):
        if not isinstance(symbol, Symbol):
            raise DomainValidationError('must be Symbol instance')
        try:
            return self.base_rates[symbol.symbol]
        except KeyError:
            raise DomainValidationError('Symbol rate {} not found in {}'.format(symbol.symbol, self.base_rates))

    def __str__(self):
        t = datetime.datetime.fromtimestamp(
            int(self.timestamp)
        ).strftime('%Y-%m-%d %H:%M:%S')
        return "Rates DB for {} at {}".format(self.base, t)


def conversion(rates_db: Rates, curr_from: Currency, to_symbol: Symbol) -> Currency:
    # print(rates_db.__class__,isinstance(rates_db, Rates))
    if not isinstance(rates_db, Rates):
        raise DomainValidationError('rates_db must be Rates instance, got {}'.format(rates_db))

    if curr_from.symbol.symbol == to_symbol.symbol:
        raise DomainValidationError('Use different symbols, got same {}'.format(to_symbol.symbol))

    base_eqvivalent = curr_from.amount / rates_db.get_rate(curr_from.symbol)
    to_amount = base_eqvivalent * rates_db.get_rate(to_symbol)
    return Currency(to_symbol, to_amount)
