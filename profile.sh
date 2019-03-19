case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

##
# Your previous /Users/iain/.profile file was backed up as /Users/iain/.profile.macports-saved_2018-06-24_at_15:33:56
##

# MacPorts Installer addition on 2018-06-24_at_15:33:56: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

