# AKAD-Template – LaTeX-Vorlage für wissenschaftliche Arbeiten

Fertige LaTeX-Vorlage im AKAD-Stil mit allen nötigen Verzeichnissen und
Formatierungen. Einfach die `TODO`-Platzhalter befüllen und loslegen.

## Schnellstart

1. `src/main.tex` öffnen und alle `TODO`-Kommentare ausfüllen (Name, Modul, Titel …)
2. Kapitel in `src/chapters/` schreiben
3. Quellen in `src/bibliography/literatur.bib` eintragen
4. KI-Tools in `src/bibliography/ai-tools.tex` eintragen
5. Build: `./build.sh` oder direkt `latexmk -pdf -cd src/main.tex`

## Struktur

```
src/
├── main.tex                    # Hauptdokument (Präambel, Gliederung)
├── chapters/
│   ├── 01_einleitung.tex       # Einleitung
│   ├── 02_grundlagen.tex       # Theoretische Grundlagen
│   ├── 03_hauptteil.tex        # Hauptteil / Analyse
│   └── 04_fazit.tex            # Fazit und Ausblick
├── appendix/
│   └── anhang.tex              # Anhang (Code, Tabellen, …)
├── bibliography/
│   ├── literatur.bib           # BibTeX-Quellen
│   └── ai-tools.tex            # KI-Hilfsmittel-Verzeichnis
└── assets/images/
    └── akad_logo.png           # AKAD-Logo
```

## Enthaltene Verzeichnisse

- Inhaltsverzeichnis
- Abbildungsverzeichnis
- Tabellenverzeichnis
- Abkürzungsverzeichnis
- Literaturverzeichnis (biblatex, Fußnotenstil)
- AI-Verzeichnis
- Anhangsverzeichnis
- Eidesstattliche Erklärung
