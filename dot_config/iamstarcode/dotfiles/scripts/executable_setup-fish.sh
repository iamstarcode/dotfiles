#!/bin/bash
set -e

FISH_CONFIG="$HOME/.config/fish/config.fish"
DOTFILES_CONFIG="$HOME/.config/iamstarcode/dotfiles/fish/config.fish"
SOURCE_LINE="source $DOTFILES_CONFIG"

echo "Setting up Fish to source dotfiles config..."

# Create .config/fish directory if it doesn't exist
mkdir -p "$HOME/.config/fish"

# If config.fish doesn't exist, create it with the source line at bottom
if [ ! -f "$FISH_CONFIG" ]; then
    echo "Creating $FISH_CONFIG"
    cat > "$FISH_CONFIG" << EOF
# Fish shell main configuration
# Add your custom config above the source line below

$SOURCE_LINE
EOF
    echo "✓ Created $FISH_CONFIG"
else
    # Check if source line already exists
    if ! grep -q "source $DOTFILES_CONFIG" "$FISH_CONFIG"; then
        echo "Adding source line to $FISH_CONFIG"
        # Add source line at the end
        echo "" >> "$FISH_CONFIG"
        echo "$SOURCE_LINE" >> "$FISH_CONFIG"
        echo "✓ Added source line to $FISH_CONFIG"
    else
        echo "✓ Source line already exists in $FISH_CONFIG"
    fi
fi

echo "Setup complete!"
