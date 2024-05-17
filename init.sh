#!/bin/sh

PROJECT_NAME=$1
WORKSPACE_REPO="https://github.com/takana96cha5/my-workspace.git"

# Clone the repository
git clone ${WORKSPACE_REPO} ${PROJECT_NAME}
cd ${PROJECT_NAME}

# Remove .git directory
rm -rf .git

# Copy .env.example to .env if .env does not exist
if [ ! -f .devcontainer/.env ]; then
    cp .devcontainer/.env.example .devcontainer/.env
fi

# Remove unnecessary files
rm -f .devcontainer/make_env.sh
rm -f init.sh
