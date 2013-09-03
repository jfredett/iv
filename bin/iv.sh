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

# creating the command really just writes a wrapper with some environment
# variables set. eg:
#
# ie `iv join '#lpmc'`
# would yield a command like:
# #=> IV_CHANNEL='lpmc' channel.sh $@
#


_check_config() {
  if [ -z $IV_CONFIG_FILE ] ; then
    echo 'Must set $IV_CONFIG_FILE'
    exit 1
  fi

  if [ -z $(_config user) ] ; then
    echo 'Must set user=<name> in $IV_CONFIG_FILE'
    exit 2
  fi
} >&2

_config() {
  local key=$1

  if [ $2 ] ; then
    #delete the key as it exists
    #add it to the config
    echo "here"
  else
    # grep out the value of the key
    cat "$IV_CONFIG_FILE" | grep $key | sed -n s/$key=//p
  fi
}

join() {
  # join the server
  local port=$(_config port)
  local location=$(_config location)

  nohup ii -s $1 -n $(_config user) -p ${port:-6667} -i ${location:-"$HOME/irc"} &> /dev/null &
  # write the command-files
}

_check_config
$@
