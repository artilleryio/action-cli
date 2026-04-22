<p align="center">
  <img src="./github-action-icon.svg" alt="GitHub Actions icon" width="80">
</p>
<h1 align="center">Artillery GitHub Action</h1>

<p align="center">
Official GitHub Action for running load tests with <a href="https://artillery.io/">Artillery</a>.
</p>

## Versioning

Starting with `v2.0.30`, this action's version tracks the version of the
[Artillery CLI](https://www.artillery.io/docs) it wraps. For example,
`artilleryio/action-cli@v2.0.30` runs Artillery `2.0.30`.

Supported tag forms:

- `@v2.0.30` — pinned to an exact Artillery version (recommended for reproducible runs).
- `@v2` — latest release for Artillery 2.x.

## Prebuilt image

The action runs a prebuilt Docker image published to GitHub Container Registry
at [`ghcr.io/artilleryio/action-cli`](https://github.com/artilleryio/action-cli/pkgs/container/action-cli).
This avoids rebuilding the image (including Playwright + Chromium) on every
job run, so consumers see much faster startup times. Only `linux/amd64` is
published.

## Inputs

### `command`

The Artillery CLI command to run. You can use all the available commands:

- [`run`](https://www.artillery.io/docs/reference/cli/run)
- [`run-fargate`](https://www.artillery.io/docs/reference/cli/run-fargate)
- [`run-lambda`](https://www.artillery.io/docs/reference/cli/run-lambda)

```yml
- name: Load tests
  uses: artilleryio/action-cli@v1
  with:
    command: run ./preprod.yml
```

> Learn more about [Writing test scripts with Artillery](https://www.artillery.io/docs/get-started/first-test).

### `working-directory`

- _Optional_

Path to a directory to use as the current working directory when running Artillery commands.

```yml
- name: Load tests
  uses: artilleryio/action-cli@v1
  with:
    command: run ./test.yml
    working-directory: ./packages/app/load-tests
```

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

## Bugs / Questions

Talk to us in the main [`artilleryio/artillery`](https://github.com/artilleryio/artillery) repo

- [Issues](https://github.com/artilleryio/artillery/issues)
- [Discussions](https://github.com/artilleryio/artillery/discussions/categories/artillery)
