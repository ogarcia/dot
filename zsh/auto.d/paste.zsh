# This file is sourced by .zshrc. This script configures several online
# paste commands of pastebin style.

if ! installed curl || ! installed awk; then
  return 0
fi

nnpaste () {
  curl -s --data-binary '@-' https://pastein.connectical.com/documents | \
    awk -F '"' '{print "https://pastein.connectical.com/"$4}'
}

haste () {
  curl -s --data-binary '@-' http://hastebin.com/documents | \
    awk -F '"' '{print "http://hastebin.com/"$4}'
}

sprunge () {
  curl -F 'sprunge=<-' http://sprunge.us
}

# -- end -- vim:ft=zsh:
