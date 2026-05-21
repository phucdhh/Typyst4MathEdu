#import "../assets/style.typ": *

= Chương 4: Trình bày tài liệu Toán chuyên nghiệp

Ba chương đầu đã trang bị cho bạn đầy đủ công cụ để viết công thức Toán học.
Chương này bước sang một giai đoạn khác: làm thế nào để *trình bày* những nội dung
đó đẹp, chuyên nghiệp và đúng chuẩn của các tài liệu giảng dạy — từ phiếu bài tập,
đề thi, đến slide bài giảng.

#ghi-nho[
  *Mục tiêu chương:* Tạo được đề thi, bài tập, lời giải và slide bài giảng
  đạt chuẩn chuyên nghiệp. Làm chủ các gói `showybox`, `pinit`, và `polylux`.
]

== Show-boxes và Môi trường nội dung Toán học

=== Tại sao cần hộp nội dung?

Mở bất kỳ cuốn sách giáo khoa Toán nào, bạn sẽ thấy ngay các khung màu sắc
đặc trưng: *Định lý* (khung xanh), *Ví dụ* (khung cam), *Chú ý* (khung đỏ),
*Bài tập* (khung xanh lá). Những hộp này không chỉ làm đẹp tài liệu mà còn
giúp người đọc nhận diện loại nội dung và nắm bắt cấu trúc tài liệu nhanh hơn.

Trong cuốn sách này, chúng tôi dùng gói `showybox` từ Typst Universe
để tạo các hộp đó. Phần này sẽ cho bạn thấy cách dùng từng loại hộp.

=== Cài đặt showybox

#code-block[
```typst
// Thêm vào đầu file .typ
#import "@preview/showybox:2.0.4": showybox
```
]

=== Các loại hộp có sẵn trong sách này

Cuốn sách này đã định nghĩa sẵn bốn loại hộp thường dùng nhất.
Mỗi hộp có màu sắc và biểu tượng riêng:

#code-preview(
  ```typst
#dinh-ly[
  *Định lý Pythagoras.* Trong tam giác vuông tại $C$:
  $ a^2 + b^2 = c^2 $
]

#vi-du[
  Tính diện tích tam giác vuông với hai cạnh góc vuông
  bằng 3 cm và 4 cm.
]

#chu-y[
  Đừng nhầm cạnh huyền với cạnh góc vuông!
]

#ghi-nho[
  Công thức $a^2 + b^2 = c^2$ chỉ áp dụng cho *tam giác vuông*.
]
  ```,
  [
    #dinh-ly[
      *Định lý Pythagoras.* Trong tam giác vuông tại $C$:
      $ a^2 + b^2 = c^2 $
    ]
    #v(0.5em)
    #vi-du[
      Tính diện tích tam giác vuông với hai cạnh góc vuông bằng 3 và 4 cm.
    ]
    #v(0.5em)
    #chu-y[
      Đừng nhầm cạnh huyền với cạnh góc vuông!
    ]
    #v(0.5em)
    #ghi-nho[
      Công thức $a^2 + b^2 = c^2$ chỉ áp dụng cho *tam giác vuông*.
    ]
  ]
)

=== Tự tạo hộp tùy chỉnh với showybox

Ngoài bốn loại hộp định sẵn, bạn có thể tạo hộp tùy chỉnh với bất kỳ
màu sắc và tiêu đề nào:

#code-block[
```typst
#import "@preview/showybox:2.0.4": showybox

#showybox(
  title: "Bài toán thách thức",
  frame: (stroke: 1.5pt + purple),
  header: (fill: purple),
)[
  Cho tam giác $A B C$. Chứng minh rằng tổng ba góc
  của bất kỳ tam giác nào cũng bằng $180°$.
]
```
]

=== Ví dụ thực tế: Trình bày định lý với chứng minh

#dinh-ly[
  *Định lý giá trị trung bình (Mean Value Theorem).*
  Nếu $f$ liên tục trên $[a, b]$ và khả vi trên $(a, b)$,
  thì tồn tại $c in (a, b)$ sao cho:

  $ f'(c) = frac(f(b) - f(a), b - a) $
]

#vi-du[
  Cho $f(x) = x^2$ trên $[0, 2]$. Tìm $c$ thỏa mãn điều kiện
  của định lý giá trị trung bình.

  *Giải.* Ta có $f'(c) = 2c$ và
  $frac(f(2) - f(0), 2 - 0) = frac(4 - 0, 2) = 2$.

  Giải phương trình $2c = 2$, ta được $c = 1 in (0, 2)$. ✓
]

#ghi-nho[
  Quy tắc *LIATE* để chọn $u$ trong tích phân từng phần:
  - *L* — Logarithm: $ln x$, $log_a x$
  - *I* — Inverse trig: $arcsin x$, $arctan x$
  - *A* — Algebraic (đa thức): $x^n$, $x^2 + 1$
  - *T* — Trigonometric: $sin x$, $cos x$
  - *E* — Exponential: $e^x$, $2^x$
]

