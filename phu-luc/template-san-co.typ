#import "../assets/style.typ": *
= Phụ lục B: Tổng hợp template sẵn dùng

== Template 1: Phiếu bài tập

#code-block[
```typst
#align(center, text(size: 16pt, weight: "bold"))[PHIẾU BÀI TẬP]
#align(center)[Môn: ................. — Lớp: ...............]

#table(columns: (1fr, 1fr),
  [Họ tên: .........................],
  [Ngày: ....../....../......],
)

#line(length: 100%)

*Phần 1: Trắc nghiệm*
// Thêm câu hỏi trắc nghiệm ở đây

*Phần 2: Tự luận*
// Thêm câu hỏi tự luận ở đây

*Bảng điểm:*
#table(columns: (auto, auto, auto), stroke: 0.5pt,
  [Câu], [1], [2], [Điểm tổng],
  [Điểm], [], [], [],
)
```
]

== Template 2: Đề kiểm tra 1 tiết

#code-block[
```typst
#align(center, text(size: 15pt, weight: "bold"))[ĐỀ KIỂM TRA 1 TIẾT]
#align(center)[Môn: #mon — Thời gian: #thoi-gian phút]
#align(right)[Mã đề: #ma-de]

#v(0.3em)

#table(columns: (1fr, 1fr),
  [Họ tên: .........................],
  [Lớp: ............. SBD: .........],
)

#line(length: 100%)

*I. TRẮC NGHIỆM (#so-cau-tn câu, mỗi câu #diem-tn điểm)*

#columns(2)[
  // Nội dung trắc nghiệm
]

*II. TỰ LUẬN (#so-cau-tl câu, mỗi câu #diem-tl điểm)*

// Nội dung tự luận
```
]

== Template 3: Đề thi học kỳ

Tương tự Template 2 nhưng thêm:
- Trang bìa riêng
- Quy định thí sinh
- Chữ ký giám thị

== Template 4: Slide bài giảng

#code-block[
```typst
#import "@preview/polylux:0.4.0": *

#show: default-theme.with(
  title-slide: true,
  outline-slide: true,
  base-header: align(right)[Tên môn học],
  base-footer: align(center)[
    #counter(page).display() / #counter(pages).display()
  ],
)

#title-slide[
  = Tên bài giảng
  Tên môn học
]

#slide[
  = Mục lục
  // Nội dung
]

#slide[
  = Nội dung bài học
  // Nội dung
]
```
]

== Template 5: Báo cáo khóa luận / luận văn

Cấu trúc trang:

#code-block[
```typst
#set page(
  paper: "a4",
  margin: (top: 3cm, bottom: 2.5cm, left: 3.5cm, right: 2.5cm),
  header: context {
    let heading = query(heading).lastOrNone()
    if heading != none {
      set text(size: 9pt)
      style(heading).body
    }
  },
  footer: context {
    set text(size: 9pt)
    counter(page).display()
  },
)
```
]

== Bài tập thực hành

*Bài 1.* Tải Template 1 về và điền nội dung bài tập Giới hạn hàm số (5 câu trắc nghiệm + 2 câu tự luận).

*Bài 2.* Dùng Template 2 tạo đề kiểm tra 1 tiết môn Đại số lớp 10.

*Bài 3.* Tạo slide bài giảng 10 slide về chủ đề "Hàm số bậc hai" dùng Template 4.
