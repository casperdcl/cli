#!/bin/bash
# Generate bash completion for this snap.
# Make sure to run this from the root of the outer (non-snap) repository.

go run cmd/gh/main.go completion -s bash | sed -e 's/\bgh\b/gh.gh gh/g' > gh.gh-completion.bash
