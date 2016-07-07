# This file is sourced by .zshrc. This script provides several helpers to
# run tmate as server.

if ! installed tmate; then
  return 0
fi

tmate-server-start () {
  if [ -S /tmp/tmate.sock ]; then
    echo "tmate server is already running in '/tmp/tmate.sock'"
    tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'    # Prints the SSH connection string
    tmate -S /tmp/tmate.sock display -p '#{tmate_ssh_ro}' # Prints the read-only SSH connection string
    tmate -S /tmp/tmate.sock display -p '#{tmate_web}'    # Prints the web connection string
    tmate -S /tmp/tmate.sock display -p '#{tmate_web_ro}' # Prints the read-only web connection string
  else
    echo "Starting new tmate server in '/tmp/tmate.sock'"
    tmate -S /tmp/tmate.sock new-session -d               # Launch tmate in a detached state
    tmate -S /tmp/tmate.sock wait tmate-ready             # Blocks until the SSH connection is established
    tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'    # Prints the SSH connection string
    tmate -S /tmp/tmate.sock display -p '#{tmate_ssh_ro}' # Prints the read-only SSH connection string
    tmate -S /tmp/tmate.sock display -p '#{tmate_web}'    # Prints the web connection string
    tmate -S /tmp/tmate.sock display -p '#{tmate_web_ro}' # Prints the read-only web connection string
  fi
}

tmate-server-attach () {
  if [ -S /tmp/tmate.sock ]; then
    tmate -S /tmp/tmate.sock attach
  else
    echo "tmate server is not running: socket '/tmp/tmate.sock' not found"
  fi
}

tmate-server-kill () {
  if [ -S /tmp/tmate.sock ]; then
    tmate -S /tmp/tmate.sock kill-session
  else
    echo "tmate server is not running: socket '/tmp/tmate.sock' not found"
  fi
}

# -- end -- vim:ft=zsh:
