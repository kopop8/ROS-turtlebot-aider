#! /usr/bin/env python
class Position:
    def __init__(self, x, y, w, rssi):
        self._x = float(x)
        self._y = float(y)
        self._w = float(w)
        self._rssi = float(rssi)


    def __str__(self):
            return "x: {}, y:{}, rssi: {}".format(self._x, self._y,self._rssi)
    def __repr__(self):
            return str(self)