import std/options

type
  Transform* = enum
    Normal,
    Normal90,
    Normal180,
    Normal270,
    Flipped,
    Flipped90,
    Flipped180,
    Flipped270,
  Mode* = object
    width*: uint
    height*: uint
    refresh_rate*: uint
    is_preferred*: bool
  LogicalOutput* = object
    x*: uint
    y*: uint
    width*: uint
    height*: uint
    scale*: float
    transform*: Transform
  Output* = object
    name*: string
    make*: string
    model*: string
    serial*: Option[string]
    physical_size*: Option[(uint, uint)]
    modes*: seq[Mode]
    current_mode*: Option[uint]
    vrr_suported*: bool
    vrr_enabled*: bool
    logical*: LogicalOutput
