from datasources.local_datasource import build_rates_db
from domain import conversion, Currency, Symbol, DomainValidationError, Currencies_symbols
import unittest
from decimal import Decimal
from itertools import product


class BaseTest(unittest.TestCase):
    def test_range(self):
        local_source_rates = build_rates_db()

        def test_pair(src_symbol, dst_symbol):
            # print(src_symbol,'->',dst_symbol)
            for amount in range(0, 1000):
                src = Currency(src_symbol, amount)
                dst = conversion(local_source_rates, src, Symbol(dst_symbol))
                # print(pln.amount)
                src2 = conversion(local_source_rates, dst, Symbol(src_symbol))
                # print(usd.amount - usd2.amount)
                print(src.amount, src_symbol, '>', dst_symbol, '>', src2.amount, src_symbol)
                self.assertTrue((src.amount - src2.amount) < Decimal(0.001))
                self.assertEqual(src.symbol.symbol, src.symbol.symbol)

        for f, t in ((f, t) for f, t in product(Currencies_symbols, Currencies_symbols) if f != t):
            test_pair(f, t)

    # self.assertEqual('foo'.upper(), 'FOO')
    #     self.assertTrue('FOO'.isupper())
    #     self.assertFalse('Foo'.isupper())

    def test_symbol(self):
        with self.assertRaises(DomainValidationError):
            Symbol('111')

    def test_amountl(self):
        with self.assertRaises(DomainValidationError):
            Currency(-12, 'USD')

    def test_fixed(self):
        local_source_rates = build_rates_db()
        self.assertEqual(conversion(local_source_rates, Currency(Symbol('CZK'), 20.568423), Symbol('USD')).amount, 1)


if __name__ == '__main__':
    unittest.main()
