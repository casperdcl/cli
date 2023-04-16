**This is an unofficial snap package for [GitHub CLI](https://github.com/cli/cli).**

[![Snap upstream releases](https://github.com/casperdcl/cli/actions/workflows/upstream-release.yaml/badge.svg)](https://github.com/casperdcl/cli/actions/workflows/upstream-release.yaml)
[![Nightly Release](https://github.com/casperdcl/cli/actions/workflows/release-nightly.yml/badge.svg)](https://github.com/casperdcl/cli/actions/workflows/release-nightly.yml)

## Install

This snap is not yet available on the snap store. Right now, the steps to install are:

1. Download either the [latest stable release](https://github.com/casperdcl/cli/releases/latest) or [any other release](https://github.com/casperdcl/cli/releases) for your platform.
2. Install with `sudo snap install --classic --dangerous [snap_file].snap`

The [`--classic` flag](https://snapcraft.io/docs/snap-confinement) means we have classic confinement. This allows the application full access to your system, as is in line with many other development tools.
The [`--dangerous` flag](https://snapcraft.io/docs/install-modes#heading--dangerous) allows the unsigned snap file to be installed. 

Please note that you will have to manually install any updates to this snap until it is accepted into the Snap store. It is recommended that you watch this repository's releases until such time as the snap is approved in the snap store, after which you will need to remove the application and install it from the store.

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

## Structure

This repository contains a GitHub workflow that automatically synchronizes upstream releases and builds them. The workflow runs every 6 hours to check for fresh upstream releases. If there are upstream releases, it will extract various Linux platform binaries and package those using this repository's `snapcraft.yaml` file.

Within the upstream release workflow, a tag gets created on this repository to align which commit was used for each release. The snap files are placed into a GitHub release.

## Developing the Snap

If you need to modify `snapcraft.yaml` for the snap, you can begin development as follows:

1. Fork and clone this repository.
2. If necessary, modify the snapcraft.yaml file to point to specific release tarballs you need.
3. Ensure bash completion is available by running `./gh completion -s bash > completion.sh` in the root of this repository.
4. Run `snapcraft` as you normally would.
