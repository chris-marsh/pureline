#!/bin/env bash

# Dump color themes to screen for testing

# -----------------------------------------------------------------------------
# List the colors in the theme
function color_dump {
    local idx color mode
    for idx in {0..15}; do
        color=${PL_COLORS[$idx]}
        [[ $color =~ ';' ]] && mode='2' || mode='5'
        [[ $color != bg_default ]] && color="\e[48;${mode};${PL_COLORS[$idx]}m" || color='[\e[49m\]'
        printf "\e[38;${mode};0m$color     COLOR: %2d (%22s)   \e[49m\e[0m\n" "$idx" "$color"
    done
}

# -----------------------------------------------------------------------------
# Make a section of color to print to screen.
# the segments use the routines from sourced from PureLine script. Therefore,
# separator symbols will not show as __last_color variable is  not accessible.
function test_segment {
    local bg_color="$1"
    local fg_color="$2"
    local content=" seg "
    local ps1
    ps1+="$(segment_end "$fg_color" "$bg_color")"
    ps1+="$(segment_content "$fg_color" "$bg_color" " $content ")"
    __last_color="$bg_color"
    echo -ne "$ps1"
}

# -----------------------------------------------------------------------------
# Simulate a PS1 with blocks of color.
# takes an argument list of numbers representing the colors
function PS1_test {
    local idx color mode ps1
    for idx in "$@"; do
        ps1+=$(test_segment "$idx" "7")
    done
    # clean ps1 for printing to terminal by removing escape characters
    ps1="${ps1//\\[}"
    ps1="${ps1//\\]}"
    printf "\n%s\e[0m\n\n" "$ps1"
}

# -----------------------------------------------------------------------------
# check arguments and source the color theme & pureline if additional args for
# a color list to test segments
function main {
    # check if an argument has been given for a color file
    if [[ -f $1 ]]; then
        # shellcheck disable=SC1090
        source "$1"
        color_dump
        shift
        if [[ -n $1 ]]; then
            source "../pureline"
            PS1_test "$@"
        fi
    else
        echo "No color file specified"
    fi
}
main "${@}"
