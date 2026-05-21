#import "../assets/style.typ": *

= Phụ lục B: Tổng hợp template sẵn dùng

== Template 1: Phiếu bài tập (A4, 1 cột)

#code-block[
```typst
#align(center, text(size: 16pt, weight: "bold")[PHIẾU BÀI TẬP])
#align(center)[Môn: ......................................]
#align(center)[Lớp: .............. Ngày: ...../...../.....]

#table(columns: (1fr), [Họ và tên: .................................])

#line(length: 100%)

*Phần 1: Trắc nghiệm*
// Thêm câu hỏi trắc nghiệm ở đây

*Phần 2: Tự luận*
// Thêm câu hỏi tự luận với v(3cm) giữa các câu

*Bảng điểm:*
#table(columns: (auto, auto, auto, auto), stroke: 0.5pt,
  [Câu], [1], [2], [Tổng],
  [Điểm], [], [], [],
)
```
]

== Template 2: Đề kiểm tra 1 tiết (A4, 2 cột trắc nghiệm)

#code-block[
```typst
#align(center, text(size: 15pt, weight: "bold")[ĐỀ KIỂM TRA 1 TIẾT])
#align(center)[Môn: ......... — Thời gian: 45 phút]
#align(right)[Mã đề: .....]

#table(columns: (1fr, 1fr),
  [Họ tên: .............................],
  [Lớp: ........ SBD: .................],
)

#v(0.5em)

*I. TRẮC NGHIỆM (mỗi câu 0.3 điểm)*

#columns(2)[
  *Câu 1.* ...
  *Câu 2.* ...
  ...
]

*II. TỰ LUẬN*
// Thêm câu hỏi tự luận
```
]

== Template 3: Slide bài giảng (Polylux)

#code-block[
```typst
#import "@preview/polylux:0.4.0": *

#show: default-theme.with(
  title-slide: true,
  outline-slide: true,
  base-header: align(right)[Tên môn học],
  base-footer: align(center)[#counter(page).display() / #counter(pages).display()],
)

#title-slide[
  = Tên bài giảng
  Môn học — Tuần X
]

#slide[
  = Nội dung chính

  - Mục 1
  - Mục 2
  - Mục 3
]
```
]

== Template 4: Báo cáo khóa luận

#code-block[
```typst
#set page(
  paper: "a4",
  margin: (top: 3cm, bottom: 2.5cm, left: 3.5cm, right: 2.5cm),
  header: context {
    let h = query(heading).lastOrNone()
    if h != none { set text(size: 9pt); style(h).body }
  },
  footer: context {
    set text(size: 9pt)
    counter(page).display()
  },
)

#set text(font: "STIX Two", size: 12pt, lang: "vi")

#set heading(numbering: "1.1")

#set math.equation(numbering: "(1)")

// Nội dung khóa luận...
```
]

== Template 5: Đề thi học kỳ (tự luận)

Tương tự Template 2, bổ sung:
- Trang bìa riêng (có logo trường, thông tin kỳ thi)
- Quy định thí sinh và hướng dẫn làm bài
- Phần ghi điểm cho giám khảo ở cuối mỗi trang

#ghi-nho[
  Tất cả các template trên đều là file `.typ` thuần — bạn có thể
  copy-paste và tùy chỉnh theo nhu cầu riêng.
]

#pagebreak()
