export const config = {
  target: "https://www.artillery.io",
  phases: [
    {
      arrivalRate: 1,
      duration: 10,
    },
  ],
  engines: {
    playwright: {},
  },
};

export const scenarios = [
  {
    engine: "playwright",
    name: "check_out_core_concepts_scenario",
    testFunction: async function checkOutArtilleryCoreConceptsFlow(
      page,
      _userContext,
      events,
      test,
    ) {
      await test.step("Go to Artillery", async () => {
        const requestPromise = page.waitForRequest("https://artillery.io/");
        await page.goto("https://artillery.io/");
        const _req = await requestPromise;
      });

      await test.step("Go to docs", async () => {
        await page.getByRole("link", { name: "Docs" }).first().click();
        await page.waitForURL("https://www.artillery.io/docs");
      });

      await test.step("Go to core concepts", async () => {
        await page
          .getByRole("link", {
            name: "Start a new GitHub Discussion",
          })
          .click();

        await page.waitForURL(
          "https://github.com/artilleryio/artillery/discussions",
        );
      });
    },
  },
];
