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

A path to the test script to run.

```yml
- name: Load tests
  uses: artilleryio/action-cli@v1
  with:
    command: run ./preprod.yml
```

> Learn more about [Writing test scripts with Artillery](https://www.artillery.io/docs/get-started/first-test).

## Examples

> Make the most out of your CI/CD pipelines by reading the [Best practices](https://www.artillery.io/docs/get-started/best-practices) of load testing with Artillery.

### Load testing before deployment

In this example, we will configure GitHub Actions to run load tests before deploying changes to a pre-production environment.

```yml
name: pre-prod-deploy

on:
  push:
    branches: [main]

jobs:
  load-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Load tests
        uses: artilleryio/action-cli@v1
        id: loadtest
        with:
          # Run the test scripts against the staging environment
          # as a quality assurance before promoting it to preprod.
          command: run ./load-tests/pre-prod.yml --target https://staging.example.com

      - name: Deploy
        # Require the "loadtest" step to pass
        # before proceeding with the deployment.
        needs: [loadtest]
        run: ./deploy.sh
```

### Scheduled load test

You can take advantage of of [scheduled workflows](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#schedule) to run load tests periodically.

Below, we are configuring a scheduled load test of the production environment:

```yml
name: prod-load-test

on:
  schedule:
    # Run this workflow every midnight.
    - cron: "0 0 * * * "

jobs:
  load-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Load tests
        uses: artilleryio/action-cli@v1
        with:
          command: run ./prod.yml --output report.json

      - name: Upload test report
        uses: actions/upload-artifact@v2
        # Upload the test report even if the tests fail.
        if: always()
        with:
          name: artillery-test-report
          path: ./report.json
```
