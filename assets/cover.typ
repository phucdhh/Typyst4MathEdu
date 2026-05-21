#set page(paper: "a4", margin: 0cm)

#let primary-color = rgb("#1a5276")
#let secondary-color = rgb("#2e86c1")

#place(
  dx: 0pt, dy: 0pt,
  rect(
    width: 100%, height: 100%,
    fill: gradient.linear(primary-color, rgb("#0d2538")),
  )
)

#align(center + horizon, text(
  fill: white,
  weight: "bold",
  size: 36pt,
  "SOẠN VĂN BẢN TOÁN BẰNG TYPYST"
))

#v(1em)

#align(center, text(
  fill: rgb("#85c1e9"),
  size: 18pt,
  "Hướng dẫn thực hành"
))

#v(0.5em)

#line(length: 40%, stroke: 1pt + rgb("#85c1e9"))

#v(0.5em)

#align(center, text(
  fill: rgb("#aed6f1"),
  size: 12pt,
  "Soạn thảo công thức, trình bày bài toán\nvà xuất bản tài liệu Toán chuyên nghiệp với Typst"
))

#v(4em)

#align(center, text(
  fill: rgb("#85c1e9"),
  size: 13pt,
  "Nguyễn Đăng Minh Phúc"
))

#v(0.5em)

#align(center, text(
  fill: rgb("#aed6f1"),
  size: 10pt,
  "Phiên bản 05.2026"
))
