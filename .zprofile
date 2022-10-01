eval "$(/opt/homebrew/bin/brew shellenv)"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export HOMEBREW_NO_ANALYTICS=1
export POWERSHELL_TELEMETRY_OPTOUT=1

# Setting the LG_WEBOS_TV_SDK_HOME variable to the parent directory of CLI
export LG_WEBOS_TV_SDK_HOME="/Users/matthewalwan/Misc/webOS_TV_SDK"
 
if [ -d "$LG_WEBOS_TV_SDK_HOME/CLI/bin" ]; then
  # Setting the WEBOS_CLI_TV variable to the bin directory of CLI
  export WEBOS_CLI_TV="$LG_WEBOS_TV_SDK_HOME/CLI/bin"
  # Adding the bin directory of CLI to the PATH variable
  export PATH="$PATH:$WEBOS_CLI_TV"
fi


# Added by Toolbox App
export PATH="$PATH:/Users/matthewalwan/Library/Application Support/JetBrains/Toolbox/scripts"