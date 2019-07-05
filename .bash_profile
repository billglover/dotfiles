# The majority of my configuration is stored in .bashrc. Load everything there.
if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/bglover/.sdkman"
[[ -s "/Users/bglover/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bglover/.sdkman/bin/sdkman-init.sh"
