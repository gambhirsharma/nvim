return {
  s("clog", fmta([[console.log(`<>`)]], { i(1) })),
  s("cerr", fmta([[console.error(`<>`)]], { i(1) })),
  -- s("impf", fmta([[import {<>} from "<>"]], { i(0), i(1) })),
  s("impf", fmta([[import {<>} from "<>"]], { i(0), i(1) })),
  s(
    "cfun",
    fmt(
      [[const {} = ({}) => {{
    {}
    }}]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    "cafun",
    fmt(
      [[const {} = ({}) => {{
    {}
    }}]],
      { i(1), i(2), i(0) }
    )
  ),
  
  s("impfd", fmta([[import <> from "<>"]], { i(0), i(1) })),
}
