#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Use later version of Ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
alias mux="tmuxinator"

# set autoload path
fpath=(~/.zsh "${fpath[@]}")
autoload kp bip bcp bup ks ll 1ps 1p

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/bglover/.sdkman"
[[ -s "/Users/bglover/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bglover/.sdkman/bin/sdkman-init.sh"

# Aliases
alias cf=cf7
alias k=kubectl
