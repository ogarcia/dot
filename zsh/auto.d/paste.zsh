# This file is sourced by .zshrc. This script configures several online
# paste commands of pastebin style.

if ! installed curl || ! installed awk; then
  return 0
fi

lesma () {
  curl -F 'lesma=<-' https://lesma.eu
}

nnlesma () {
  curl -F 'lesma=<-' https://paste.connectical.com
}

haste () {
  curl -s --data-binary '@-' https://hastebin.com/documents | \
    awk -F '"' '{print "https://hastebin.com/"$4}'
}

sprunge () {
  curl -F 'sprunge=<-' http://sprunge.us
}

0x0-file () {
  curl -F 'file=@-' http://0x0.st
}

0x0-url () {
  [ ! ${1} ] && echo "Missing URL parameter" && return 1
  curl -F "url=${1}" http://0x0.st
}

# -- end -- vim:ft=zsh:
