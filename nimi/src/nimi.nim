import std/json
import nimi/[output, window, workspace]

type NiriMsg = distinct string

type Niri* = object
  outputs*: seq[Output]
  windows*: seq[Window]
  workspaces*: seq[Workspace]

proc parseJson*(buffer: NiriMsg): JsonNode {.borrow.}

proc getNiri*(outputs: NiriMsg, windows: NiriMsg, workspaces: NiriMsg): Niri =
  result = Niri(
    outputs: parseJson(outputs).to(seq[Output]),
    windows: parseJson(windows).to(seq[Window]),
    workspaces: parseJson(workspaces).to(seq[Workspace])
  )
