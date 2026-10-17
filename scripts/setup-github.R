# One-time usethis workflow for the Sample Size Made Easy Quarto book.
# Run from the project root in RStudio: source("scripts/setup-github.R")
# Requires an authenticated GitHub account via git / gh / a GitHub PAT.
# The deployable workflow is already included in .github/workflows/publish.yml.

if (!file.exists("_quarto.yml") || !file.exists("sample-size-made-easy.Rproj")) {
  stop("Run this script from the Sample Size Made Easy project root.")
}

if (!requireNamespace("usethis", quietly = TRUE)) {
  install.packages("usethis")
}

usethis::proj_set(getwd())

# Scaffold from Quarto's official GitHub Action *through usethis* only when
# the workflow is absent. Then install this book's reviewed Pages configuration.
# The official upstream template is an example with publishing commented out.
workflow <- file.path(".github", "workflows", "publish.yml")
if (!file.exists(workflow)) {
  usethis::use_github_action(
    url = paste0(
      "https://github.com/quarto-dev/quarto-actions/",
      "blob/main/examples/quarto-publish-example.yml"
    ),
    save_as = "publish.yml",
    ignore = FALSE,
    open = FALSE
  )
  file.copy("scripts/templates/publish.yml", workflow, overwrite = TRUE)
  message("Installed the configured GitHub Pages workflow: ", workflow)
} else {
  message("GitHub Actions workflow exists; preserving it: ", workflow)
}

# Create the source repository (interactive authentication and commit prompts).
# This script does not configure repository Pages settings; do that on GitHub.
if (!file.exists(".git")) {
  usethis::use_git()
}

# If 'origin' already exists, do not try to recreate a GitHub repository.
remote <- suppressWarnings(system2(
  "git", c("remote", "get-url", "origin"), stdout = TRUE, stderr = FALSE
))
if (length(remote) == 0L || !nzchar(remote[[1]])) {
  usethis::use_github(private = FALSE)
} else {
  message("Existing origin remote: ", remote[[1]])
}

message(paste(
  "On GitHub: Settings > Pages > Build and deployment > Source:",
  "GitHub Actions. Commit and push the included workflow to main.",
  "The book is published automatically on subsequent pushes to main."
))
