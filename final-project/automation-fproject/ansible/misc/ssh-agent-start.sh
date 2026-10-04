#!/bin/bash

SOCKET="$HOME/.ssh/agent/ssh-agent.sock"
KEY="$HOME/.ssh/id_ed25519"

if [ -d "$HOME/.ssh/agent" ]; then
    echo "Agent directory already exists, start the checking:"
else
    echo "Agent directory does not exist, creating now then:"
    mkdir -p "$HOME/.ssh/agent"
    chmod 700 "$HOME/.ssh/agent"
fi

# Ini buat pengecekan apakah SOCKET untuk ssh-agent masih oke atau sudah stale
if [ -S "$SOCKET" ]; then

    if SSH_AUTH_SOCK="$SOCKET" ssh-add -l >/dev/null 2>&1; then
        echo "SSH-Agent is running!"
    else
        echo "Socket already stale, restarting agent"
        rm -f "$SOCKET"
        eval "$(ssh-agent -a "$SOCKET")"
    fi

else

    if [ -e "$SOCKET" ]; then
        echo "Invalid socket, removing it" # Filenya bukan Unix socket jadi di hapus
        rm -f "$SOCKET"
    fi

    eval "$(ssh-agent -a "$SOCKET")"

fi

export SSH_AUTH_SOCK="$SOCKET"

# Add your key if it's not already loaded
if ! ssh-add -l 2>/dev/null | grep -q "$(ssh-keygen -lf "$KEY" | awk '{print $2}')"; then
    ssh-add "$KEY"
fi

echo "SSH agent ready."
echo "Socket: $SSH_AUTH_SOCK"
echo "Keys:"
ssh-add -l