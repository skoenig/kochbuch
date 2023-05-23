#!/usr/bin/env python3
# python3 -m pip install pathlib python-frontmatter

import sys
from pathlib import Path

import frontmatter

if not len(sys.argv) == 2:
    print("please give filename as only parameter")
    sys.exit(1)

path = Path(sys.argv[1])

if not path.exists():
    print("{} does not exist".format(path))
    sys.exit(1)

print(path)
info = frontmatter.load(path)

if "title" not in info:
    title = path.stem
    chars = "-_"
    for c in chars:
        if c in title:
            title = title.replace(c, " ")
    info["title"] = title

if "aliases" not in info:
    old_path = "../../{}/{}".format(path.parent.name, path.stem.lower())
    info["aliases"] = [old_path]

path.write_text(frontmatter.dumps(info, sort_keys=False) + "\n")
