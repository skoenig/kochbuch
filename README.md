## Motivation
Why yet another recipe collection? There are already like a bazillion recipe sites and all sorts of online services and apps that let you manage your favorite recipes.

I want recipes without ads, without push notifications, without registration, without newsletter sign-up pop-ups, and all that other annoying stuff.

Also, most popular recipe blogs always have to tell you their whole life story before they can finally get to the point – present a "simple" recipe.

I just wanted recipes as a collection of simple step-by-step instructions in plain Markdown which can be easily searched and edited, garnished with a bit of metadata and just a touch of additional content pointing out specifics and variations.

## Installation
This repo is pretty self-contained, you only need `make`, `git`, `wget`, and `tar` which should be available for every Linux distribution. The targets `make serve` and `make test` will download the necessary dependencies for basic functionality.

## Usage
1. Edit your recipes in the fitting category in `content/`
2. Run `make serve` to take a look at the rendered result at <http://localhost:1313/>
3. Add newly created files with `git add`
4. Ship it with `make publish` and `git commit`

## Images
Images for recipes should be placed in `static/img`. For converting an image from JPG to the modern WebP format, place it in `assets/${imagename}` and run the make target `static/img/${imagename}.webp`.
You will need to have [`exiftran`](https://www.kraxel.org/blog/linux/fbida/) and [`cwebp`](https://developers.google.com/speed/webp/docs/precompiled) installed for this to work.

## Contributing
If you find bugs or have suggestions for improvement, feel free to submit an [issue](https://github.com/skoenig/cookhack/issues/new). The [UNLICENSE](LICENSE.txt) applies.
