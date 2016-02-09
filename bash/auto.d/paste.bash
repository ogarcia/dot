# This file is sourced by .bashrc. This script configures
# several online paste commands of pastebin style.

if ! installed curl || ! installed awk; then
	return 0
fi

nnpaste () {
	a=$(cat)
	curl -X POST -s -d "$a" https://pastein.connectical.com/documents | \
	  awk -F '"' '{print "https://pastein.connectical.com/"$4}'
}

haste () {
	a=$(cat)
	curl -X POST -s -d "$a" http://hastebin.com/documents | \
	  awk -F '"' '{print "http://hastebin.com/"$4}'
}

# -- end -- vim:ft=sh:
