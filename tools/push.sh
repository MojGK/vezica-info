#!/bin/bash
# usage: push.sh "msg" files...
# VEŽICA INFO: identitet portala (MojGK org).
REPO="${REPO:-$HOME/repo}"
GIT_NAME="${GIT_NAME:-TVOJ_GIT_NAME}"
GIT_EMAIL="${GIT_EMAIL:-tvoj@email.example}"
cd "$REPO" || exit 1
m="$1"; shift
git add -A -- "$@" 2>/dev/null
git -c user.name="$GIT_NAME" -c user.email="$GIT_EMAIL" commit -qm "$m" \
  && git pull -q --rebase \
  && git push -q \
  && git log --oneline -1
