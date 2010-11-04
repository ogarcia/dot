# The ba_update module is the auto_update module for bash_auto.
# This module require dotf.

if ! declared dotf ; then
	return 1
fi

mute pushd "$HOME"
mute dotf .bashrc && mute dotf .bash_profile && mute dotf .bash_auto.d
mute popd

