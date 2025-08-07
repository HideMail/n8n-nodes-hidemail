# Testing the HideMail n8n Node

This document provides detailed instructions for testing the HideMail n8n node in a local environment on macOS.

## Local Development Environment Setup

### 1. System Requirements

- macOS
- Node.js >=18.10
- npm >=7

### 2. Install n8n CLI

If you don't have n8n installed globally, you can install it with:

```bash
npm install n8n -g
```

## Setting Up the HideMail Node for Testing

### 1. Clone and Install Dependencies

If you haven't already:

```bash
git clone <repository-url>
cd <repository-directory>
npm install
```

### 2. Build the Node

```bash
npm run build
```

This compiles the TypeScript code and processes the node icons.

### 3. Link to Local n8n Instance

Run the provided setup script which creates a symbolic link to your local n8n custom nodes directory:

```bash
./scripts/setup-local-n8n.sh
```

## Running and Testing

### 1. Start n8n with Your Custom Node

```bash
n8n start --tunnel
```

The `--tunnel` flag creates a temporary URL that you can use to expose your local instance to the internet if needed for webhook testing.

### 2. Access the n8n Editor

Open your browser and navigate to:

```
http://localhost:5678
```

### 3. Create a Test Workflow

1. Click "Create new workflow"
2. Add a trigger node (like "Manual")
3. Search for "HideMail" in the nodes panel
4. Add the HideMail node and connect it to your trigger

### 4. Configure the HideMail Node

1. Click on the HideMail node to configure it
2. Add your API credentials (you may need to create these first in the Credentials section)
3. Configure the operation you want to test
4. Save the workflow

### 5. Execute the Workflow

1. Click the "Execute Workflow" button
2. Check the execution results
3. Debug any issues by viewing the logs

## Development Workflow

### Real-time Development

For development with automatic recompilation:

```bash
npm run dev
```

This watches for file changes and rebuilds automatically.

### Testing Changes

After making changes to the node:

1. If using `npm run dev`, just save your files and wait for compilation
2. If not, run `npm run build` to rebuild
3. Restart n8n with `n8n start --tunnel`
4. Test your changes in the n8n UI

## Common Issues and Solutions

### Node Not Appearing in n8n

- Ensure the node is built properly with `npm run build`
- Check that the symbolic link was created correctly
- Restart n8n completely

### API Connection Issues

- Verify your API credentials
- Check network connectivity
- Review the HideMail API documentation for any endpoint changes

### Node Execution Errors

- Check the execution logs in n8n
- Ensure you're using the correct input parameters
- Verify the API responses match what your node expects

## Getting HideMail API Credentials

1. Sign up at [HideMail.app](https://hidemail.app)
2. Navigate to your account settings
3. Generate API credentials
4. Use these credentials in your n8n HideMail node configuration
