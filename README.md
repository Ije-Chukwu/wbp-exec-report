# WBP Executive Report — PU5926

**Author:** Ijeoma Nwachukwu  
**Institution:** University of Aberdeen — Biostatistics and Health Data Science (BHDS) Group  
**Module:** PU5926 Work Based Placement (WBP)  
**Date:** August–September 2025

---

## Overview

This repository contains the deliverables for a professional Work Based Placement (WBP) in Health Data Science, carried out within the Biostatistics and Health Data Science (BHDS) Group at the University of Aberdeen. The placement focused on two interconnected aims:

1. **Building a global health data repository** — automated download, organisation, and archiving of 38 years (1984–2022) of Demographic and Health Surveys (DHS) datasets in a structured, reproducible workflow.
2. **Pooled cross-country exploratory data analysis (EDA)** of Gender Inequalities in women of childbearing age across Low- and Middle-Income Countries (LMICs), using harmonised [IPUMS-DHS](https://www.idhsdata.org/idhs/) datasets.

The work was motivated by the temporary suspension of the DHS-Program in 2025, which restricted access to datasets widely used by students and researchers at the BHDS Group and across LMICs. The project mitigates this disruption and supports the continuity of global health research and training.

---

## Repository Contents

| File / Folder | Description |
|---|---|
| `exec-report.Rmd` | Main R Markdown source for the Executive Report (Part A) |
| `exec-report.html` | Rendered HTML output of the executive report |
| `exec-report.pdf` | PDF output of the executive report |
| `exec-report.tex` | LaTeX source generated from R Markdown |
| `PU5926 WBP Executive Report-PartA.docx` | Word document version of Part A |
| `PU5926 WBP Executive Report-PartA.pdf` | PDF version of Part A |
| `wbp-exec-report-partb.pdf` | Executive Report Part B |
| `WBP Presentation_BHDS Group.pptx` | Placement presentation slides |
| `ASSESSMENT-3-POST-PLACEMENT-PRESENTATION_52424748.pdf` | Post-placement presentation (Assessment 3) |
| `crosstab-spss-syntax.sps` | SPSS syntax for cross-tabulation analysis |
| `df_ipv.xml` | IPV cross-tabulation data (XML format) |
| `references.bib` | BibTeX references |
| `justify.css` | CSS stylesheet for HTML report |
| `uoa-logo.jpg` | University of Aberdeen logo |
| `bhds-logo.jpg` | BHDS Group logo |
| `wbp-exrep.Rproj` | RStudio project file |
| `wbp_assessment_feedback.pdf` | Assessment feedback document |

---

## Project Background

The [DHS Program](https://dhsprogram.com), funded by USAID, collects nationally representative global health data used to monitor and evaluate population, health, and nutrition programs and to track approximately 30 Sustainable Development Goal (SDG) indicators (particularly SDG 3 and SDG 5). In 2025, the programme was suspended and placed under review for further funding, halting new user registrations and significantly restricting dataset access for students, trainees, and researchers — especially in LMICs.

This placement addressed that gap by building a local, reproducible data repository for the BHDS Group and conducting exploratory analyses to support ongoing global health projects.

---

## Methods

The project was carried out in **three phases**, with documentation throughout for transparency and reproducibility.

### Phase 1 — Automated DHS Dataset Download

A structured, reproducible R Markdown workflow was developed to:

- Securely access and automatically download DHS datasets from the DHS-Program website.
- Unzip, organise, and archive datasets in a hierarchical file structure:
  ```
  FileName / CountryName / SurveyYear / DataType
  ```
- Support SPSS and STATA data formats as specified in the project tasks.

### Phase 2 — DHS IR File Merge (Pilot)

A reproducible SPSS-based workflow was created to merge DHS Individual Recode (IR) datasets for **Kenya (2022)** and **Tanzania (2022)**:

- A cross-country unique identifier (`UCASEID`) was constructed by concatenating the country-cluster code (`V000`) and the case ID (`CASEID`).
- Subsets containing `UCASEID` and relevant IPV variables were saved and merged using SPSS `ADD FILES`.
- The workflow is designed to be adapted for additional countries and survey rounds, provided variable names and labels are verified against the DHS Recode Manual.
- Full SPSS syntax is provided in **Appendix 1** of the report.

### Phase 3 — Exploratory Data Analysis (IPUMS-DHS)

Cross-country EDA was performed using harmonised IPUMS-DHS datasets:

1. **Cross-tabulations** were generated in SPSS for three key gender inequality variables.
2. SPSS output tables were cleaned in Excel (steps documented in **Appendix 2** of the report).
3. Cleaned data were imported into R to produce **interactive visualisations** using `plotly`.

---

## Gender Inequality Indicators Analysed

| Indicator | IPUMS Variable Code | Description |
|---|---|---|
| **Intimate Partner Violence (IPV)** | `DVPSLAPFQ` | Percentage of women slapped in the last 12 months (by frequency) by an intimate partner |
| **Female Genital Mutilation (FGM)** | `FCCIRC` | Percentage of ever-circumcised women within each country |
| **Autonomy of Health Care Decision Making (AHCDM)** | `DECFEMHCARE` | Percentage of women who have the final say on their own health care |

Key findings from the visualisations include:

- **IPV**: Most countries show that a significant proportion of women have never been slapped by an intimate partner; however, notable proportions in countries such as Sao Tome and Principe and Zimbabwe report being slapped sometimes or often in the past year.
- **FGM**: Prevalence varies widely across countries, reflecting differing cultural practices.
- **AHCDM**: In many countries, health decisions are predominantly made jointly with a husband/partner or by the husband/partner alone; countries such as Mozambique, Lesotho, and Madagascar show higher proportions of women with autonomous decision-making.

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| **R / R Markdown** | Report authoring, data cleaning, visualisation |
| **plotly** | Interactive stacked bar charts |
| **dplyr, tidyr, forcats** | Data manipulation and reshaping |
| **readxl** | Import Excel-formatted SPSS output |
| **SPSS** | Cross-tabulation analysis and dataset merging |
| **RStudio** | Integrated development environment (`.Rproj`) |

---

## Output File Structure (OneDrive)

Project outputs are saved to OneDrive in the following structure:

```
DHS-Download Task
├── [DHS_Downloads]
└── [Downloads report, metadata, log]

[Gender Inequalities]
├── [DHS]
│   ├── [dhs-ir-pilot-merge-KE8_TZ8]
│   └── [planning-and-var-map]
└── [IPUMS]
    ├── [ipums-analysis]
    │   ├── [r-project-files-exec-report]
    │   └── [spss-analysis]
    ├── [ipums-data-extracts-comd-files]
    ├── [ipums-ir-dataset]
    └── [ipums-planning-and-var-map]
```

---

## Implications for the Organisation

- **Easy access** to global DHS datasets for the BHDS Group.
- **Data preservation** pending the resumption of the DHS Program, and resilience against potential future suspensions.
- **Continuity of training and research** for students and researchers working on global health projects.

---

## Reproducing the Report

1. Open `wbp-exrep.Rproj` in RStudio.
2. Ensure the following R packages are installed (the setup chunk in `exec-report.Rmd` handles installation automatically):
   - `rmarkdown`, `knitr`, `dplyr`, `plotly`, `readxl`, `tidyr`, `forcats`, `webshot2`
3. Place the input data file `ipv-fgm-ahcdm-spss-output.xlsx` in the project root directory (not included in this repository — data are held on OneDrive).
4. Knit `exec-report.Rmd` to produce the HTML or PDF output.

> **Note:** DHS and IPUMS-DHS datasets require registration and approved access. New DHS registrations may be restricted during the current programme suspension. See [IPUMS-DHS](https://www.idhsdata.org/idhs/) for harmonised dataset access.

---

## References

- The DHS Program. (2025). *Sustainable Development Goals.* https://dhsprogram.com/topics/sdgs/index.cfm
- The DHS Program. (2025). *Merging Datasets.* https://dhsprogram.com/data/Merging-datasets.cfm
- Wessells, M. G., & Kostelny, K. (2022). The psychosocial impacts of intimate partner violence against women in LMIC contexts: Toward a holistic approach. *International Journal of Environmental Research and Public Health, 19*(21), 14488. https://doi.org/10.3390/ijerph192114488

---

## Abbreviations

| Abbreviation | Meaning |
|---|---|
| AHCDM | Autonomy of Health Care Decision Making |
| BHDS | Biostatistics and Health Data Science |
| DHS | Demographic and Health Surveys |
| EDA | Exploratory Data Analysis |
| FGM | Female Genital Mutilation |
| IPUMS | Integrated Public Use Microdata Series |
| IPV | Intimate Partner Violence |
| LMICs | Low- and Middle-Income Countries |
| SDG | Sustainable Development Goal |
| SPSS | Statistical Package for the Social Sciences |
| USAID | United States Agency for International Development |
| WBP | Work Based Placement |