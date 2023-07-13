#!/bin/sh

# Run the tests.
/home/node/artillery/bin/run "./artillery.report.yml" $1

# Write outputs for the GitHub Action.
echo "report=$OUTPUT" >> $GITHUB_OUTPUT
