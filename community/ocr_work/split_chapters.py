#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Split OCR'd full text into chapter-wise markdown files."""
import os, re, glob

WORK = "/home/anik/Desktop/project/All notes/community/ocr_work"
OUTDIR = "/home/anik/Desktop/project/All notes/community/chapters"
os.makedirs(OUTDIR, exist_ok=True)

# chapter boundaries: (start_pdf_page, end_pdf_page, md_filename, title)
CHAPTERS = [
    (1,    15, "Chapter-00_Front_Matter.md", "Front Matter (Cover & Contents)"),
    (16,   28, "Chapter-01_Introduction_to_Community_Medicine.md", "Introduction to the Community Medicine"),
    (29,   70, "Chapter-02_Concept_of_Health_and_Disease.md", "Concept of Health & Disease"),
    (71,  110, "Chapter-03_Principles_of_Epidemiology_and_Methods.md", "Principles of Epidemiology & Epidemiological Methods"),
    (111, 114, "Chapter-04_Screening_for_Diseases.md", "Screening for Diseases"),
    (115, 250, "Chapter-05_Communicable_Diseases.md", "Communicable Diseases"),
    (251, 278, "Chapter-06_Non-communicable_Diseases.md", "Epidemiology of Non-communicable Diseases"),
    (279, 304, "Chapter-07_Entomology.md", "Entomology"),
    (305, 316, "Chapter-08_School_Health_Programme.md", "School Health Programme"),
    (317, 332, "Chapter-09_Demography_Census_and_Fertility.md", "Demography, Census & Fertility"),
    (333, 360, "Chapter-10_Family_Planning.md", "Family Planning"),
    (361, 402, "Chapter-11_Maternal_and_Child_Health.md", "Maternal & Child Health (MCH)"),
    (403, 430, "Chapter-12_Immunology_and_EPI.md", "Immunology & EPI"),
    (431, 438, "Chapter-13_Disinfection_and_Sterilization.md", "Disinfection & Sterilization"),
    (439, 486, "Chapter-14_Nutrition_and_Health.md", "Nutrition & Health"),
    (487, 549, "Chapter-15_Environment_and_Health.md", "Environment & Health"),
    (550, 562, "Chapter-16_Accident_and_Disaster.md", "Accident & Disaster"),
    (563, 581, "Chapter-17_Occupational_Health_and_Ergonomics.md", "Occupational Health & Ergonomics"),
    (582, 583, "Chapter-18_Mental_Health.md", "Mental Health"),
    (584, 588, "Chapter-19_Personal_Hygiene.md", "Personal Hygiene"),
    (589, 614, "Chapter-20_Health_Information_and_Medical_Statistics.md", "Health Information & Basic Medical Statistics"),
    (615, 634, "Chapter-21_Communication.md", "Communication"),
    (635, 650, "Chapter-22_Social_Science_and_Health.md", "Social Science & Health"),
    (651, 666, "Chapter-23_International_Health_and_NGOs.md", "International Health & NGOs"),
    (667, 670, "Chapter-24_Research.md", "Research"),
    (671, 686, "Chapter-25_Health_Administration_and_National_Health_Programmes.md", "Health Administration & National Health Programmes"),
    (687, 722, "Chapter-26_OSPE.md", "OSPE"),
]

pages = {}
for f in sorted(glob.glob(os.path.join(WORK, "pages", "*.txt"))):
    n = int(os.path.basename(f)[:-4])
    with open(f, encoding="utf-8") as fh:
        pages[n] = fh.read()

def clean_block(txt):
    txt = txt.replace("\r\n", "\n").replace("\r", "\n")
    lines = [ln.rstrip() for ln in txt.split("\n")]
    while lines and lines[-1].strip() == "":
        lines.pop()
    return "\n".join(lines)

for start, end, fname, title in CHAPTERS:
    parts = [f"# {title}", ""]
    missing = []
    for p in range(start, end + 1):
        if p not in pages:
            missing.append(p)
            continue
        body = clean_block(pages[p])
        parts.append(f"---\n\n*PDF page {p}*\n")
        parts.append(body)
        parts.append("")
    md = "\n".join(parts)
    out_path = os.path.join(OUTDIR, fname)
    with open(out_path, "w", encoding="utf-8") as fh:
        fh.write(md)
    print(f"{fname}: pages {start}-{end}, {len(md)} chars, missing={missing}")

print("Done. Files:", len(os.listdir(OUTDIR)))