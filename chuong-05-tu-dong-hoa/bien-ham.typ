#import "../assets/style.typ": *
= Chương 5: Tự động hóa & Lập trình

== Ngôn ngữ scripting của Typst

Typst không chỉ là ngôn ngữ đánh dấu — nó có một ngôn ngữ lập trình tích hợp
mạnh mẽ cho phép tự động hóa nội dung.

=== Hai chế độ: Content mode vs Code mode

- *Content mode:* viết văn bản thông thường, định dạng, công thức
- *Code mode:* bắt đầu bằng `#`, chạy biểu thức Typst

#code-block[
```typst
#let x = 5        // code mode: gán biến
x = #x            // content mode: hiển thị giá trị
```
]

=== Biến và kiểu dữ liệu

#code-block[
```typst
// Kiểu số
#let so = 42
#let thuc = 3.14

// Kiểu chuỗi
#let ten = "Typst"
#let ghep = ten + " là công cụ soạn thảo"

// Kiểu bool
#let dung = true
#let sai = false

// Kiểu content
#let doan = [Đây là *nội dung* được định dạng]

// Array
#let ds = (1, 2, 3, 4, 5)

// Dictionary
#let sv = (ho: "Nguyễn", ten: "An", diem: 8.5)
```
]

=== Điều kiện

#code-block[
```typst
#let diem = 8.5

#if diem >= 8 [
  *Giỏi*
] else if diem >= 6.5 [
  *Khá*
] else [
  *Trung bình*
]
```
]

=== Vòng lặp

#code-block[
```typst
// Duyệt array
#for i in (1, 2, 3, 4, 5) [
  Số #i
]

// Duyệt range
#for i in range(5) [
  #i,
]
```
]

=== Hàm

Hàm cho phép đóng gói nội dung tái sử dụng:

#code-block[
```typst
#let dinh-ly(ten, noi-dung) = {
  showybox(
    title: "Định lý " + ten,
    body: noi-dung,
    frame: (stroke: 1.5pt + primary-color),
    header: (fill: primary-color, text-weight: "bold"),
  )
}

// Sử dụng
#dinh-ly("Pythagoras")[
  $ a^2 + b^2 = c^2 $
]
```
]

=== Scope và import

#code-block[
```typst
// Import một hàm cụ thể
#import "assets/style.typ": dinh-ly, vi-du

// Import toàn bộ (kèm *)
#import "assets/style.typ": *

// Include nội dung
#include "chuong-01/index.typ"
```
]

=== Ví dụ: Hàm tạo bảng nhân

#code-block[
```typst
#let bang-nhan(n) = {
  table(
    columns: (auto, auto, auto),
    [*n*], [*Kết quả*], [*Công thức*],
    ..for i in range(1, 11) {
      (str(i), str(n * i), [#n × #i = #(n * i)])
    },
  )
}

#bang-nhan(7)
```
]

== Hàm và component tái sử dụng

=== Thiết kế hàm cho nội dung Toán

==== Hàm định lý tổng quát

#code-block[
```typst
#let dinh-ly(so, ten, noi-dung) = {
  showybox(
    title: "Định lý " + so + ". " + ten,
    body: noi-dung,
    frame: (stroke: 1.5pt + primary-color),
    header: (fill: primary-color, text-weight: "bold"),
    margin: 0.5em,
  )
}
```
]

==== Hàm ví dụ có lời giải

#code-block[
```typst
#let vi-du(so, bai, giai) = {
  showybox(
    title: "Ví dụ " + so,
    body: [
      #bai
      #if giai != none [
        *Lời giải.* #giai
      ]
    ],
    frame: (stroke: 1.5pt + accent-color),
    header: (fill: accent-color, text-weight: "bold"),
    margin: 0.5em,
  )
}

// Sử dụng
#vi-du(
  "1",
  [Tính $integral_0^1 x^2 dif x$],
  [$ = [frac(x^3, 3)]_0^1 = frac(1, 3)$],
)
```
]

=== Set và Show rules

`#set` thay đổi thuộc tính mặc định, `#show` biến đổi hiển thị:

#code-block[
```typst
// Set: tất cả công thức được đánh số
#set math.equation(numbering: "(1)")

// Show: bọc tất cả heading cấp 1
#show heading.where(level: 1): it => {
  set text(size: 18pt, weight: "bold", fill: primary-color)
  v(1.5em)
  it
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + primary-color)
  v(0.5em)
}

// Show: bọc tất cả công thức
#show math.equation: it => {
  box(stroke: 0.5pt + gray, inset: 4pt, it)
}
```
]

=== State và Counter

Dùng `counter` để đánh số tự động:

#code-block[
```typst
// Tạo counter
#let vt = counter("vi-du")

// Mỗi lần gọi, tăng counter
#let vi-du(body) = {
  vt.step()
  showybox(
    title: "Ví dụ " + vt.display(),
    body: body,
  )
}

// Reset counter theo chương
#let reset-counter() = {
  vt.update(0)
}
```
]

=== Xây dựng file style.typ

Một file `style.typ` tốt nên chứa:
- Các hằng số màu sắc
- Các hàm dựng sẵn (định lý, ví dụ, bài tập)
- Các show rule toàn cục
- Cài đặt page, text, heading

=== Bài tập thực hành

*Bài 1.* Viết hàm `ve-do-thi(f, x_min, x_max)` vẽ đồ thị hàm số $y = f(x)$ bằng cetz.

*Bài 2.* Tạo hàm `bang-tich-phan(f, a, b, n)` tính gần đúng tích phân bằng công thức hình thang.

*Bài 3.* Xây dựng hệ thống counter tự động cho định lý, ví dụ, bài tập trong một chương.
