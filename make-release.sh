#!/usr/bin/env nix-shell
#!nix-shell -p git -p nix -p gitAndTools.hub -i bash

set -eux -o pipefail

version=$(nix eval --raw '(import ./nix/release.nix {}).tarball.version')
git checkout master
git tag -d "$version" || true
git tag "$version"
git push --tags
