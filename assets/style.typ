#import "@preview/showybox:2.0.4": showybox

#let primary-color = rgb("#1a5276")
#let secondary-color = rgb("#2e86c1")
#let accent-color = rgb("#e67e22")
#let success-color = rgb("#27ae60")
#let warning-color = rgb("#c0392b")
#let note-color = rgb("#7f8c8d")

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    let heading = query(heading).lastOrNone()
    if heading != none {
      set text(size: 8pt, fill: note-color)
      box(hstack(primary-color => "Typst cho Toán học", h(1fr), style(heading).body))
    }
  },
  footer: context {
    set text(size: 8pt, fill: note-color)
    box(hstack(center, counter(page).display()))
  },
  numbering: "1",
  binding: left,
)

#set text(font: "New Computer Modern", size: 11pt, lang: "vi")

#set heading(numbering: "1.1")
#show heading.where(level: 1): it => {
  set text(size: 18pt, weight: "bold", fill: primary-color)
  v(1.5em)
  it
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + primary-color)
  v(0.5em)
}
#show heading.where(level: 2): it => {
  set text(size: 14pt, weight: "bold", fill: secondary-color)
  v(1em)
  it
  v(0.3em)
}
#show heading.where(level: 3): it => {
  set text(size: 12pt, weight: "bold", fill: primary-color)
  v(0.5em)
  it
}
#show heading.where(level: 4): it => {
  set text(size: 11pt, weight: "bold", fill: secondary-color)
  it
}

#set par(justify: true, leading: 0.65em)
#set math.equation(numbering: "(1)")

#let dinh-ly(body) = {
  showybox(
    title: "Định lý",
    body: body,
    frame: (stroke: 1.5pt + primary-color),
    header: (fill: primary-color, text-weight: "bold"),
    margin: 0.5em,
  )
}

#let vi-du(body) = {
  showybox(
    title: "Ví dụ",
    body: body,
    frame: (stroke: 1.5pt + accent-color),
    header: (fill: accent-color, text-weight: "bold"),
    margin: 0.5em,
  )
}

#let chu-y(body) = {
  showybox(
    title: "Chú ý",
    body: body,
    frame: (stroke: 1.5pt + warning-color),
    header: (fill: warning-color, text-weight: "bold"),
    margin: 0.5em,
  )
}

#let ghi-nho(body) = {
  showybox(
    title: "Ghi nhớ",
    body: body,
    frame: (stroke: 1.5pt + note-color),
    header: (fill: note-color, text-weight: "bold"),
    margin: 0.5em,
  )
}

#let bai-tap(body) = {
  showybox(
    title: "Bài tập",
    body: body,
    frame: (stroke: 1.5pt + success-color),
    header: (fill: success-color, text-weight: "bold"),
    margin: 0.5em,
  )
}

#let code-block(body) = block(
  inset: 8pt,
  fill: rgb("#f4f6f7"),
  stroke: 0.5pt + rgb("#d5dbdb"),
  radius: 4pt,
  width: 100%,
)[
  #set text(font: "Courier New", size: 9pt)
  #body
]

#let loi-giai(body) = {
  v(0.3em)
  strong(text: "Lời giải. ")
  body
}

#show link: it => text(fill: secondary-color, it)

#let figure-caption(body) = {
  set text(size: 9pt, fill: note-color)
  body
}
