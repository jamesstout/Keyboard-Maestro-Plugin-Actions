#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR" || return 1

# Header logging
e_header() {
	printf "\n$(tput setaf 7)%s$(tput sgr0)\n" "$@"
}
# debug logging
e_debug() {
	printf "$(tput setaf 2)%s$(tput sgr0)\n" "$@"
}
# Success logging
e_success() {
	printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$@"
}
# Warning logging
e_warning() {
	printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
}

onoe() {
	if [[ -t 2 ]]; then # check whether stderr is a tty.
		echo -ne "\033[4;31mError\033[0m: " >&2 # highlight Error with underline and red color
	else
		echo -n "Error: " >&2
	fi
	if [[ $# -eq 0 ]]; then
		/bin/cat >&2
	else
		echo "$*" >&2
	fi
}

odie() {
	onoe "$@"
	exit 1
}

file_exists() {
	if [ -e "$1" ]; then
		return 0
	fi
	return 1
}

filename_ok() {
	if [[ "$1" =~ ^[a-zA-Z_0-9]+$ ]]; then
		return 0
	fi
	return 1
}

if [[ ! "$OSTYPE" =~ ^darwin ]]; then
	odie "Sorry, this build script only runs on macOS currently."
else
	e_success "All good, continue"
fi

# set up some paths/dirs etc
SRC="$(basename "$SCRIPT_DIR")"
FULL_SRC="$SCRIPT_DIR/$SRC"
PLIST="$FULL_SRC/Keyboard Maestro Action.plist"
ICON="$FULL_SRC/Icon.png"

e_debug "Source directory is: $SRC"
e_debug "Full source path is: $FULL_SRC"
e_debug "Plist file is: $PLIST"

# sanity checks
if ! file_exists "$PLIST"; then
	odie "Plist file missing."
fi
if ! file_exists "$ICON"; then
	odie "Icon file missing."
fi

# Check plist is XML and has no errors
if ! hash plutil 2>/dev/null; then
	e_warning "Cannot validate plist"
else
	e_debug "Checking plist file format..."

	PLIST_FORMAT="$(file "$PLIST")"

	if [[ "$PLIST_FORMAT" =~ binary* ]]; then
		e_warning "Binary plist, will attempt to convert"
		plutil -convert xml1 "$PLIST"
		rc="$?"
		if [ "$rc" -eq 0 ]; then
			e_success "Conversion good, continue"
		else
			odie "Conversion failed. Manually save as XML, then try again."
		fi
	elif [[ "$PLIST_FORMAT" =~ XML* ]]; then
		e_success "Plist is XML, continue"
	fi

	e_debug "checking the plist file for syntax errors..."

	plutil -lint "$PLIST" >/dev/null 2>&1
	rc="$?"
	if [ "$rc" -eq 0 ]; then
		e_success "No syntax errors, continue"
	else
		ERR="$(plutil -lint "$PLIST" | awk -F"ist: " '{print $2}')"
		odie "Plist contains syntax errors, fix, then try again. Error(s): $ERR"
	fi
fi

e_debug "Checking Icon file type..."
if ! hash identify 2>/dev/null; then
	odie "Please install imagemagick - identify"
fi

FORMAT="$(identify "$ICON" | awk -F".png " '{ print $2 }' | cut -d" " -f1)"

if [[ "$FORMAT" == "PNG" ]]; then
	e_success "PNG file, continue"
else
	odie "Invalid Icon file format: $FORMAT. Must be PNG."
fi

e_debug "Checking Icon file dimensions..."

IFS=" " read -r -a size <<<"$(identify -ping -format '%w %h' "$ICON")"
width="${size[0]}"
height="${size[1]}"

e_debug "Icon width: $width"
e_debug "Icon height: $height"

if [ "$width" -eq 64 ] && [ "$height" -eq 64 ]; then
	e_success "Correct dimensions, continue"
else
	odie "Incorrect Icon file dimensions."
fi

# run through imageoptim-cli?

# check plist for Script name
BUDDY=/usr/libexec/PlistBuddy
if ! file_exists "$BUDDY"; then
	e_warning "PlistBuddy missing, cannot double check script name"
else
	SCRIPT="$($BUDDY -c "Print Script" "$PLIST")"
	if [ -z "$SCRIPT" ]; then
		odie "No Script key in plist"
	else
		e_debug "Script: $SCRIPT"
		e_debug "Checking $SCRIPT exists..."
		if ! file_exists "$FULL_SRC/$SCRIPT"; then
			odie "$SCRIPT does not exist."
		else
			# sanity check filename and extension: https://wiki.keyboardmaestro.com/manual/Plug_In_Actions
			# only ASCII alphanumerics or underscores, plus an ASCII alphanumeric extension
			filename="$(basename "$FULL_SRC/$SCRIPT")"
			extension="${filename##*.}"
			e_debug "extension: $extension"
			filename="${filename%.*}"
			e_debug "filename: $filename"

			if ! filename_ok "$filename"; then
				odie "filename contains invalid characters."
			fi

			if ! filename_ok "$extension"; then
				odie "extension contains invalid characters."
			fi

			e_success "Filename is fine."

		fi

	fi
fi

# zip up
ZIPFILE="$(echo $SRC | sed 's/ //g').zip"

e_debug "zip filename: $ZIPFILE"

zip -r "$ZIPFILE" "$SRC" -x "$SRC/.DS_Store" >/dev/null 2>&1

rc="$?"
if [ "$rc" -eq 0 ]; then
	e_header "Zipped and completed."
else
	odie "Zip failed"
fi
