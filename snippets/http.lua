return {
  s("get", fmta([[
  GET <> HTTP/1.0
  accept: application/json
    ]],
    { i(1) }
  )),
  s('post', fmta([[
  POST <>
  accept: application/json
  content-type: application/json
 ]], { i(1) })),

}
