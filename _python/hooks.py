def process_info(info, site):
    if "layout" not in info:
        info["layout"] = "simple_page"

    if "title" not in info:
        title = info["components"][-1]
        chars = "-_"
        for c in chars:
            if c in title:
                title = title.replace(c, " ")
        info["title"] = title
