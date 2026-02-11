#!/bin/bash
set -e

HYPR_CONFIG="$HOME/.config/hypr/hyprland.conf"
DOTFILES_INDEX="$HOME/.config/iamstarcode/dotfiles/hypr/hyprland.conf"
SOURCE_LINE="source = $DOTFILES_INDEX"

echo "Setting up Hyprland to source dotfiles config..."

# Create .config/hypr directory if it doesn't exist
mkdir -p "$HOME/.config/hypr"

# If hyprland.conf doesn't exist, create it with the source line at bottom
if [ ! -f "$HYPR_CONFIG" ]; then
    echo "Creating $HYPR_CONFIG"
    cat > "$HYPR_CONFIG" << EOF
# Hyprland main configuration
# Add your custom config above the source line below

$SOURCE_LINE
EOF
    echo "✓ Created $HYPR_CONFIG"
else
    # Check if source line already exists
    if ! grep -q "source = $DOTFILES_INDEX" "$HYPR_CONFIG"; then
        echo "Adding source line to $HYPR_CONFIG"
        # Add source line at the end
        echo "" >> "$HYPR_CONFIG"
        echo "$SOURCE_LINE" >> "$HYPR_CONFIG"
        echo "✓ Added source line to $HYPR_CONFIG"
    else
        echo "✓ Source line already exists in $HYPR_CONFIG"
    fi
fi

echo "Setup complete!"
