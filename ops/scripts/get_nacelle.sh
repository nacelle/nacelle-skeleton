#!/bin/bash
# Downloads the latest release of nacelle from PyPI and extracts into `app/vendor/`
set -e

if [ -d "app/vendor/nacelle/" ]; then
    echo "nacelle already installed, skipping."
    exit 0
fi

base_url="https://pypi.python.org/pypi/nacelle/json"
url=$(curl -s $base_url | python -c 'import sys, json; print json.load(sys.stdin)["urls"][0]["url"]')
filename=$(curl -s $base_url | python -c 'import sys, json; print json.load(sys.stdin)["urls"][0]["filename"]')
foldername=$(echo $filename | python -c 'import sys; print sys.stdin.read().replace(".tar.gz", "")')

mkdir -p ~/.nacelle
curl $url -o ~/.nacelle/$filename

tar -C ~/.nacelle/ -zxf ~/.nacelle/$filename
cp -R ~/.nacelle/$foldername/nacelle "`pwd`/app/vendor/"
