# I don't have a reason to unit test yet. I'll actually set this up once I have functions to test.
import unittest
import nimi

suite "getEvery[possible error]":
  test "feed it rubbish":
    check("???".getEvery[] == @[])
