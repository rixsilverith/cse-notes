#!/usr/bin/bash
set -euo pipefail

F_RESET=$(tput sgr0)
F_BOLD=$(tput bold)
F_UNDER=$(tput smul)
F_RED=$(tput setaf 1)
F_GREEN=$(tput setaf 2)
F_YELLOW=$(tput setaf 3)
F_BLUE=$(tput setaf 4)

term::color() {
    case "$@" in
        *reset*) tput sgr0; return 0 ;;
        *black*) tput setaf 0 ;;
        *red*) tput setaf 1 ;;
        *green*) tput setaf 2 ;;
        *yellow*) tput setaf 3 ;;
        *blue*) tput setaf 4 ;;
        *purple*) tput setaf 5 ;;
        *cyan*) tput setaf 6 ;;
        *white*) tput setaf 7 ;;
    esac
    case "$@" in
        *regular*) tput sgr0 ;;
        *bold*) tput bold ;;
        *standout*) tput smso ;;
        *underline*) tput smul ;;
    esac
}

_log() {
    local template=$1
    shift
    echo -e $(printf "$template" "$@")
   #echoerr -e $(printf "$template" "$@")
}

log::header()  { _log "\n$(term::color bold)%s$(term::color reset)\n" "$@"; }
log::success() { _log "$(term::color green)✔ %s$(term::color reset)\n" "$@"; }
log::error()   { _log "$(term::color red)✖ %s$(term::color reset)\n" "$@"; }
log::warning() { _log "$(term::color yellow)➜ %s$(term::color reset)\n" "$@"; }
log::info()    { _log "$(term::color green)>>$(term::color reset) %s\n" "$@"; }

abort() { log::error "$1"; exit 1; }

get_course() {
    local course="$1"
    # Check that a non-empty string was entered
    [[ -n "$course" ]] || abort "No course name was given :("
    # Check that the directory exists
    [[ -d "${LNOTES_DIR}/courses/$course" ]] || abort "The directory 'courses/$course/' does not exists."
    # Check that there is at least one .tex in the directory
    [[ -n "$(find "${LNOTES_DIR}/courses/$course" -maxdepth 1 -iname '*.tex')" ]] || abort "There's no .tex files in 'notes/$course/'"

    echo $course
}
