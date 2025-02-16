import std/options

type
  Workspace* = object
    id*: uint64
    idx*: uint8
    name*: Option[string]
    output*: Option[string]
    is_active: bool
    is_focused: bool
    active_window_id: Option[uint64]
