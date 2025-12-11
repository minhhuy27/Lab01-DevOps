# Deployment Runbook

This runbook describes how to deploy, validate, monitor, and roll back the dbt + Airflow project using the GitHub Actions workflows added under `.github/workflows`.

## Environments and Secrets
- **Environments:** `dev` (branch `develop`) and `prod` (branch `main`). Manual runs can target either environment.
- **Secrets required (set at repo or environment level):**
  - `DBT_DEV_SERVER`, `DBT_DEV_USER`, `DBT_DEV_PASSWORD`, `DBT_DEV_DATABASE` (dev)
  - `DBT_PROD_SERVER`, `DBT_PROD_USER`, `DBT_PROD_PASSWORD`, `DBT_PROD_DATABASE` (prod)
  - Optional: `DBT_ODBC_DRIVER` (defaults to `ODBC Driver 17 for SQL Server`)

## CI Workflow (pull requests)
Workflow: `.github/workflows/ci.yml`
- Validates PR title format, change size, and merge conflicts.
- Lints Python (`black`, `flake8`) and SQL (`sqlfluff`).
- Runs `dbt deps` + `dbt compile` and `dbt test --store-failures`.
- Builds dbt docs and uploads artifacts (`dbt-docs`, `dbt-test-artifacts`).

### How to run
- Open a PR against `develop` or `main` and push commits. The workflow triggers automatically.
- For manual validation, use **Actions > CI > Run workflow**.

## Deployment Workflow
Workflow: `.github/workflows/deploy.yml`

### Triggers
- **Automatic:** Push to `develop` deploys to `dev`; push to `main` deploys to `prod`.
- **Manual:** Actions > Deploy > Run workflow. Choose `run_mode=deploy` and `target_env` (`dev` or `prod`).

### Steps executed
1. **Preflight:** `dbt deps`, `dbt debug`, `dbt compile --warn-error`.
2. **Deploy:** `dbt run --fail-fast` followed by `dbt test --store-failures --fail-fast`.
3. **Health checks:** `dbt source freshness` + model listing for quick verification.
4. **Artifacts:** `dbt-logs.tar.gz` + `dbt/target` uploaded for each run.
5. **Notifications:** Commit comment posted with status and environment.

### Rollback
- Manual only: Actions > Deploy, set `run_mode=rollback`, `target_env` (`dev` or `prod`), and `rollback_ref` (commit/branch/tag to redeploy).
- The rollback job checks out the requested ref, runs `dbt deps`, `dbt run --full-refresh`, and `dbt test --store-failures`.
- Notification comment is posted with the rollback result.

## Monitoring and History
- **Status:** GitHub Checks and commit comments show pass/fail per environment.
- **Artifacts:** Inspect `dbt-logs.tar.gz` from the run for detailed output.
- **History:** Update `DEPLOYMENT_HISTORY.md` with date, run URL, commit, environment, and operator.
- **Badges:** README displays CI and deployment status badges for quick visibility.

## Common Issues
- **Missing ODBC driver:** Ensure `DBT_ODBC_DRIVER` matches the installed driver; the workflow installs `unixodbc-dev` for compilation.
- **Database connectivity failures:** Verify secrets and allow-listed IPs for GitHub Actions runners.
- **SQLFluff lint noise:** Adjust rules in `.sqlfluff` or add ignores per file when needed.
