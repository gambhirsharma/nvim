return { s(
  "css",
  fmta(
    [[
 html{
  --zoom: 120;
  --black: #000;
  --white: #fff;
  --red: #d34747;
  --green: #1c6f1c;
  --blue: #2a2aaa;
  --yellow: yellow;
  --grey: grey;
  --violet: violet;
  --purple: purple;
  --pink: pink;
  --bg: #202020;
 }
 :root{
   --unit: 1vmin;
   --available-screen-min: 665;
   --px: calc(var(--zoom) * (var(--unit) / var(--available-screen-min)));
 }
 *{
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 16px;
 }
 *::after, *::before {
  content: '';
  display: block;
  position: relative;
 }
 head::before,
 head::after,
 body::before,
 body::after,
 html::before,
 html::after {
  content: '';
  position: absolute;
  background-repeat: no-repeat;

  filter: blur(0);
 }
 body{
  all: unset;
  background-color: var(--bg);
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
 } ]],
    {}
  )
),

  s("px", fmta([[ calc(<> *var(--px));]], { i(1) })),
  s("bgred", t("background: red;")),
  s(
    "flexCenter",
    fmta(
      [[
    display: flex;
    align-items: center;
    justify-content: center;
  ]],
      {}
    )
  ),
}
