#!/usr/bin/bash
set -euo pipefail

doc::help() {
    echo -e "\n$(tput bold)Lecture notes manager$(tput sgr0)\n"
    echo -e "Usage: $(tput bold)lecture-notes <command> [<args>...]$(tput sgr0)\n"
    #echo -e "\t$(tput bold)help$(tput sgr0)               Show this help message"
    echo -e "\t$(tput bold)list$(tput sgr0)               List all courses"
    echo -e "\t$(tput bold)info <course>$(tput sgr0)      Get information about a specific course"
    echo -e "\t$(tput bold)compile <course>$(tput sgr0)   Compile a specific course"
    echo -e "\t$(tput bold)init <course>$(tput sgr0)      Initialize a new course"
    #echo -e "\t$(tput bold)push <repo-url>$(tput sgr0)    Push compiled lecture notes from a course to Drive"
    echo -e "\t$(tput bold)sync <repo-url>$(tput sgr0)   Update the local Git repository with the specified GitHub repo."
    echo
    echo -e "Tip: Use $(tput bold)lecture-notes <command> (-h | --help)$(tput sgr0) to see more options for each command.\n"
}
