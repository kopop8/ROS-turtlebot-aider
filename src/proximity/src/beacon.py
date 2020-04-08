#! /usr/bin/env python
from collections import deque
class Beacon:
        def __init__(self, name, addr):
            self._queue = deque(maxlen=5)
            self._name = name
            self._addr = addr
            self._bestPosition = None

        def enqueue(self,position):
            self._queue.append(position)
            if self._bestPosition == None:
                self._bestPosition = position
            else:
                # count total and calculate average rssi
                total = 0
                for position in self._queue:
                    total+= position._rssi
                averageRssi = float(total) / len(self._queue)
                # if rssi is beter than last bestPosition change it to new position
                if(averageRssi>=self._bestPosition._rssi):
                    tempPosition = None
                    for position in self._queue:
                        if tempPosition == None:
                            tempPosition = position
                        elif tempPosition._rssi <= position._rssi:
                            tempPosition = position
                    self._bestPosition = tempPosition

        def __str__(self):
            return "name: {}, best position: {} rssis: {}".format(self._name, self._bestPosition,self._queue)
        def __repr__(self):
            return str(self)