import nimi/workspace
import nimi/window
import nimi/output
import std/net
import std/envvars
import std/paths
import std/files

type NiriSocket = Socket

proc getNiriSocket*(): NiriSocket =
  ## Creates a `NiriSocket` for interaction with the Niri IPC.
  ##
  ## This also makes sure $NIRI_SOCKET is a valid path.
  var res: Socket = newSocket()
  var niri_socket: Path = Path(getEnv("NIRI_SOCKET"))

  assert(
    niri_socket.fileExists(),
    "Nothing useful found in $NIRI_SOCKET, are you sure you are running Niri?"
  )

  connectUnix(res, niri_socket.string)
  return NiriSocket(res)

proc getWorkspaces*(socket: NiriSocket): seq[Workspace] =
  ## WIP: This function is useless right now.
  ##
  ## This function should use the Niri IPC to find
  ## active Niri workspaces.
  var workspaces: seq[Workspace] = @[]
  return workspaces

proc getWindows*(socket: NiriSocket): seq[Window] =
  ## WIP: This function is useless right now.
  ##
  ## This function should use the Niri IPC to find
  ## active Niri windows.
  var windows: seq[Window] = @[]
  return windows

proc getOutputs*(socket: NiriSocket): seq[Output] =
  ## WIP: This function is useless right now.
  ##
  ## This function should use the Niri IPC to find
  ## active Niri outputs.
  var outputs: seq[Output] = @[]
  return outputs
