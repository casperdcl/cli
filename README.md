**This is an unofficial snap package for [GitHub CLI](https://github.com/cli/cli).**

[![Snap upstream releases](https://github.com/lengau/gh-snap/actions/workflows/upstream-release.yaml/badge.svg)](https://github.com/lengau/gh-snap/actions/workflows/upstream-release.yaml)
[![Nightly Release](https://github.com/lengau/gh-snap/actions/workflows/release-nightly.yml/badge.svg)](https://github.com/lengau/gh-snap/actions/workflows/release-nightly.yml)

## Install

This snap is not yet available on the snap store. Right now, the steps to install are:

1. Download either the [latest stable release](https://github.com/lengau/gh-snap/releases/latest) or [any other release](https://github.com/lengau/gh-snap/releases) for your platform.
2. Install with `sudo snap install --classic --dangerous [snap_file].snap`

The [`--classic` flag](https://snapcraft.io/docs/snap-confinement) means we have classic confinement. This allows the application full access to your system, as is in line with many other development tools.
The [`--dangerous` flag](https://snapcraft.io/docs/install-modes#heading--dangerous) allows the unsigned snap file to be installed. 

Please note that you will have to manually install any updates to this snap until it is accepted into the Snap store. It is recommended that you watch this repository's releases until such time as the snap is approved in the snap store, after which you will need to remove the application and install it from the store.

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))
