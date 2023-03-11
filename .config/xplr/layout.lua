-- The default layout without SortAndFilter
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      constraints = {
        { Min = 55 },
        { Length = 40 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "Table",
            "InputAndLogs",
          },
        },
      },
      {
        Vertical = {
          config = {
            constraints = {
              { Length = 2 },
              { Length = 6 },
              { Percentage = 70 },
            },
          },
          splits = {
            "SortAndFilter",
            "Selection",
            "HelpMenu",
          },
        },
      },
    },
  },
}
