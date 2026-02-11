# =======================
# MINIMAL FISH CONFIG
# =======================
# Single file config - mise, starship, and Android SDK

# Only run interactive shell setup
if status is-login
    # Disable greeting
    set -g fish_greeting ""

    # Set default editor
    set -gx EDITOR nvim
    set -gx VISUAL nvim

    # =======================
    # MISE ACTIVATION
    # =======================
    if type -q mise
        mise activate fish | source
    end

    # =======================
    # STARSHIP PROMPT
    # =======================
    if type -q starship
        starship init fish | source
    end
end

# =======================
# ANDROID SDK PATHS
# =======================
if test -d "$HOME/Android/Sdk"
    set -gx ANDROID_HOME "$HOME/Android/Sdk"
    
    # Command line tools
    if test -d "$ANDROID_HOME/cmdline-tools/latest/bin"
        set -gx PATH "$ANDROID_HOME/cmdline-tools/latest/bin" $PATH
    end
    
    # Platform tools
    if test -d "$ANDROID_HOME/platform-tools"
        set -gx PATH "$ANDROID_HOME/platform-tools" $PATH
    end
    
    # Emulator
    if test -d "$ANDROID_HOME/emulator"
        set -gx PATH "$ANDROID_HOME/emulator" $PATH
    end
    
end
