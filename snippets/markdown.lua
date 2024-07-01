return {
  s("todo", t("- [ ] ")),
  s("sub", fmt([[<sub>{}</sub>]], { i(1) })),
  s("sup", fmt([[<sup>{}</sup>]], { i(1) })),
  s("sqr", fmta([[\sqrt{<>}]], { i(1) })),

}
