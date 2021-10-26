# Functionality Overview

## `data-generator`

Contains the `hospital-events.Rmd` R Markdown document that is published to Connect to generate a _pin_ used by the parameterized source R Markdown document, `hospital-report.Rmd`, that is located in the `params-api` directory.

## `params-api`

- Contains two components that get published together:
  - `hospital-report.Rmd`: The parameterized source R Markdown document that gets injected by the API to render variants.
  - `plumber.R`: The API specification with user defined details located between lines `44-55`.

## `self-service-params`

The Self-service Streamlit app that generates a preview when creating a single variant. Leverages the `params-api` functionality, and can be used to create one or many variants per request.
