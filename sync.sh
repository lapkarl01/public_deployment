#!/usr/bin/env bash
# set -eo pipefail
if [ ! -d env ]; then
    virtualenv env
    source env/bin/activate
    pip install awscli
else
    source env/bin/activate
fi

aws s3 sync . s3://wb-public-deployment --acl public-read --exclude=".git/*" --exclude="sync.sh" --exclude="env/*"  --exclude=".gitignore"
