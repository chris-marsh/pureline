PureLine - A Pure Bash Powerline PS1 Command Prompt
===================================================

A simple but powerful [Powerline](https://github.com/Lokaltog/vim-powerline) style prompt for the Bash shell written in Bash script.

This project was inspired by [Bash-Powerline-Shell](https://github.com/abhijitvalluri/bash-powerline-shell). It has been redesigned to make configuration easier and to use only the basic terminal colors - allowing colors to be set by the terminal (eg Xresources or profiles).

The result ... is PureLine.

![Default Install](/Screenshots/screen1.png?raw=true "PureLine Bash PS1: Default install")

![Battery and Git Modules](/Screenshots/screen2.png?raw=true "PureLine Bash PS1: Battery and Git Modules")

![Time and Python Virtual Modules](/Screenshots/screen3.png?raw=true "PureLine Bash PS1: Time and Python Virtual Modules")

![Jobs and Prompt Modules](/Screenshots/screen4.png?raw=true "PureLine Bash PS1: Jobs and Prompt Modules")

### Main Features

Modules for the PS1 prompt include;

* Time: with an option for HH:MM or HH:MM:SS
* Hostname: with option for `user@host` or `host`
* Path: with option for full path or current directory only
* Read Only: an indicator for read only directories
* Battery: a battery power indicator
* Jobs: show the number of running background jobs
* Virtual Environment: shows the name of an active python virtual environment
* Git: shows a git branch name, and the status of the repository
* Prompt: with option to show return code of the last command

All the modules are optional and can be enabled or disabled in a config file.

### Unicode symbols used

* Hard separator between modules``
* Soft separator betwen modules of the same color: ``
* Read-only status of current directory: ``
* Return code from previous bash command: `⚑`
* Number of background jobs: `⏎` followed by number
* Python Virtual Environment:`λ`
* Battery indicator when charging:`⚡`
* Battery indicator when discharging:`▮`
* Git Branch: ``
* Number of modified files in git repo: `✚`
* Number of staged files in git repo: `✔`
* Number of conflicted files in git repo: `✘`

# Setup

## Prerequisites

* Some of the unicode symbols require a special font to be used in your terminal. Please use one of the powerline fonts available at: https://github.com/Lokaltog/powerline-fonts

  * The "DejaVu Sans Mono for Powerline" font seems to be one of the better fonts for Unicode support.

* Almost all current terminals have the unicode support needed by PureLine. If you have used PowerLine fonts before, then you already know if Pureline will be supported in your terminal. But if you do have issues with any of the symbols, try testing a different terminal, eg, `uxterm` in place of `xterm`.

## Install

### Git Clone

    $ cd~
    $ git clone https://github.com/chris-marsh/pureline.git
    $ cp pureline/example-config.conf ~/.pureline.conf

* In your `.bashrc` or `.profile`, whichever is used, source the `pureline` script as follows:

    source ~/pureline/pureline ~/.pureline.conf

## Customization

The config file contains lines which are sourced by pureline. Each line loads a module. For example;

    declare -a pureline_modules=(
    #    Name               Background  Foreground  Option
    #   'time_module	    Purple      Black       false' # Show seconds
    #   'battery_module     Blue        Black'
        'host_module    	Yellow      Black       true'  # Show User
    #   'virtual_env_module Blue        Black'
        'path_module        Blue        Black       true'  # Show full path
        'read_only_module   Red         White'
    #   'jobs_module        Purple	    White'
    #   'git_module         Green       Black'
    #   'prompt_module	    Purple	    Black       true'   # Return code
    )

To remove a module, comment or delete the relevant line. The first two parameters are background and foreground colors which can be customized. Some modules may have additional options.

## Developing New Modules

New modules can be easily created by following a template from existing functions. For example:

    function time_module {
        local bg_color=$1                  # Set the background color
        local fg_color=$2                  # Set the foregropund color
        local content="\t"                 # Set the content to be displayed
        PS1+=$(section_end $bg_color)
        PS1+=$(section_content $fg_color $bg_color " $content ")
        __last_color=$bg_color
    }

The $content variable can be modified to show any output wanted on the prompt

### Additional resources

* [Bash tips: Colors and formatting](https://misc.flogisoft.com/bash/tip_colors_and_formatting) : Flozz' Misc Bash Tips for Colors and Formatting
* [PS1 cheat sheet](https://ss64.com/bash/syntax-prompt.html): Prompt variable characters for customizing the output of the PS1 prompt.

