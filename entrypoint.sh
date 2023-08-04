#!/bin/sh

# Respect custom "working-directory" input.
if [ -n "${CWD}" ]; then
  cd "${CWD}"
fi

# Run the tests.
/home/node/artillery/bin/run $1
