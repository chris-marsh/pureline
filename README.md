A bash-script based Powerline style prompt for your shell
=========================================================

A [Powerline](https://github.com/Lokaltog/vim-powerline) like prompt for Bash.

This implementation is based on [Bash-Powerline-Shell](https://github.com/abhijitvalluri/bash-powerline-shell). I have attempted to refactor that code and make it easier to configure. Another change is a switch from 256 colors to the basic 16 terminal colors. This could be seen as a backwards step, but it does have the benefit of alllowing the colors to be set by .Xresources

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

* Clone this repository, or copy the `ps1_prompt` shell script to a suitable location. Let us assume that you placed this in your home directory.

* In your `.bashrc` or `.profile`, whichever is used, source the `ps1_prompt` script as follows:

```
source ~/ps1_prompt
```

# Customization

At this point, this script has no simple option for customization apart from manually editing the script to your liking. Once you get the flow of the script, and after familiarizing yourself with the ANSI color codes, it should be fairly straightforward to enhance the script to your taste.

Some resources that can help you with tweaking the script:

* [ANSI color codes](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors): Color codes for the xterm/uxterm.
* [UTF-8 Unicode test documents](https://github.com/bits/UTF-8-Unicode-Test-Documents.git): Use the test documents in this repo to see what symbols are rendered using your chosen font.
* [PS1 cheat sheet](https://ss64.com/bash/syntax-prompt.html): Prompt variable characters for customizing the output of the PS1 prompt.

If you can contribute to make this script more customizable, please do so and submit a pull request!
