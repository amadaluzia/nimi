import std/[net, json, syncio]

type NiriError* = object of CatchableError ## \
  ## Returns whenever Niri recieves an error.

proc getEvery*[T](niriMsg: string): seq[T] =
  ## Returns a sequence of `T` from
  ## `niriMsg` assuming it's parsable
  ##  in JSON.
  ##
  ## If an error is caught, an empty
  ## sequence will be returned.
  try:
    result = parseJson(niriMsg).to(seq[T])
  except CatchableError as e:
    stderr.writeLine(e.msg)
    stderr.flushFile
    result = @[]
