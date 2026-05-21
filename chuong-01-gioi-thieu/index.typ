#import "../assets/style.typ": *

#set heading(numbering: "1.1")
#show heading.where(level: 1): it => {
  set text(size: 18pt, weight: "bold", fill: rgb("#1a5276"))
  v(1.5em)
  it
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + rgb("#1a5276"))
  v(0.5em)
}

#include "cai-dat.typ"
#include "hello-toan.typ"
