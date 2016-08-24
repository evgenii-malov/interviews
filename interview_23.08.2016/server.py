import logging
from tornado.ioloop import IOLoop
from tornado import gen
from tornado.iostream import StreamClosedError
from tornado.tcpserver import TCPServer
from tornado.options import options, define

define("port", default=9999, help="TCP port to listen on")
logger = logging.getLogger(__name__)

command_seq = [b'\x12\x00\x00', b'\x13\x00\x00', b'\x20\x00\x03\xFF\x20\x30',
               b'\x22\x00\x03\xFF\x20\x30']


class LampServer(TCPServer):
    @gen.coroutine
    def handle_stream(self, stream, address):
        while True:
            try:
                for c in command_seq:
                    yield stream.write(c)
                    yield gen.sleep(2)
            except StreamClosedError:
                logger.warning("Lost client at host %s", address[0])
                break
            except Exception as e:
                print(e)


if __name__ == "__main__":
    options.parse_command_line()
    server = LampServer()
    server.listen(options.port)
    logger.info("Listening on TCP port %d", options.port)
    IOLoop.current().start()
