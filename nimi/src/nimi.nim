import nimi/workspace
import nimi/window
import nimi/output
import std/net
import std/envvars
import std/paths
import std/files

type NiriSocket = object
  path: Path
  socket: Socket

proc getNiriSocket*(): NiriSocket =
  var res: Socket = newSocket()
  var niri_socket: Path = Path(getEnv("NIRI_SOCKET"))

  assert(
    niri_socket.fileExists(),
    "Nothing useful found in $NIRI_SOCKET, are you sure you are running Niri?"
  )

  connectUnix(res, niri_socket.string)
  return NiriSocket(
    path: niri_socket,
    socket: res,
  )

proc getWorkspaces*(socket: NiriSocket): seq[Workspace] =
  var workspaces: seq[Workspace] = @[]
  return workspaces

proc getWindows*(socket: NiriSocket): seq[Window] =
  var windows: seq[Window] = @[]
  return windows

proc getOutputs*(socket: NiriSocket): seq[Output] =
  var outputs: seq[Output] = @[]
  return outputs
