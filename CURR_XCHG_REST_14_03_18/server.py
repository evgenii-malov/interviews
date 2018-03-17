import domain
from aiohttp import web
import json
import asyncio
from datasources.openexc_datasource import build_rates_db
from functools import partial


async def handle(request):
    from_symbol = request.query.get('from', None)
    from_amount = request.query.get('amount', None)
    to_symbol = request.query.get('to', None)
    if not (from_amount and from_symbol and to_symbol):
        response_obj = {'result': 'error',
                        'error': 'please provide correct query, for example /?from=CZK&amount=100&to=PLN'}
        return web.Response(text=json.dumps(response_obj))

    try:
        to_amount = request.app['convertor'](domain.Currency(from_symbol, from_amount),
                                             domain.Symbol(to_symbol))
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
        # todo: some loggin and alarm, unexpected errors here!

    return web.Response(text=json.dumps(response_obj))


async def update_db(app):
    while True:
        try:
            await asyncio.sleep(60 * 60 * 24)  # update once a day
            app['rates_db'] = build_rates_db()
            app['convertor'] = partial(domain.conversion, app['rates_db'])
        except asyncio.CancelledError:  # supress cancel exception
            pass
        except Exception as e:
            # update problems here
            # todo log error and send email to admin
            pass


async def start_background_tasks(app):
    app['rates_db'] = build_rates_db()
    app['convertor'] = partial(domain.conversion, app['rates_db'])
    app['db_updater_corotine'] = app.loop.create_task(update_db(app))


async def cleanup_background_tasks(app):
    app['db_updater_corotine'].cancel()
    await app['db_updater_corotine']


if __name__ == "__main__":
    app = web.Application()
    app.on_startup.append(start_background_tasks)
    app.on_cleanup.append(cleanup_background_tasks)
    app.router.add_get('/', handle)
    web.run_app(app)
