#! /bin/bash
# The dotf function allow to sync current dotfiles to central
# repository.

export DOTF_FILE="${BASH_SOURCE[0]}"

# We don't need to add excesive code to memory, so we load the
# dotf function while require dynamically.
dotf ()
{
	export DOTF_LOAD=true
	source $DOTF_FILE
	dotf "$@"
}

if ${DOTF_LOAD:-false} ; then

dotf ()
{
	local dotf_repo=( $(< ~/.dotfrc) )
	local break=false

	if [ ${#dotf_repo[@]} -eq 0 ]; then
		echo "dotf: repository not found. Add URIs in ~/.dotfrc" >&2
		unset DOTF_LOAD
		unset dotf_get
		source "$DOTF_FILE"
		return 1
	fi

	for repo in "${dotf_repo[@]}"; do
		if ! dotf_get "$repo" "$@" ; then
			continue
		fi
		break=true
		break;
	done

	if ${break:-false}; then
		echo "dotf:cannot get file from repositories" >&2
		unset DOTF_LOAD
		unset dotf_get
		source "$DOTF_FILE"
		return 1
	fi

	unset DOTF_LOAD
	unset dotf_get
	source "$DOTF_FILE"
	return 0

}

dotf_get ()
{
	local uri="$1"; shift

	for file in "$@"; do
		case "$uri" in
			rsync://* | rsync::*)
			# Handle RSYNC request
			if installed rsync; then
				rsync -r "$uri/$file"
			else
				return 1
			fi
			;;
			http://* | https://*)
			# Handle HTTP(S) requests
			if installed wget; then
				wget -O "$file" "$uri/$file"
			elif installed curl; then
				curl -o "$file" "$uri/$file"
			else
				return 1
			fi
			;;
			ssh://* | sftp://*)
			# Handle SSH/SFTP request
			local uri="${uri#ssh://}"
			local uri="${uri#sftp://}"
			if installed sftp ; then
				sftp "$uri/$file" "$file"
			else
				return 1
			fi
			;;
			*) return 1 ;;
		esac

	done
}
fi
