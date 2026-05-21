#import "../assets/style.typ": *
= Chương 4: Trình bày tài liệu

== Show-boxes và môi trường nội dung

=== Gói showybox

Như đã giới thiệu ở Chương 1, `showybox` là gói tạo hộp nội dung chuyên nghiệp.

#code-block[
```typst
#import "@preview/showybox:2.0.4": showybox
```
]

Typst hỗ trợ tạo các môi trường định lý, ví dụ, chú ý, ghi nhớ một cách linh hoạt.
Trong sách này, chúng ta đã định nghĩa các hàm trong `assets/style.typ`:

#code-block[
```typst
#let dinh-ly(body) = {
  showybox(
    title: "Định lý",
    body: body,
    frame: (stroke: 1.5pt + primary-color),
    header: (fill: primary-color, text-weight: "bold"),
  )
}
```
]

Và sử dụng:

#dinh-ly[
  Nếu $f$ liên tục trên $[a, b]$ và $F$ là một nguyên hàm của $f$ trên đoạn này, thì

  $ integral_a^b f(x) dif x = F(b) - F(a) $
]

=== Tùy chỉnh màu sắc

Có thể tùy chỉnh màu sắc, kiểu viền, shadow cho từng loại hộp:

| Loại hộp | Màu viền | Mục đích |
|----------|----------|----------|
| Định lý | Xanh đậm | Lý thuyết quan trọng |
| Ví dụ | Cam | Minh họa |
| Chú ý | Đỏ | Cảnh báo |
| Ghi nhớ | Xám | Tổng kết |
| Bài tập | Xanh lá | Thực hành |

=== Ví dụ sử dụng các hộp

#vi-du[
  Tính $integral_0^1 x^2 dif x$.

  *Giải:* $integral_0^1 x^2 dif x = [frac(x^3, 3)]_0^1 = frac(1, 3)$.
]

#chu-y[
  Công thức $integral f(x) dif x$ là tập hợp tất cả các nguyên hàm của $f$.
  Đừng quên hằng số $C$ trong nguyên hàm bất định!
]

#ghi-nho[
  Tích phân xác định $integral_a^b f(x) dif x$ là một số,
  còn tích phân bất định $integral f(x) dif x$ là một họ hàm số.
]

== Template bài tập tự luyện

=== Thiết kế layout bài tập

Một phiếu bài tập thường có:
- Tiêu đề (môn học, chủ đề)
- Phần thông tin học sinh (họ tên, lớp, ngày)
- Các câu hỏi đánh số tự động
- Ô chừa chỗ trả lời
- Bảng điểm

#code-block[
```typst
#align(center, text(size: 16pt, weight: "bold")[
  PHIẾU BÀI TẬP
])
#align(center)[
  Môn: Giải tích — Chủ đề: Giới hạn
]

#table(
  columns: (1fr, 1fr),
  [Họ và tên: .........................],
  [Lớp: ............. Ngày: ...........],
)
```
]

=== Đánh số câu hỏi tự động

#code-block[
```typst
#let cau-hoi(numbering: "1)", body) = {
  let so = counter("bt").step()
  [*Câu #counter("bt").display():* #body]
}
```
]

=== Ví dụ hoàn chỉnh: Phiếu bài tập Giới hạn

#align(center, text(size: 15pt, weight: "bold")[PHIẾU BÀI TẬP — GIỚI HẠN HÀM SỐ])

#table(columns: (1fr, 1fr), [Họ tên: .........................], [Lớp: ...... Ngày: ......])

#v(0.5em)

*Phần 1: Trắc nghiệm (5 câu)*

1. $lim_(x -> 0) (sin x)/x$ bằng:
   A. $0$ B. $1$ C. $infinity$ D. Không tồn tại

2. $lim_(x -> infinity) (1 + 1/x)^x$ bằng:
   A. $1$ B. $e$ C. $infinity$ D. $0$

3. $lim_(x -> 2) (x^2 - 4)/(x - 2)$ bằng:
   A. $0$ B. $2$ C. $4$ D. Không xác định

4. $lim_(x -> 0) (e^x - 1)/x$ bằng:
   A. $0$ B. $1$ C. $e$ D. $infinity$

5. $lim_(x -> 0^+) 1/x$ bằng:
   A. $0$ B. $1$ C. $+infinity$ D. $-infinity$

*Phần 2: Tự luận (3 câu)*

*Câu 6.* Tính $lim_(x -> 1) (x^3 - 1)/(x^2 - 1)$.

#v(3cm)

*Câu 7.* Tính $lim_(x -> 0) (sqrt(x + 1) - 1)/x$.

#v(3cm)

*Câu 8.* Tìm $a$ để $lim_(x -> 2) (x^2 + a x - 6)/(x - 2)$ tồn tại hữu hạn.

#v(3cm)

*Bảng điểm:*

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  stroke: 0.5pt,
  [Câu], [1], [2], [3], [4], [5], [6], [7],
  [Điểm], [], [], [], [], [], [], [],
)
