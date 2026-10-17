# Sample Size Made Easy — Quarto Book Project

**Status:** baseline manuscript for author review; not peer-reviewed or release-ready.

This is an editable, reproducible Quarto Book project with **36 short chapters across six parts, five appendices, bibliography, print/HTML styling, exercises, callouts, and source R examples**. The foundation-course slide deck and author-provided worked examples are **not included yet**. Every chapter marks where its second example should be inserted.

A local TeX installation with **XeLaTeX** (e.g. TeX Live) is required for the PDF edition. The PDF is **6 × 9 inches** as a preliminary Amazon paperback trim-size layout, not a final print-ready proof. Publisher-specific cover, spine, bleeds, margins, fonts and actual pagination still need review.

To validate the independent baseline arithmetic using local R:

``` powershell
Rscript scripts/check-examples.R
Rscript scripts/reproduce-examples.R
```

To regenerate the illustrative precision plot, run:

``` powershell
Rscript scripts/generate-plots.R
```

`assets/precision-sensitivity.png` is already included so the book does not require R for ordinary rendering.

## Editing workflow

-   Review `editorial/chapter-status.csv` to track what stays or changes.
-   Use `editorial/REVIEW-PROTOCOL.md` as the author and external reviewer checklist.
-   Edit chapter files in `chapters/` (one topic per file).
-   Add verified worked examples after checking the source slide and computation.
-   Add scientific references to `references.bib`, cite using `[@citation-key]`.
-   The landing page is `index.qmd`; preface is `preface.qmd`.
-   Book navigation, publication formats and metadata are in `_quarto.yml`.
-   HTML styling is controlled by `assets/book.css`.

## Methodological scope

The chapter examples are illustrative, frequently based on **normal approximations**, and not a replacement for design-specific expert planning. The book explicitly identifies unsupported methods (survival, prediction-model development, paired/repeated measurements, cluster-randomised trials). It does not assume that optional ICC/design-effect/FPC controls have already been deployed in the existing Shiny app.

## Automated validation

`python scripts/preflight.py` performs structural and citation/reference checks without rendering. This is optional; Python is not needed to render the Quarto book.

**Rendering note:** this project has been structurally validated in the authoring environment, but HTML/PDF/EPUB were not rendered there because Quarto, R and XeLaTeX are not installed in that environment. Run the commands above in your local installation and visually review before publishing.

## Sources and licensing

Core methodological references are in `references.bib`. Draft text is original working material. A final content licence and ISBN are not selected. The companion [sample-size-calculator](https://github.com/DrNaveen01/sample-size-calculator) has its own software licence; this book is a separate editorial work.
