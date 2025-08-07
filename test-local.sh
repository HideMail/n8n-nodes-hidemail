#!/bin/bash

echo "🚀 Setting up local n8n testing environment..."

# Create a temporary directory for n8n
mkdir -p ~/n8n-test
cd ~/n8n-test

# Install n8n locally if not already installed
if ! command -v n8n &> /dev/null; then
    echo "📦 Installing n8n..."
    npm install -g n8n
fi

# Link your custom node
echo "🔗 Linking HideMail node..."
npm link n8n-nodes-hidemail

# Set environment variables for testing
export N8N_CUSTOM_EXTENSIONS="$(pwd)/node_modules"

echo "✅ Setup complete!"
echo "🌐 Starting n8n on http://localhost:5678"
echo "👤 Default credentials: admin / password"
echo ""
echo "To start n8n, run: n8n start"
