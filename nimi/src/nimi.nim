import nimi/workspace
import nimi/window
import std/net
import std/envvars
import std/paths
import std/files

type NiriSocket = object
  path: Path
  socket: Socket

proc niriSocket*(): NiriSocket =
  var res: Socket = newSocket()
  var niri_socket: Path = getEnv("NIRI_SOCKET")

  assert(
    niri_socket != "" && fileExists(niri_socket),
    "Nothing useful found in $NIRI_SOCKET, are you sure you are running Niri?"
  )

  connectUnix(res, getNiriSocket())
  return NiriSocket(
    path: niri_socket,
    socket: res,
  )

proc getWorkspaces(socket: NiriSocket): seq[Workspace] =
  var workspaces: seq[Workspace] = @[]
  return workspaces

proc getWindows(socket: NiriSocket): seq[Window] =
  var windows: seq[Window] = @[]
  return windows

proc getOutputss(socket: NiriSocket): seq[Outputs] =
  var outputs: seq[Outputs] = @[]
  return outputs
