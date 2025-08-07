#!/bin/bash

echo "🔄 Starting n8n with HideMail node..."

# Set environment variables to include custom nodes
export N8N_CUSTOM_EXTENSIONS=~/.n8n/custom
export N8N_NODES_INCLUDE='["n8n-nodes-hidemail"]'

# Start n8n
echo "🚀 Starting n8n on http://localhost:5678"
echo "📝 Your HideMail node should be available in the node palette"
echo ""

npx n8n
