# Manuscript editorial review protocol

This is a working baseline for author review and educational development, **not a scientifically peer-reviewed textbook**.

## Content integration process

1. Review each chapter in `editorial/chapter-status.csv` and mark scope as **keep / revise / merge / remove**.
2. Assign existing foundation-course slide numbers (approx. 300 slides; materials not yet supplied).
3. Replace or supplement the baseline teaching case with verified course examples.
4. Independently verify every numerical substitution and rounding convention.
5. Compare the result with the specific version/commit of the companion calculator and one independent reference where appropriate.
6. Validate assumptions and clinical interpretability with statistical and subject-matter reviewers.
7. Record reference details, permission for any third-party graphics and reviewer sign-off.
8. Review HTML navigation, narrow print-page layout, PDF equation breaks, bibliography and images before publication.

## Definition of ready for publication

- No unresolved critical errors or mismatched hypotheses.
- Every worked example has a method, assumptions, source/provenance, reproducible calculation, interpretation and study-specific limitations.
- Clear distinction between supported application modules and unsolved or unsupported designs.
- Authorisation to reproduce or adapt each imported slide, visual or third-party image.
- No unsupported claim of institutional endorsement.
- External statistical review plus final editorial approval.
- Citation links, EPUB/HTML/PDF display and metadata checked from rendered outputs.

## Status codes

`baseline-draft`: minimal teaching content written but not approved.
`needs-slide-review`: course material pending.
`needs-statistical-review`: worked example awaiting independent checks.
`approved`: only after an identified reviewer signs off.

## Content-to-slide mapping columns

- `chapter` / `file`: numbered source chapter.
- `slide_range`: original slide index(es) to import after author review.
- `example_1`: verify baseline teaching case.
- `example_2`: case pending integration.
- `method_review`: named statistician and date.
- `publish_status`: not approved by default.
