#!/bin/bash

# Script to publish the HideMail n8n node to npm

set -e

ECHO_PREFIX="\033[1;36m[HideMail Publish]\033[0m"

echo -e "$ECHO_PREFIX Starting publishing process..."

# Make sure we're in the project root
CURRENT_DIR=$(pwd)
PROJECT_NAME="n8n-nodes-hidemail"

if [[ "$(basename "$CURRENT_DIR")" != "$PROJECT_NAME" ]]; then
  echo -e "$ECHO_PREFIX Error: Please run this script from the project root directory."
  exit 1
fi

# Check if user is logged in to npm
echo -e "$ECHO_PREFIX Checking npm login status..."
NPM_USER=$(npm whoami 2>/dev/null || echo "")

if [ -z "$NPM_USER" ]; then
  echo -e "$ECHO_PREFIX You are not logged in to npm. Please login first with 'npm login'."
  exit 1
fi

echo -e "$ECHO_PREFIX Logged in as: $NPM_USER"

# Check for uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
  echo -e "$ECHO_PREFIX Warning: You have uncommitted changes."
  read -p "Do you want to continue anyway? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "$ECHO_PREFIX Publishing canceled."
    exit 1
  fi
fi

# Install dependencies
echo -e "$ECHO_PREFIX Installing dependencies..."
npm install

# Run linting
echo -e "$ECHO_PREFIX Running linting..."
npm run lint

# Build the package
echo -e "$ECHO_PREFIX Building package..."
npm run build

# Get current version from package.json
VERSION=$(node -p "require('./package.json').version")
echo -e "$ECHO_PREFIX Current version: $VERSION"

# Ask for version confirmation
read -p "Is this version correct? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo -e "$ECHO_PREFIX Please update the version in package.json before publishing."
  exit 1
fi

# Publish to npm
echo -e "$ECHO_PREFIX Publishing to npm..."
npm publish

echo -e "$ECHO_PREFIX Successfully published version $VERSION to npm!"

# Remind about GitHub release
echo -e "$ECHO_PREFIX Don't forget to create a GitHub release with tag v$VERSION"
