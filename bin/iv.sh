#!/usr/bin/env bash

# join a server
#   - Example: "iv irc.freenode.net"
#   - creates a command called 'freenode' which accepts other commands
#   - essentially opens a channel to the chan/nickserv status screen
# from a server command, join a room:
#   - creates a `ii` connection + a command for interacting w/ that room
# from a room command:
#   - say something
#   - private message someone
#   - leave
# leaving a room
#   - archives the files to a .tar.bz
#   - puts them where you configure them to go
#   - removes the room command and stuff
# leaving a server
#   - removes the server command and stuff
