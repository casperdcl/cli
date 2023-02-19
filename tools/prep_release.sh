#!/usr/bin/env bash
# Prepare the repository for the changes coming from an upstream release.

set -eu -o pipefail

upstream_release=$1
release_tag=$2
release_file=$3

echo "Preparing upstream release ${upstream_release}"

read -r -d '\r' jq_filter << EOM
.assets[].browser_download_url |
match(".*linux_([a-z0-9]*).tar[a-z.]*") |
"      - to " + .captures[0].string + ": " + .string
\r
EOM
sources=$(jq --raw-output "${jq_filter}" "${release_file}")
sources=$(echo "${sources}" | sed -e 's/386:/i386:/' -e 's/armv6:/armhf:/')
export sources

echo "Setting version to ${release_tag}"
sed -i 's/^\(version: \).*$/\1'"${release_tag}"'/' snap/snapcraft.yaml

echo "New Sources:"
echo "${sources}"

# shellcheck disable=SC2016
perl_script='s/(source:\n)(.|\n)+?(\s+# endsources)/\1$ENV{"sources"}\3/g'
perl -0 -pi -e "${perl_script}" snap/snapcraft.yaml

echo "Setting up bash completion..."
case "${RUNNER_ARCH}" in
X86)
  file_pattern='.*linux_386.tar[a-z.]*'
  ;;
X64)
  file_pattern='.*linux_amd64.tar[a-z.]*'
  ;;
ARM64)
  file_pattern='.*linux_arm64.tar[a-z.]*'
  ;;
ARM)
  file_pattern='.*linux_armv6.tar[a-z.]*'
  ;;
esac

jq_filter=".assets[].browser_download_url | match(\"${file_pattern}\") | .string"
file_url=$(jq --raw-output "${jq_filter}" "${release_file}")
echo "Downloading release at ${file_url}"
wget -nv -O - "${file_url}" | tar zx --wildcards "*bin/gh" -O > gh
chmod +x gh
./gh completion -s bash > completion.sh
rm gh
