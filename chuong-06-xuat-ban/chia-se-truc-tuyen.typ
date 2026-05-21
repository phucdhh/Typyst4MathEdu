#import "../assets/style.typ": *
== Chia sẻ và xuất bản template (tiếp)

=== Publish lên Typst App

Sau khi đăng nhập typst.app, bạn có thể:

1. Tạo dự án mới và import template
2. Chia sẻ link dự án cho đồng nghiệp
3. Clone template từ Universe vào dự án của bạn

=== Ví dụ: Template đề thi hoàn chỉnh

#code-block[
```typst
// lib.typ — Template đề thi
#let de-thi(
  tieu-de: "ĐỀ KIỂM TRA",
  mon: "Toán",
  thoi-gian: "45 phút",
  ma-de: none,
  noi-dung
) = {
  show: block.with(width: 100%)

  #align(center, text(size: 16pt, weight: "bold")[#tieu-de])
  #align(center)[Môn: #mon — Thời gian: #thoi-gian]

  #if ma-de != none [
    #align(right)[Mã đề: #ma-de]
  ]

  #v(0.5em)
  #line(length: 100%)

  #noi-dung
}
```
]

Sử dụng:

#code-block[
```typst
#import "lib.typ": de-thi

#de-thi(
  tieu-de: "KIỂM TRA GIỮA KỲ",
  mon: "Giải tích 1",
  thoi-gian: "60 phút",
  ma-de: "201",
)[
  *Câu 1.* Tính $integral_0^1 x e^x dif x$.
]
```
]
