import std/options

type
  Window* = object
    id*: uint
    title*: Option[string]
    app_id*: Option[string]
    pid*: Option[uint]
    workspace_id*: Option[uint]
    is_focused*: bool
    is_floating*: bool