=== Bảng tổng kết các loại hộp

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  table.header([*Loại hộp*], [*Màu viền*], [*Mục đích*]),
  [Định lý], [Xanh đậm], [Phát biểu quan trọng],
  [Ví dụ], [Cam], [Minh họa cách làm],
  [Chú ý], [Đỏ], [Cảnh báo sai lầm],
  [Ghi nhớ], [Xám], [Tổng kết kiến thức],
  [Bài tập], [Xanh lá], [Thực hành],
)

=== Tùy chỉnh màu sắc và kiểu dáng

Bạn có thể tùy chỉnh toàn bộ giao diện của hộp:

#code-block[
```typst
#let dinh-ly-rieng(body) = {
  showybox(
    title: "Định lý",
    body: body,
    frame: (stroke: 2pt + rgb("#8e44ad")),  // viền tím
    header: (
      fill: rgb("#8e44ad"),
      text-weight: "bold",
      text-fill: white,
    ),
    radius: 6pt,     // bo góc
    shadow: true,    // đổ bóng
  )
}
```
]

== Template bài tập tự luyện

=== Thiết kế phiếu bài tập

Một phiếu bài tập chuyên nghiệp cần các thành phần sau:

1. *Đầu trang (Header)*: tiêu đề, môn học, chủ đề
2. *Thông tin học sinh*: họ tên, lớp, ngày
3. *Phần câu hỏi*: đánh số tự động, phân loại (trắc nghiệm / tự luận)
4. *Ô chừa chỗ trả lời*: khoảng trắng giữa các câu
5. *Bảng điểm*: rubric chấm điểm

=== Ví dụ hoàn chỉnh: Phiếu bài tập Giới hạn

Dưới đây là một phiếu bài tập mẫu, được soạn hoàn chỉnh bằng Typst:

#align(center, text(size: 15pt, weight: "bold")[PHIẾU BÀI TẬP])
#align(center)[Môn: Giải tích — Chủ đề: Giới hạn hàm số]

#v(0.3em)

#table(columns: (1fr, 1fr),
  [Họ và tên: .............................................],
  [Lớp: ................. Ngày: ....../....../......],
)

#v(0.5em)

*Phần 1: Trắc nghiệm (6 câu — 3 điểm)*

+ Câu 1. $lim_(x -> 0) (sin x)/x$ bằng:
  A. $0$ \ B. $1$ \ C. $infinity$ \ D. Không tồn tại

+ Câu 2. $lim_(x -> infinity) (1 + 1/x)^x$ bằng:
  A. $1$ \ B. $e$ \ C. $infinity$ \ D. $0$

+ Câu 3. $lim_(x -> 2) (x^2 - 4)/(x - 2)$ bằng:
  A. $0$ \ B. $2$ \ C. $4$ \ D. Không xác định

+ Câu 4. $lim_(x -> 0) (e^x - 1)/x$ bằng:
  A. $0$ \ B. $1$ \ C. $e$ \ D. $infinity$

+ Câu 5. $lim_(x -> 0^+) 1/x$ bằng:
  A. $0$ \ B. $1$ \ C. $+infinity$ \ D. $-infinity$

+ Câu 6. $lim_(x -> 0) frac(tan x, x)$ bằng:
  A. $0$ \ B. $1$ \ C. $infinity$ \ D. Không tồn tại

*Phần 2: Tự luận (4 câu — 7 điểm)*

+ Câu 7 (2 điểm). Tính $lim_(x -> 1) (x^3 - 1)/(x^2 - 1)$.

#v(3cm)

+ Câu 8 (2 điểm). Tính $lim_(x -> 0) (sqrt(x + 1) - 1)/x$.

#v(3cm)

+ Câu 9 (1.5 điểm). Tìm $a$ để $lim_(x -> 2) (x^2 + a x - 6)/(x - 2)$
tồn tại hữu hạn. Tính giới hạn đó.

#v(3cm)

+ Câu 10 (1.5 điểm). Tính $lim_(x -> 0) (e^(3x) - e^x)/(sin x)$.

#v(3cm)

*Điểm số:*

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
  stroke: 0.5pt,
  [Câu], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
  [Điểm], [], [], [], [], [], [], [], [], [], [],
)

#v(1em)
#align(right, text(size: 10pt, fill: gray)[Tổng: /10])

=== Kỹ thuật đánh số câu hỏi tự động

Để tạo bộ đếm câu hỏi tự động tăng, bạn có thể định nghĩa:

#code-block[
```typst
#let so-cau = counter("cau-hoi")

#let cau-trac-nghiem(cau, a, b, c, d) = {
  so-cau.step()
  [
    *Câu #so-cau.display().* #cau \
    A. #a \
    B. #b \
    C. #c \
    D. #d \
  ]
}

#let cau-tu-luan(cau, diem) = {
  so-cau.step()
  [
    *Câu #so-cau.display() (#diem điểm).* #cau
  ]
}
```
]

== Bài tập thực hành (Template)

*Bài 1.* Tạo phiếu bài tập chương "Đạo hàm" gồm 5 câu trắc nghiệm
và 3 câu tự luận. Dùng các hộp showybox để phân biệt các phần.

*Bài 2.* Tùy chỉnh bộ hộp nội dung riêng với màu sắc và viền theo
phong cách của trường bạn (dùng màu logo, thêm tên trường vào header).

#pagebreak()
