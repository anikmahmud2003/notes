# Study Notes — Master Hub By Anik Mahmud SZMC 32 

Everything study-related, in one repo, readable from any browser.

**Best viewed as a website:** https://anikmahmud2003.github.io/notes/

## Contents

| Path | What it is |
|---|---|
| [index.html](index.html) | Hub page — links to all HTML notes (also the GitHub Pages front door) |
| [Pathology/](Pathology/) | Full Robbins-based Pathology notes + item-set question banks |
| [Pathology/robbins/](Pathology/robbins/) | Robbins & Cotran chapter notes — 29 chapters, index, start-here guide |
| [Pathology/systemic pathology set questions/](Pathology/systemic%20pathology%20set%20questions/) | Systemic Pathology item-set question bank with answers (all Items 1–26, ≈330 Qs, Robbins + Arif references) |
| [Medicine/davidson/davidson_immunology_bangla.html](Medicine/davidson/davidson_immunology_bangla.html) | Davidson Immunology notes (Bangla) |
| [GK/bd-constitution.html](GK/bd-constitution.html) | Bangladesh Constitution notes |

## Local-only (not in this repo)

Big PDFs stay on the laptop and are referenced from notes — never uploaded:

| Book | Location |
|---|---|
| Davidson's Principles & Practice of Medicine 25th ed. | `All notes/Medicine/davidson/` |
| Robbins & Cotran Pathologic Basis of Disease 10th ed. | `All notes/Pathology/robbins/` |
| c immunology.pdf | `All notes/Medicine/davidson/` |

## How new subjects get added

Add a new subfolder (e.g. `Physiology/`, `Medicine/`) with markdown notes, then commit and push:

```
git add -A
git commit -m "add <subject> notes"
git push
```

## Workflow

1. Edit notes in Obsidian (open this folder as a vault).
2. Commit + push with the commands above (or the obsidian-git plugin).
3. Read anywhere: open https://anikmahmud2003.github.io/notes/ in any browser.
