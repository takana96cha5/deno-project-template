#!/bin/sh

rm -rf .git
cp .devcontainer/.env.example .devcontainer/.env
rm ./init.sh
