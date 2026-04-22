FROM artilleryio/artillery:2.0.30
ENV PLAYWRIGHT_BROWSERS_PATH=/opt/playwright
RUN npx playwright@1.58.1 install --with-deps chromium
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
