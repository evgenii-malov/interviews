import pickle
import datetime
from datasources.openexc_datasource import build_rates_db


if __name__ == "__main__":
    rates = build_rates_db()

    filename = datetime.datetime.fromtimestamp(
                int(rates.timestamp)
            ).strftime('%Y-%m-%d')

    ts = rates.timestamp
    datafile = './pickle_data/{}.pickle'.format(filename)
    with open(datafile, 'wb') as f:
        pickle.dump(rates, f)


