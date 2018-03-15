import pickle
import datetime
import domain
from aiohttp import web
import json
import asyncio
import os
#LAST_UPLOADED_DAY = None
#RATES_DB = None

def upload_rates():
    today = datetime.datetime.now().strftime('%Y-%m-%d')
    datafile = './pickle_data/{}.pickle'.format(today)
    with open(datafile, 'rb') as f:
        rates_db = pickle.load(f)
    return rates_db


async def handle(request):
    from_symbol = request.query.get('from', None)
    from_amount = request.query.get('amount', None)
    to_symbol = request.query.get('to', None)
    if not (from_amount and from_symbol and to_symbol):
        response_obj = {'result': 'error',
                        'error': 'please provide correct query, for example /?from=CZK&amount=100&to=PLN'}
        return web.Response(text=json.dumps(response_obj))

    try:
        to_amount = domain.conversion(request.app['rates_db'], domain.Currency(from_symbol, from_amount), domain.Symbol(to_symbol))
        # raise Exception()
        response_obj = {'result': 'succes', 'from': from_symbol, 'from_amount': from_amount, 'to': to_symbol,
                        'to_amount': str(to_amount.amount)}
    except domain.DomainValidationError as e:
        response_obj = {'result': 'error', 'error': str(e), 'from': from_symbol, 'from_amount': from_amount,
                        'to': to_symbol}
    except Exception as e:
        response_obj = {'result': 'error', 'FATAL SERVER ERROR. Please Contact administrator. Some error info': str(e),
                        'from': from_symbol, 'from_amount': from_amount,
                        'to': to_symbol}
        #todo: some loggin and alarm, unexpected errors here!

    return web.Response(text=json.dumps(response_obj))


async def update_db(app):

    while True:
        #подгружаем файл если есть
        try:
            await asyncio.sleep(60*60*24) #update once a day
            today = datetime.datetime.now().strftime('%Y-%m-%d')
            datafile = './pickle_data/{}.pickle'.format(today)
            if os.path.exists(datafile):
                app['rates_db'] = upload_rates()

        except asyncio.CancelledError: #supress cancel exception
            pass

async def start_background_tasks(app):
    app['rates_db'] = upload_rates()
    app['db_updater_corotine'] = app.loop.create_task(update_db(app))



async def cleanup_background_tasks(app):
    app['db_updater_corotine'].cancel()
    await app['db_updater_corotine']


if __name__ == "__main__":

    app = web.Application()
    app.on_startup.append(start_background_tasks)
    app.on_cleanup.append(cleanup_background_tasks)
    app.router.add_route('*', '/', handle)
    web.run_app(app)
