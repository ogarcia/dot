# This file is sourced by .bashrc. This script configures
# several online paste commands of pastebin style.

if ! installed curl || ! installed awk; then
	return 0
fi

lesma () {
  curl -F 'lesma=<-' https://paste.connectical.com
}

haste () {
  curl -s --data-binary '@-' https://hastebin.com/documents | \
    awk -F '"' '{print "https://hastebin.com/"$4}'
}

sprunge () {
  curl -F 'sprunge=<-' http://sprunge.us
}

# -- end -- vim:ft=sh:
