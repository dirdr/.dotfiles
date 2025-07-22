return {
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    -- opts = {}
  },
}
