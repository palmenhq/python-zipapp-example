#!/usr/bin/env sh
set -xeuo pipefail # never forget this in your shell scripts ;)

rm -rf target/*
mkdir -p bin target tmp
cp -r greet/ target
pip3 install -r requirements.txt --target target
python3 -m zipapp target -o tmp/greet.pyz
echo '#!/usr/bin/env python3' | cat - tmp/greet.pyz > bin/greet
chmod u+x bin/greet
