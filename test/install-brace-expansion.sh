#!/bin/bash

throw() {
  echo >&2 $1
  exit 1
}

clib install -o tmp stephenmathieson/{trim,case}.c > /dev/null
[ $? -eq 0 ] || throw "expecting successful exit code"

[ -d ./tmp/case ] && [ -f ./tmp/case/package.json ] ||
  throw "failed to install case.c"

[ -d ./tmp/trim ] && [ -f ./tmp/trim/package.json ] ||
  throw "failed to install trim.c"

rm -rf ./tmp
