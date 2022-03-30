#!/usr/bin/env python

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

path.write_text(frontmatter.dumps(info) + "\n")
