#!/bin/sh

# Run the tests.
/home/node/artillery/bin/run run $1 \
  --output "$OUTPUT" \
  ${CONFIG:+-c $CONFIG}
  ${ENVIRONMENT:+-e $ENVIRONMENT}
  ${TARGET:+-t $TARGET}
  ${INSECURE:+--insecure}
  ${QUIET:+-q}

# Write outputs for the GitHub Action.
echo "report=$OUTPUT" >> $GITHUB_OUTPUT
