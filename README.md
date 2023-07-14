<p align="center">
  <img src="./github-action-icon.svg" alt="GitHub Actions icon" width="80">
</p>
<h1 align="center">Artillery GitHub Action</h1>

<p align="center">
Official GitHub Action for running load tests with <a href="https://artillery.io/">Artillery</a>.
</p>

## Inputs

The `artilleryio/action-run` action supports a subset of the [`run` command options](https://www.artillery.io/docs/reference/cli/run#options) of our CLI.

### `command`

The Artillery CLI command to run.

```yml
- name: Load tests
  uses: artilleryio/action-cli@v1
  with:
    command: run ./preprod.yml
```

> Learn more about [Writing test scripts with Artillery](https://www.artillery.io/docs/get-started/first-test).

## Usage examples

Learn more about [Running Artillery on GitHub Actions](https://www.artillery.io/docs/cicd/github-actions).
