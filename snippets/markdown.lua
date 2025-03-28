return {
  s("todo", t("- [ ] ")),
  s("sub", fmt([[<sub>{}</sub>]], { i(1) })),
  s("sup", fmt([[<sup>{}</sup>]], { i(1) })),
  s("sqr", fmta([[\sqrt{<>}]], { i(1) })),
  s("bash", fmta([[```bash 
<>
```]], { i(1) })),
  s("html", fmta([[```html
<>
```]], {i(1)})),
    s("details", fmt([[<details>
    <summary>{}</summary>
    {}
</details>]], {i(1), i(0)}))

}
