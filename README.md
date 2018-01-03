PureLine - A Pure Bash Powerline PS1 Command Prompt
===================================================

A [Powerline](https://github.com/Lokaltog/vim-powerline) like prompt written in bash script.

This project is based on [Bash-Powerline-Shell](https://github.com/abhijitvalluri/bash-powerline-shell). I have rewritten the code to make configuration easier and to use only the basic terminal colors - allowing colors to be set by the terminal (eg Xresources or profiles):

![Solarised Theme](/Screenshots/Solarised.png?raw=true "PureLine PS1 on Konsole with Solarised theme")

![Xfce4 Terminal](/Screenshots/xfce4Terminal.png?raw=true "PureLine PS1 on Xfce4-Terminal")

![Urxvt With Custom Theme](/Screenshots/CustomUrxvt.png?raw=true "PureLine PS1 on urxvt with custom .Xresources")

![Breeze Theme](/Screenshots/Breeze.png?raw=true "PureLine PS1 on Konsole with Breeze theme")

### Main Features

Modules to show;

* current time
* hostname (and optionally username)
* current directory
* indicator if directory is read-only
* number of background jobs
* python virtual environment indicator
* git branch and status (modified, staged & confilcted)
* prompt which can optionally show the return code of the last command

All the modules are optional and can be enabled or disabled in a config file.

    time_module
    host_module
    path_module
    read_only_module
    jobs_module
    virual_env_module
    git_module
    prompt_module

### Unicode symbols used

* Number of background jobs: `⏎` followed by number
* Read-only status of current directory: ``
* Return code from previous bash command: `⚑`
* Git branch: ``
* Number of modified files in git repo: `✚`
* Number of staged files in git repo: `✔`
* Number of conflicted files in git repo: `✘`

In addition, the following symbols are used to separate different segments: , 

# Setup

## Prerequisites

* This shell script heavily relies on ANSI color codes to display colors in the terminal window. They may not be portable, hence it may not work for you out of the box. You may need to set your $TERM to `xterm-256color`.

* In addition, Unicode symbols require a special font to be used in your terminal. Please use one of the powerline fonts available at: https://github.com/Lokaltog/powerline-fonts

  * The "DejaVu Sans Mono for Powerline" font seems to be one of the better fonts for Unicode support.

* You may need to use `uxterm`, the XTerm with unicode support, in place of `xterm` if the Unicode characters are not correctly rendered.

## Install

### Git Clone

    $ cd~
    $ git clone https://github.com/chris-marsh/pureline.git
    $ cp pureline/example-config.conf ~/.pureline.conf

* In your `.bashrc` or `.profile`, whichever is used, source the `pureline` script as follows:

    source ~/pureline/pureline ~/.pureline.conf

## Customization

The config file contains lines which are source by pureline. Each line loads a module in the order listed. For example;

    # Module Name	    Background	Foreground	Optional Argument
    # time_module	    "IBlack"	"White"
    host_module    	    "Yellow"	"Black"		false # Show User
    virtual_env_module  "Blue"      "Black"
    path_module         "Blue"      "Black"
    read_only_module    "Red"       "White"
    jobs_module         "Purple"	"Black"
    git_module          "Green"     "Black"
    # prompt_module	    "IBlack"	"White"		true # Return code

To remove a module, comment out or delete the relevant line. The first two parameters are background and foreground colors which can be customized. Some modules have additional options.

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

* [ANSI color codes](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors): Color codes for the xterm/uxterm.
* [UTF-8 Unicode test documents](https://github.com/bits/UTF-8-Unicode-Test-Documents.git): Use the test documents in this repo to see what symbols are rendered using your chosen font.
* [PS1 cheat sheet](https://ss64.com/bash/syntax-prompt.html): Prompt variable characters for customizing the output of the PS1 prompt.

