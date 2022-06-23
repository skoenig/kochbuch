## Motivation
Why just another recipe collection? There are already like a bazillion recipe sites and all sorts of online services and apps that let you manage your favorite recipes.

I just wanted to collect the recipes I saw somewhere in one place, without ads, without push notifications, without newsletter sign-up pop-ups, and all that other annoying stuff. Simple step-by-step instructions in plain Markdown which can be easily searched and edited, garnished with a bit of metadata and just a touch of additional content pointing out specifics and variations of the recipe.

A bit more about the background and history can be found on the [About page](content/about.md).

## Installation
This repo is pretty self-contained, you only need `make`, `git`, `wget`, and `tar` which should be available for every Linux distribution. The targets `make serve` and `make test` will download the necessary dependencies.

## Usage
1. Edit your recipes in the fitting category in `content/`
2. Run `make serve` to take a look at the rendered result at <http://localhost:1313/>
3. Add newly created files with `git add`
4. Ship it with `make publish` and `git commit`

## License
The [UNLICENSE](LICENSE.txt) applies.
