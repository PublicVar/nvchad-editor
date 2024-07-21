-- Documentation : https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#basics

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("php", {
  s(
    "doc",
    fmt(
      [[
  /**
   * {}
   */
  ]],
      {
        i(1),
      }
    )
  ),
  s(
    "doci",
    fmt(
      [[
    /** {} */
    ]],
      { i(1) }
    )
  ),
  s(
    "dataProvider",
    fmt(
      [[
    /**
     * @dataProvider provide{}
     */
    ]],
      {
        i(1, "ToTest"),
      }
    )
  ),
  s(
    "dataProviderFn",
    fmt(
      [[
    public function provide{}(): \Generator
    {{
      yield "{}" => [
        {}
      ];
    }}
    ]],
      {
        i(1, "ToTest"),
        i(2, "case description"),
        i(3),
      }
    )
  ),
  s(
    "test",
    fmt(
      [[ 
    public function test{}(): void
    {{
      {}
    }}
    ]],
      {
        i(1, "TheBehavior"),
        i(2),
      }
    )
  ),
  s(
    "testWithFixtures",
    fmt(
      [[ 
    public function test{}(): void
    {{
       $this->loadFixture("tests/Functionnal/{}/{}.yaml"); 

       {}
    }}
    ]],
      {
        i(1, "TheBehavior"),
        i(2, "Directory"),
        i(3, "fixture_file"),
        i(4),
      }
    )
  ),
})
