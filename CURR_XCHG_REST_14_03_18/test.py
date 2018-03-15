from domain import conversion, Currency, Symbol

if __name__ == "__main__":
    from datasources.local_datasource import build_rates_db
    local_source_rates = build_rates_db()
    print(conversion(local_source_rates, Currency("CZK", 100), Symbol("PLN")))
