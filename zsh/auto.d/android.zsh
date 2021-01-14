# This file is sourced by .zshrc. This script contains a set of helpers for
# Android developers.

ANDROID_SDK="${ANDROID_SDK:-${HOME}/Android/Sdk}"

if [ ! -d "${ANDROID_SDK}" ] ; then
  unset ANDROID_SDK
  return 0
fi

if [ -d "${ANDROID_SDK}/emulator" ] ; then
  PATH="${PATH}:${ANDROID_SDK}/emulator"
fi

if [ -d "${ANDROID_SDK}/tools" ] ; then
  PATH="${PATH}:${ANDROID_SDK}/tools"
fi

export ANDROID_SDK
export PATH

# -- end -- vim:ft=zsh:
