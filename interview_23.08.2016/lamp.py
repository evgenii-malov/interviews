# coding: utf8
from __future__ import print_function
from tornado.ioloop import IOLoop
from tornado import gen
from tornado.tcpclient import TCPClient
from tornado.options import options, define
import struct
from tornado.iostream import StreamClosedError
import signal
from tornado.concurrent import Future


def handle_on():
    print("LAMP ON")


def handle_off():
    print("LAMP OFF")


def handle_color(value):
    red = ord(struct.unpack('c', value[0])[0])
    green = ord(struct.unpack('c', value[1])[0])
    blue = ord(struct.unpack('c', value[2])[0])

    print("LAMP COLOR R={},G={},B={}".format(red, green, blue))


handle_map = {
    b'\x12': handle_on,
    b'\x13': handle_off,
    b'\x20': handle_color,
}

define("host", default="localhost", help="TCP server host")
define("port", default=9999, help="TCP port to connect to")

lamp_stop = Future()


@gen.coroutine
def lamp_start():
    while True:
        try:
            print('start connection...')
            stream = yield TCPClient().connect(options.host, options.port)

            while True:
                reply = yield stream.read_bytes(3)
                command_type = reply[0]
                length_bytes = reply[1:]
                # length = ord(struct.unpack('c', length_byte)[0])
                # > - big-endian, H - short (2 bytes)
                length = struct.unpack('>H', length_bytes)[0]

                try:
                    if length:
                        value = yield stream.read_bytes(length)
                        handle_map[command_type](value)
                    else:
                        handle_map[command_type]()
                except KeyError:
                    pass
                    # ugnore silently
                    # print("uncknown command type: ", hex(
                    #    ord(struct.unpack('c', command_type)[0])))

                if lamp_stop.done():
                    print("close connection")
                    stream.close()
                    return

        except StreamClosedError:
            print('StreamClosedError: reconnecting after 2 seconds wait...')
            yield gen.sleep(2)


if __name__ == "__main__":
    options.parse_command_line()
    ioloop = IOLoop.instance()
    signal.signal(signal.SIGINT, lambda sig, frame: lamp_stop.set_result(True))
    ioloop.run_sync(lamp_start)
