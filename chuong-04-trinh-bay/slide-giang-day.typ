#import "../assets/style.typ": *
== Slide bài giảng với Polylux

=== Cài đặt Polylux

#code-block[
```typst
#import "@preview/polylux:0.4.0": *

// Theme mặc định
#show: default-theme.with(
  title-slide: true,
  outline-slide: true,
)
```
]

=== Cú pháp slide cơ bản

#code-block[
```typst
#slide[
  = Tiêu đề slide

  Nội dung slide...
]

#title-slide[
  = Bài 1: Giới hạn dãy số
  Giải tích 1 — Tuần 3
]
```
]

=== Hiệu ứng xuất hiện dần

#code-block[
```typst
#slide[
  = Định nghĩa giới hạn

  Dãy số $(a_n)$ có giới hạn $L$ nếu:

  #pause

  $ forall epsilon > 0, exists N in NN: forall n > N, |a_n - L| < epsilon $

  #pause

  Ký hiệu: $lim_(n -> infinity) a_n = L$
]
```
]

=== Các lệnh hiệu ứng khác

#code-block[
```typst
// Chỉ hiện ở bước 2
#only(2)[Nội dung này chỉ xuất hiện ở bước 2]

// Hiện từ bước 2 trở đi
#uncover(2-)[Nội dung này hiện từ bước 2]

// Ẩn từ bước 3
#uncover(1-2)[Nội dung này ẩn từ bước 3]
```
]

=== Theme tùy chỉnh cho Toán

#code-block[
```typst
#show: default-theme.with(
  title-slide: true,
  outline-slide: true,
  base-header: align(right)[Giải tích 1],
  base-footer: align(center)[
    #counter(page).display() / #counter(pages).display()
  ],
)
```
]

=== Ví dụ: Slide bài giảng "Giới hạn dãy số"

Dưới đây là cấu trúc 8 slide:

*Slide 1:* Trang tiêu đề — "Bài 1: Giới hạn dãy số"
*Slide 2:* Mục lục bài học
*Slide 3:* Định nghĩa dãy số
*Slide 4:* Định nghĩa giới hạn hữu hạn (định nghĩa epsilon)
*Slide 5:* Ví dụ: $lim 1/n = 0$
*Slide 6:* Tính chất của giới hạn
*Slide 7:* Giới hạn vô cực
*Slide 8:* Tổng kết và bài tập

#code-block[
```typst
// Slide 4: Định nghĩa
#slide[
  = Định nghĩa giới hạn

  Dãy số $(a_n)$ được gọi là *có giới hạn* $L$ khi
  $n -> infinity$ nếu:

  $ forall epsilon > 0, exists N in NN: $
  $ forall n > N, |a_n - L| < epsilon $

  Ký hiệu: $lim_(n -> infinity) a_n = L$
]
```
]

Xuất slide thành PDF:

#code-block[
```bash
typst compile slide.typ
# hoặc
typst compile --format pdf slide.typ
```
]

=== Bài tập thực hành

*Bài 1.* Tạo slide bài giảng "Đạo hàm" gồm 6 slide: tiêu đề, định nghĩa, quy tắc tính,
đạo hàm hàm hợp, bảng đạo hàm, bài tập.

*Bài 2.* Thêm hiệu ứng xuất hiện dần cho công thức đạo hàm.

*Bài 3.* Thiết kế theme slide riêng với màu xanh chủ đạo, logo trường ở góc.

*Bài 4.* Tạo 8 slide bài giảng "Tích phân" hoàn chỉnh, xuất ra PDF.

#pagebreak()
