# The version of the Artillery CLI this action wraps.
# This value MUST match the action's release tag (without the leading "v").
# It is enforced by the `version-consistency` CI check.
ARG ARTILLERY_VERSION=2.0.30

# The version of Playwright installed into the image (for browser-based tests).
# Keep in sync with the Playwright peer dependency of the pinned Artillery version.
ARG PLAYWRIGHT_VERSION=1.58.1

FROM artilleryio/artillery:${ARTILLERY_VERSION}

# Re-declare ARG after FROM so it is available in the build stage.
ARG PLAYWRIGHT_VERSION

LABEL org.opencontainers.image.source="https://github.com/artilleryio/action-cli"
LABEL org.opencontainers.image.description="Official GitHub Action for running load tests with Artillery."
LABEL org.opencontainers.image.licenses="MPL-2.0"

ENV PLAYWRIGHT_BROWSERS_PATH=/opt/playwright
RUN npx playwright@${PLAYWRIGHT_VERSION} install --with-deps chromium

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
