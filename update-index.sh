#!/bin/bash
cd $(dirname $0)

# replacing all Gollum-style image links with MDwiki compatibles:
# sed -i 's|\[\[\(.*uploads[^|]*\)\|.*|![](\1)|'

root_dir=$(pwd)
find ./ -mindepth 1 -type d | grep -vE '.git|uploads' | while read dir
do
    cd $dir || exit 1
    find ./ -name '*md' ! -name index.md | while read page
    do
        title=${page##*/}
        echo "[${title/.md/}]($page)"
    done > index.md
    cd $root_dir || exit 1
done

