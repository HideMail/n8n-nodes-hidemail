# Publishing n8n-nodes-hidemail

This document provides step-by-step instructions for publishing the n8n-nodes-hidemail package to npm.

## Prerequisites

1. An npm account with publishing rights to the package
2. Node.js and npm installed locally
3. All code changes committed and pushed to the repository

## Preparing for Publication

### 1. Update Version

Update the version in `package.json` according to semantic versioning:

- Patch (bug fixes): `0.1.0` → `0.1.1`
- Minor (new features): `0.1.0` → `0.2.0`
- Major (breaking changes): `0.1.0` → `1.0.0`

### 2. Update Changelog

Update the CHANGELOG.md file with details about the new release.

### 3. Run Tests and Checks

Ensure all tests pass and the package builds correctly:

```bash
npm install
npm run lint
npm run build
```

## Publishing to npm

### 1. Login to npm

```bash
npm login
```

Enter your npm username, password, and email when prompted.

### 2. Publish the Package

```bash
npm publish
```

The `prepublishOnly` script will automatically run before publishing, which builds the package and runs linting checks.

### 3. Verify Publication

Verify that your package has been published by checking:

```bash
npm view n8n-nodes-hidemail
```

## Post-Publication

### 1. Create a GitHub Release

1. Go to the GitHub repository
2. Navigate to Releases
3. Create a new release with the same version number
4. Include the changelog information in the release notes

### 2. Announce the Release

Announce the new release on appropriate channels:

- n8n Community Forum
- Your project's social media
- n8n community Discord

## Installation Instructions for Users

Users can install your published node with the following command:

```bash
npm install n8n-nodes-hidemail -g
```

Or they can install it through the n8n UI under Settings > Community Nodes.

## Troubleshooting

If you encounter issues during publication:

1. Check that your package name is unique on npm
2. Ensure you have proper permissions to publish
3. Verify that your `.npmignore` file is correctly configured
4. Check for any errors in the build process
