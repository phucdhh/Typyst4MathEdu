#import "../assets/style.typ": *

= Chương 4: Trình bày tài liệu Toán chuyên nghiệp

#ghi-nho[
  *Mục tiêu chương:* Tạo được đề thi, bài tập, lời giải và slide bài giảng
  đạt chuẩn chuyên nghiệp. Làm chủ các gói showybox, pinit, và polylux.
]

== Show-boxes và Môi trường nội dung Toán học

=== Tại sao cần hộp nội dung?

Trong sách giáo khoa và tài liệu Toán, bạn thường thấy các khung đặc biệt:
Định lý (viền xanh), Ví dụ (viền cam), Chú ý (viền đỏ), Bài tập (viền xanh lá).
Những hộp này không chỉ làm đẹp tài liệu mà còn giúp người đọc nhanh chóng
nhận diện loại nội dung.

Gói `showybox` (do *Pablo González Calderón* phát triển, có sẵn trên
Typst Universe) cung cấp giải pháp linh hoạt cho việc này.

=== Cài đặt showybox

#code-block[
```typst
#import "@preview/showybox:2.0.4": showybox
```
]

=== Tạo hộp Định lý (Theorem Box)

#dinh-ly[
  *Định lý giá trị trung bình (Mean Value Theorem).*
  Nếu $f$ liên tục trên $[a, b]$ và khả vi trên $(a, b)$,
  thì tồn tại $c in (a, b)$ sao cho:

  $ f'(c) = frac(f(b) - f(a), b - a) $
]

Đoạn code tạo hộp trên:

#code-block[
```typst
#showybox(
  title: "Định lý",
  body: [
    *Định lý giá trị trung bình.*
    Nếu $f$ liên tục trên $[a, b]$ và khả vi trên $(a, b)$,
    thì tồn tại $c in (a, b)$ sao cho:

    $ f'(c) = frac(f(b) - f(a), b - a) $
  ],
  frame: (stroke: 1.5pt + blue),
  header: (fill: blue, text-weight: "bold"),
)
```
]

=== Tạo hộp Ví dụ (Example Box)

#vi-du[
  Tính $lim_(x -> 0) frac(sin 3x, x)$.

  *Giải:* Nhân tử và mẫu với 3:

  $ lim_(x -> 0) frac(sin 3x, x) = lim_(x -> 0) 3 dot frac(sin 3x, 3x) = 3 dot 1 = 3 $
]

=== Tạo hộp Chú ý (Warning Box)

#chu-y[
  Khi tính tích phân từng phần, cần chọn $u$ và $dif v$ sao cho
  $integral v dif u$ đơn giản hơn tích phân ban đầu.
  Ưu tiên đặt $u$ là đa thức, logarit; đặt $dif v$ là lượng giác, mũ.
]

=== Tạo hộp Ghi nhớ (Note Box)

#ghi-nho[
  Quy tắc *LIATE* để chọn $u$ trong tích phân từng phần:
  L — Logarithm, I — Inverse trig, A — Algebraic, T — Trig, E — Exponential.
]

=== Bảng tổng kết các loại hộp

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  table.header[Loại hộp], table.header[Màu viền], table.header[Mục đích],
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
