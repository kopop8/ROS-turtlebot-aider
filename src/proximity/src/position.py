#! /usr/bin/env python
class Position:
    def __init__(self, x, y, z, w, rssi):
        self._x = float(x)
        self._y = float(y)
        self._z = float(z)
        self._w = float(w)
        self._rssi = float(rssi)

    # Overide string
    def __str__(self):
            return "x: {}, y:{}, w:{} rssi: {}".format(self._x, self._y, self._w, self._rssi)
    #  Overide output
    def __repr__(self):
            return str(self)