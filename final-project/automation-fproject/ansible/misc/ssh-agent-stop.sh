#!/bin/bash

SOCKET="$HOME/.ssh/agent/ssh-agent.sock"

if [ -S "$SOCKET" ]; then
    SSH_AUTH_SOCK="$SOCKET" ssh-agent -k >/dev/null 2>&1
fi

rm -f "$SOCKET"

unset SSH_AUTH_SOCK

echo "SSH agent stopped."