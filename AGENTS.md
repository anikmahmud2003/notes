# Default Instructions

## Auto-note workflow (always follow unless explicitly told otherwise)

When the user provides content (text, questions, answers, PDFs, or any study material):

1. **Create notes** — write a properly structured `.md` file in the correct folder:
   - Pathology item sets → `systemic pathology 15-26 item set questions/Item-XX_Topic.md`
   - Chapter notes → `Pathology/chXX_Topic.md`
   - Other subjects → appropriate folder with consistent naming (`Item-XX_Topic.md`)

2. **Follow existing style** — read 1–2 existing files in the target folder first to match naming convention, formatting, table style, and emoji usage (🔴/📌 = key points, 🎯 = one-liner mnemonics).

3. **Index correctly** — after creating the file:
   - Update the folder's `README.md` — add a row to the item index table + update quick-navigation links
   - Update `/index.html` — add the new file path to the `FALLBACK_PATHS` array
   - If a new folder is created, add it to the `FALLBACK_PATHS` too

4. **Verify** — run these checks before finishing:
   - File exists at the correct path
   - README.md table row matches the file name exactly
   - `FALLBACK_PATHS` in `index.html` contains the file path
   - No duplicate entries
   - No empty/misnamed files left behind

5. **Do not ask** — perform all indexing and verification automatically without being asked.
