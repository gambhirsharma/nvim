return {
  s("clog", fmta([[console.log(`<>`)]], { i(1) })),
  s("cerr", fmta([[console.error(`<>`)]], { i(1) })), -- s("impf", fmta([[import {<>} from "<>"]], { i(0), i(1) })),
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
  s("trfce", fmt([[
    import React from 'react';

    interface {}Props {{
      {}
    }}

    const {}: React.FC<{}Props> = ({{ {} }}) => {{
      return (
        <div>
          <p>{}</p>
        </div>
      );
    }};

    export default {};
]], {
    rep(1),
    i(0),
    i(1, vim.fn.expand("%:t")),
    rep(1),
    i(3),
    i(2),
    rep(1)
  }))
}
