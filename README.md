A bash-script based Powerline style prompt for your shell
=========================================================

A [Powerline](https://github.com/Lokaltog/vim-powerline) like prompt for Bash.

This implementation is based on [Bash-Powerline-Shell](https://github.com/abhijitvalluri/bash-powerline-shell). I have attempted to refactor the code to make it easier to configure. Another change is a switch from 256 colors to the basic terminal colors. This could be seen as a backwards step, but it does have the benefit of alllowing the colors to be set by .Xresources

![Solarised Theme](/Screenshots/Solarised.png?raw=true "Powerline PS1 on Konsole with Solarised theme")

![Urxvt With Custom Theme](/Screenshots/CustomUrxvt.png?raw=true "Powerline PS1 on urxvt with custom .Xresources")

![Breeze Theme](/Screenshots/Breeze.png?raw=true "Powerline PS1 on Konsole with Breeze theme")

### Main Features

Modules for;

* Shows time
* hostname and optionally username
* current directory
* indicator if directory is read-only
* number of background jobs
* git branch and status (modified, staged & confilcted)
* prompt which can optionally show the return code of the last command

All the modules are optional and can be enabled or disabled by commenting out their function call;

    time_module
    host_module
    path_module
    read_only_module
    jobs_module
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

* This shell script heavily relies on ANSI color codes to display colors in the terminal window. They may not be portable, hence it may not work for you out of the box. You may need to set your $TERM to `xterm-256color`.

* In addition, Unicode symbols require a special font to be used in your terminal. Please use one of the powerline fonts available at: https://github.com/Lokaltog/powerline-fonts

  * The "DejaVu Sans Mono for Powerline" font seems to be one of the better fonts for Unicode support.

* You may need to use `uxterm`, the XTerm with unicode support, in place of `xterm` if the Unicode characters are not correctly rendered.

* Clone this repository, or copy the `powerline_prompt` script and its dependency `colors` to a suitable location. Let us assume that you placed these in your home directory.

* In your `.bashrc` or `.profile`, whichever is used, source the `ps1_prompt` script as follows:

```
source ~/powerline_prompt
```

# Customization

There is more work needed to make customization easier, but the following options are available:

* Basic customization can be done by commenting out the modules you do not wish to use.
* Some of the modules also have optional arguments to change their appearance.

Each module is contained its own function. Simple customizations with the functions include;

* Foreground color
* Background color

These are easily changed using the color variables defined in `colors`:

    local bg_color="IBlack"
    local fg_color="White"

New modules can be easily created by following the template of existing functions. For example:

    function time_module {
        local bg_color="Black"
        local fg_color="White"
        local content="\t"
        PS1+=$(section_end $bg_color)
        PS1+=$(section_content $fg_color $bg_color " $content ")
        __last_color=$bg_color
    }

The $content variable can be modified to show any output wanted on the prompt

# Additional resources

* [ANSI color codes](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors): Color codes for the xterm/uxterm.
* [UTF-8 Unicode test documents](https://github.com/bits/UTF-8-Unicode-Test-Documents.git): Use the test documents in this repo to see what symbols are rendered using your chosen font.
* [PS1 cheat sheet](https://ss64.com/bash/syntax-prompt.html): Prompt variable characters for customizing the output of the PS1 prompt.

