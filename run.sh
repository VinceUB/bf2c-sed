#!/bin/sh

absolute_filename(){
	# $1 : relative filename
	echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

SED_SCRIPT="$(absolute_filename "script.sed")"
TEMP_FOLDER="/tmp/bfc-$(xxd -l16 -c16 -p /dev/urandom)"
BF_FILE="$(absolute_filename "$1")"

mkdir "$TEMP_FOLDER"
cd "$TEMP_FOLDER" || exit

sed -f "$SED_SCRIPT" "$BF_FILE" >out.c
gcc -O3 out.c -o out
./out
rm -r "$TEMP_FOLDER"
