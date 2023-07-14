<p align="center">
  <img src="./github-action-icon.svg" alt="GitHub Actions icon" width="80">
</p>
<h1 align="center">Artillery GitHub Action</h1>

<p align="center">
Official GitHub Action for running load tests with <a href="https://artillery.io/">Artillery</a>.
</p>

## Inputs

### `command`

The Artillery CLI command to run. You can use all the available commands:

- [`run`](https://www.artillery.io/docs/reference/cli/run)
- [`run:fargate`](https://www.artillery.io/docs/reference/cli/run-fargate)
- `run:lambda`

```yml
- name: Load tests
  uses: artilleryio/action-cli@v1
  with:
    command: run ./preprod.yml
```

> Learn more about [Writing test scripts with Artillery](https://www.artillery.io/docs/get-started/first-test).

## Outputs

This action does not set any outputs.

You can generate and access the test run report using the CLI directly:

```yml
- name: Load tests
  uses: artilleryio/action-cli@v1
  with:
    # Save the test run report at "./report.json"
    command: run ./prod.yml --output ./report.json

- name: Upload artifact
  uses: actions/upload-artifact@v3
  if: always()
  with:
    name: artillery-report
    # Reference the generated report in the file system.
    path: ./report.json
```

## Usage examples

Learn more about [Running Artillery on GitHub Actions](https://www.artillery.io/docs/cicd/github-actions).
