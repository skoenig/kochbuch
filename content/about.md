---
title: "Über diese Seite"
description: "Wie ist dieses Kochbuch entstanden?"
layout: simple
---

Das hier ist nur eine persönliche Sammlung von Rezepten, die entstanden sind, als ich angefangen habe selber zu kochen und mich mehr mit gesunder Ernährung zu beschäftigen. Zuerst hatte ich dafür ein [zim](http://zim-wiki.org/) Wiki benutzt. Später wurde wurden die Sammlung zum kollaborativen Bearbeiten in ein [gollum](https://github.com/gollum/gollum) Wiki auf dem Fileserver der WG gehostet. Nachdem mein Mitbewohner ausgezogen war, hab ich das Rezepte-Repository mit vim bearbeitet und mit [mdwiki](http://dynalon.github.io/mdwiki/#!index.md) per Dropbox gehostet.

Statisch generierte Webseiten sind für die meisten Suchmaschinen und Browser besser funktioniert, deswegen habe ich den Inhalt 2015 auf [urubu](https://github.com/jandecaluwe/urubu) migriert und zuerst auf [Uberspace](https://uberspace.de) und später [GitHub Pages](https://pages.github.com/) gehostet.

Weil [urubu](https://github.com/jandecaluwe/urubu) scheinbar nicht mehr aktiv weiterentwickelt wird, hab ich das Kochbuch Anfang 2022 auf [Hugo](https://gohugo.io/) migriert und ihm eine eigene Domain verpasst: <https://cookhack.net>.

Den Quelltext findet ihr auf [GitHub](https://github.com/skoenig/cookhack). Wenn ihr Fehler findet oder Verbesserungsvorschläge habt, reicht gerne ein [Issue](https://github.com/skoenig/cookhack/issues) ein. Es gilt die [UNLICENSE](/LICENSE.txt).

Um die Seite lokal zu bauen, checkt einfach das [GitHub repo](https://github.com/skoenig/cookhack) aus, installiert die Abhängigkeiten mit `make install` und startet einen lokalen Server mit `make serve`. Die Seite ist dann unter <http://localhost:1313/> zu erreichen.
