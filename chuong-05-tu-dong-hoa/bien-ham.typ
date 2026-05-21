#import "../assets/style.typ": *

= Chương 5: Tự động hóa & Lập trình với Typst

#ghi-nho[
  *Mục tiêu chương:* Làm chủ ngôn ngữ scripting của Typst để
  tái sử dụng cấu trúc, nhập dữ liệu từ file ngoài, và sinh
  nội dung tự động — biến Typst từ công cụ soạn thảo thành
  một nền tảng tạo tài liệu thông minh.
]

== Ngôn ngữ scripting của Typst

Typst không chỉ là ngôn ngữ đánh dấu (_markup_) — nó có một ngôn ngữ
lập trình đầy đủ (_scripting_) tích hợp bên trong. Điều này có nghĩa
bạn có thể viết code để tự động tạo nội dung, tính toán, và xử lý dữ liệu
mà không cần bất kỳ công cụ bên ngoài nào.

=== Hai chế độ: Content Mode vs Code Mode

Typst hoạt động ở hai chế độ:

1. *Content mode* (mặc định): viết văn bản, định dạng, công thức.
   Mọi thứ bạn gõ đều được hiểu là nội dung.

2. *Code mode* (bắt đầu bằng `#`): viết biểu thức, gọi hàm, tính toán.
   Dấu `#` chuyển từ content mode sang code mode.

#code-block[
```typst
#let x = 5          // code mode: định nghĩa biến
Giá trị là #x.      // content mode + code: hiển thị giá trị
#let y = x * 2 + 1  // code mode: tính toán
Kết quả: #y.        // hiển thị kết quả
```
]

=== Biến và kiểu dữ liệu

Typst hỗ trợ các kiểu dữ liệu cơ bản:

#code-block[
```typst
// Số nguyên và số thực
#let so-nguyen = 42
#let so-thuc = 3.14159

// Chuỗi (string)
#let ten = "Typst"
#let mo-ta = "công cụ soạn thảo thế hệ mới"

// Boolean
#let dung = true
#let sai = false

// Mảng (array)
#let ds = (1, 2, 3, 4, 5)
#let ds-rong = ()

// Từ điển (dictionary)
#let sv = (ho: "Nguyễn", ten: "An", diem: 8.5)

// Content (nội dung đã định dạng)
#let gioi-thieu = [Đây là *nội dung* Typst]
```
]

=== Điều kiện (if-else)

#code-block[
```typst
#let diem = 8.5

Phân loại:
#if diem >= 9 [
  Xuất sắc
] else if diem >= 8 [
  Giỏi
] else if diem >= 6.5 [
  Khá
] else if diem >= 5 [
  Trung bình
] else [
  Yếu
]
```
]

=== Vòng lặp (for loop)

#code-block[
```typst
// Duyệt mảng
#for i in (1, 2, 3, 4, 5) [
  Số thứ #i \
]

// Duyệt range
#for i in range(1, 6) [
  Bình phương của #i là #(i * i). \
]
```
]

=== Hàm (function)

Hàm là chìa khóa để viết code tái sử dụng. Trong Typst, hàm được
định nghĩa bằng `#let`:

#code-block[
```typst
// Hàm đơn giản
#let binh-phuong(x) = x * x

#binh-phuong(5)  // trả về 25

// Hàm trả về nội dung (content)
#let dinh-ly(ten, noi-dung) = {
  showybox(
    title: "Định lý " + ten,
    body: noi-dung,
    frame: (stroke: 1.5pt + blue),
    header: (fill: blue, text-weight: "bold"),
  )
}
```
]

=== Ví dụ: Hàm tạo bảng nhân

#code-block[
```typst
#let bang-nhan(n) = {
  table(
    columns: (auto, auto, auto),
    stroke: 0.5pt,
    table.header[*Phép tính*], table.header[*Kết quả*], table.header[*Công thức*],
    ..for i in range(1, 11) {
      (str(n) + " × " + str(i), str(n * i), [= #n × #i])
    },
  )
}

#bang-nhan(7)
```
]

Kết quả tạo ra bảng cửu chương 7 với 10 dòng tự động, không cần viết tay
từng dòng — đây chính là sức mạnh của scripting.

=== Scope và module

- `#import "file.typ": ten-ham` — import một hàm cụ thể
- `#import "file.typ": *` — import tất cả
- `#include "file.typ"` — chèn toàn bộ nội dung file vào vị trí hiện tại

== Hàm và Component tái sử dụng cho Toán học

=== Thiết kế hệ thống hàm cho sách Toán

Để viết một cuốn sách Toán nhất quán, bạn nên thiết kế một bộ hàm
dùng chung toàn bộ sách, đặt trong file `style.typ`:

#code-block[
```typst
// style.typ — Bộ hàm dùng chung

#let dinh-ly(so, ten, noi-dung) = {
  showybox(
    title: "Định lý " + so + ". " + ten,
    body: noi-dung,
    frame: (stroke: 1.5pt + rgb("#1a5276")),
    header: (fill: rgb("#1a5276"), text-weight: "bold"),
  )
}

#let vi-du(so, bai, giai: none) = {
  showybox(
    title: "Ví dụ " + so,
    body: if giai != none {
      [#bai

      *Lời giải.* #giai]
    } else { bai },
    frame: (stroke: 1.5pt + rgb("#e67e22")),
    header: (fill: rgb("#e67e22"), text-weight: "bold"),
  )
}

#let bai-tap(diem, cau, giai: none) = {
  let so = counter("bt").step()
  [
    *Bài #counter("bt").display() (#diem điểm).* #cau
    #if giai != none {
      #loi-giai[#giai]
    }
  ]
}
```
]

=== Set Rules và Show Rules

`#set` và `#show` là hai cơ chế mạnh để kiểm soát giao diện toàn cục:

*Set rule* — thay đổi thuộc tính mặc định:

#code-block[
```typst
#set text(size: 12pt, font: "STIX Two")
#set page(paper: "a4", margin: 2.5cm)
#set math.equation(numbering: "(1)")
```
]

*Show rule* — biến đổi cách hiển thị:

#code-block[
```typst
// Tùy chỉnh cách hiển thị tiêu đề cấp 1
#show heading.where(level: 1): it => {
  set text(size: 20pt, weight: "bold", fill: blue)
  v(1em)
  it
  v(0.3em)
  line(length: 100%, stroke: 0.5pt + blue)
  v(0.5em)
}
```
]

=== Counter và State

Dùng `counter` để đánh số tự động cho các phần tử:

#code-block[
```typst
#let dinh-ly(ten, noi-dung) = {
  context {
    let so = counter("dinh-ly").step()
    showybox(
      title: "Định lý " + str(so) + ". " + ten,
      body: noi-dung,
    )
  }
}
```
]

=== Bài tập thực hành (Scripting)

*Bài 1.* Viết hàm `ve-do-thi(f, x_min, x_max, n)` nhận tham số là
hàm số $f$, khoảng vẽ, và số điểm rời rạc. Hàm vẽ đồ thị bằng cetz,
tự động thêm trục tọa độ và nhãn.

*Bài 2.* Tạo hàm `tinh-tich-phan-hinh-thang(f, a, b, n)` tính gần đúng
tích phân $integral_a^b f(x) dif x$ bằng công thức hình thang với
$n$ đoạn chia. In ra kết quả và so sánh với giá trị chính xác.

*Bài 3.* Xây dựng hệ thống counter độc lập cho: Định lý, Ví dụ, Bài tập,
và Hình vẽ. Đảm bảo mỗi chương reset counter về 1.

#pagebreak()
