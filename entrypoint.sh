#!/bin/sh

# Respect custom "working-directory" input.
if [ -z "${CWD}" ]; then
  cd "${CWD}"
fi

# Run the tests.
/home/node/artillery/bin/run $1
