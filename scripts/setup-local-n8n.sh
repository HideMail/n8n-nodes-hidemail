#!/bin/bash

# Script to set up the HideMail n8n node for local testing

set -e

ECHO_PREFIX="\033[1;36m[HideMail Setup]\033[0m"

echo -e "$ECHO_PREFIX Starting local n8n node setup..."

# Determine n8n custom nodes directory
N8N_USER_FOLDER="$HOME/.n8n"
CUSTOM_NODES_DIR="$N8N_USER_FOLDER/custom"

# Create custom nodes directory if it doesn't exist
if [ ! -d "$CUSTOM_NODES_DIR" ]; then
    echo -e "$ECHO_PREFIX Creating custom nodes directory at $CUSTOM_NODES_DIR"
    mkdir -p "$CUSTOM_NODES_DIR"
fi

# Get the current directory (where this script is run from)
NODE_DIR=$(pwd)

# Check if the node is built
if [ ! -d "$NODE_DIR/dist" ]; then
    echo -e "$ECHO_PREFIX Node is not built yet. Building..."
    npm build
fi

# Create a symbolic link in the n8n custom directory
NODE_NAME=$(basename "$NODE_DIR")
TARGET_LINK="$CUSTOM_NODES_DIR/$NODE_NAME"

# Remove existing link if it exists
if [ -L "$TARGET_LINK" ]; then
    echo -e "$ECHO_PREFIX Removing existing link..."
    rm "$TARGET_LINK"
fi

# Create the symbolic link
echo -e "$ECHO_PREFIX Creating symbolic link from $NODE_DIR to $TARGET_LINK"
ln -s "$NODE_DIR" "$TARGET_LINK"

echo -e "$ECHO_PREFIX Successfully linked HideMail node to your local n8n installation"
echo -e "$ECHO_PREFIX You can now start n8n with: n8n start --tunnel"

# Make the script executable
chmod +x "$0"

echo -e "$ECHO_PREFIX Setup complete!"
