#import "../assets/style.typ": *

== Slide bài giảng với Polylux

=== Giới thiệu Polylux

`polylux` (do *Andreas Kröpelin* phát triển) là gói tạo slide bài giảng
cho Typst, tương tự như `beamer` trong LaTeX nhưng đơn giản hơn nhiều.
Polylux hỗ trợ:
- Nhiều theme có sẵn
- Hiệu ứng xuất hiện dần (animations)
- Thanh tiến trình (progress bar)
- Tùy chỉnh màu sắc, font, logo

=== Cài đặt Polylux

#code-block[
```typst
#import "@preview/polylux:0.4.0": *

#show: default-theme.with(
  title-slide: true,
  outline-slide: true,
)
```
]

=== Cấu trúc slide cơ bản

Mỗi slide được tạo bằng hàm `#slide[...]`:

#code-block[
```typst
#slide[
  = Tiêu đề slide

  Nội dung chính của slide...

  - Ý thứ nhất
  - Ý thứ hai
]

#title-slide[
  = Tên bài giảng
  Tên môn học — Tuần 3
]
```
]

=== Hiệu ứng xuất hiện dần

Polylux hỗ trợ ba loại hiệu ứng chính:

1. *`#pause`* — tạm dừng. Nội dung sau `#pause` chỉ xuất hiện
   khi nhấn chuột hoặc phím mũi tên.

2. *`#only(n)[...]`* — nội dung chỉ hiển thị ở bước thứ `n`.

3. *`#uncover(from-to)[...]`* — nội dung hiển thị từ bước `from`
   đến bước `to`.

#code-block[
```typst
#slide[
  = Định nghĩa giới hạn

  Dãy số $(a_n)$ có giới hạn $L$ nếu:

  #pause

  $ forall epsilon > 0, exists N in NN: $
  $ forall n > N, |a_n - L| < epsilon $

  #pause

  Ký hiệu: $lim_(n -> infinity) a_n = L$
]
```
]

=== Theme tùy chỉnh cho Toán

Bạn có thể tùy chỉnh theme Polylux cho phù hợp với bài giảng Toán:

#code-block[
```typst
#show: default-theme.with(
  title-slide: true,
  outline-slide: true,
  base-header: align(right, text(size: 9pt)[
    Giải tích 1 — Chương Giới hạn
  ]),
  base-footer: align(center, text(size: 8pt)[
    #counter(page).display() / #counter(pages).display()
  ]),
  // Tùy chỉnh màu sắc
  base-text: rgb("#1a1a2e"),
  base-accent: rgb("#16213e"),
)
```
]

=== Ví dụ: 8 slide bài giảng "Giới hạn dãy số"

Dưới đây là dàn ý cho một bài giảng 8 slide:

| Slide | Nội dung |
|-------|----------|
| 1 | Trang tiêu đề: "Bài 2 — Giới hạn dãy số" |
| 2 | Mục lục bài học (tự động từ Polylux) |
| 3 | Nhắc lại: Định nghĩa dãy số |
| 4 | Định nghĩa giới hạn hữu hạn (có `#pause`) |
| 5 | Ví dụ 1: $lim_(n -> infinity) 1/n = 0$ |
| 6 | Ví dụ 2: $lim_(n -> infinity) frac(n, n+1) = 1$ |
| 7 | Tính chất giới hạn (tổng, hiệu, tích, thương) |
| 8 | Tổng kết + Bài tập về nhà |

=== Mẹo: Kết hợp Polylux với showybox

Bạn có thể nhúng các hộp định lý/ví dụ vào slide:

#code-block[
```typst
#slide[
  = Định lý kẹp

  #dinh-ly[
    Nếu $a_n <= b_n <= c_n$ với mọi $n$ và
    $lim a_n = lim c_n = L$, thì $lim b_n = L$.
  ]

  #pause

  #vi-du[
    $lim_(n -> infinity) frac(sin n, n) = 0$
  ]
]
```
]

=== Xuất slide ra PDF

Slide Polylux được xuất ra PDF giống như tài liệu bình thường:

#code-block[
```bash
# Xuất slide
typst compile bai-giang.typ

# Xuất với định dạng cụ thể
typst compile --format pdf bai-giang.typ
```
]

=== Bài tập thực hành (Slide)

*Bài 1.* Tạo bài giảng "Đạo hàm" gồm 6 slide:
- Slide 1: Tiêu đề
- Slide 2: Định nghĩa (có `#pause`)
- Slide 3: Quy tắc tính đạo hàm (bảng)
- Slide 4: Đạo hàm hàm hợp
- Slide 5: Bảng đạo hàm các hàm sơ cấp (dùng showybox)
- Slide 6: Bài tập về nhà

*Bài 2.* Thêm hiệu ứng `#only` và `#uncover` vào các slide trên.
Kiểm tra kết quả bằng cách mở PDF và nhấn phím mũi tên.

*Bài 3.* Thiết kế theme Polylux riêng với:
- Màu chủ đạo là màu logo trường bạn
- Header có tên môn học
- Footer có số trang và tên giảng viên

*Bài 4.* Tạo bài giảng hoàn chỉnh 10 slide về chủ đề "Tích phân xác định",
có ít nhất 2 định lý trong showybox và 3 ví dụ có lời giải.

== Tổng kết Chương 4

#ghi-nho[
  *Những điều cần nhớ:*
  - `showybox` tạo hộp định lý, ví dụ, chú ý, ghi nhớ chuyên nghiệp
  - Template phiếu bài tập cần: tiêu đề, thông tin HS, câu hỏi, ô trắng, bảng điểm
  - Đề thi có thể thiết lập layout 2 cột, mã đề, và thông tin thí sinh
  - Lời giải Toán nên theo cấu trúc: Đề → Phân tích → Giải → Kết luận
  - `pinit` giúp chú thích từng phần công thức (hữu ích khi giảng dạy)
  - `polylux` tạo slide bài giảng với hiệu ứng `#pause`, `#only`, `#uncover`
]

#pagebreak()
