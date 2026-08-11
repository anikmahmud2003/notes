# Study Notes — Master Hub

Everything study-related, in one repo, readable from any browser.

## Contents

| Path | What it is |
|---|---|
| [Pathology/](Pathology/) | Full Robbins-based Pathology notes — 29 chapters, index, start-here guide |
| [Pathology/flashcards_hepatobiliary/index.html](Pathology/flashcards_hepatobiliary/index.html) | Interactive Hepatobiliary flashcards |
| [Pathology/viva set question/](Pathology/viva%20set%20question/) | Viva question banks with answers (Item 5 Respiratory) |
| [davidson/davidson_immunology_bangla.html](davidson/davidson_immunology_bangla.html) | Davidson Immunology notes (Bangla) |
| [bd-constitution.html](bd-constitution.html) | Bangladesh Constitution notes |

## Local-only (not in this repo)

Big PDFs stay on the laptop and are referenced from notes — never uploaded:

| Book | Location |
|---|---|
| Davidson's Principles & Practice of Medicine 25th ed. | `All notes/davidson/` |
| Robbins & Cotran Pathologic Basis of Disease 10th ed. | `All notes/Pathology/` |
| c immunology.pdf | `All notes/davidson/` |

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
3. Read anywhere: open this repo on github.com in any browser.
