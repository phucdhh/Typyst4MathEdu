#import "../assets/style.typ": *

= Chương 2: Cú pháp cơ bản

#ghi-nho[
  *Mục tiêu chương:* Thành thạo cú pháp văn bản, định dạng cơ bản,
  công thức Toán *inline* và *block*, cùng cách tạo bảng biểu,
  chèn hình ảnh và thiết lập bố cục trang.
]

== Văn bản và định dạng cơ bản

Typst coi văn bản là thành phần mặc định — bạn không cần thẻ đặc biệt nào
để viết chữ. Điều này khác với LaTeX, nơi bạn phải bắt đầu với
`\begin{document}`.

=== Đoạn văn và xuống dòng

Trong Typst, có hai cách xuống dòng:

1. *Xuống dòng đơn* (soft break) — nhấn Enter một lần. Văn bản vẫn nằm trong
   cùng một đoạn. Typst sẽ tự động ngắt dòng khi cần.

2. *Xuống đoạn* (paragraph break) — để một dòng trống giữa hai đoạn văn.
   Đây là cách để tạo đoạn văn mới.

#vi-du[
  Đoạn thứ nhất. Vẫn trong đoạn thứ nhất.
  Dòng này cũng vẫn trong đoạn thứ nhất.

  Đoạn thứ hai. Đây là đoạn mới,
  vì phía trên có một dòng trống.
]

=== In đậm, in nghiêng, gạch chân và code inline

Typst dùng cú pháp đánh dấu (markdown-like) cho các kiểu chữ cơ bản.
Nguồn gốc của cú pháp này là từ *Markdown* — ngôn ngữ đánh dấu nhẹ do
John Gruber tạo ra năm 2004 — nhưng Typst mở rộng đáng kể khả năng của nó.

Kiểu chữ thường dùng trong tài liệu Toán học:

| Kiểu | Cú pháp | Kết quả | Mục đích sử dụng |
|------|---------|---------|------------------|
| In đậm | `*nội dung*` | In đậm | Từ khóa, định nghĩa |
| In nghiêng | `_nội dung_` | In nghiêng | Thuật ngữ tiếng Anh, nhấn mạnh |
| Code | `` `nội dung` `` | `code` | Tên lệnh, cú pháp |
| Đậm+nghiêng | `_*nội dung*_` | Đậm và nghiêng | Nhấn mạnh mạnh |

#code-block[
```typst
*Định lý Pythagoras* là một trong những định lý
cơ bản nhất của _Euclidean geometry_.

Trong Typst, bạn dùng `$a^2$` để viết $a^2$.
```
]

=== Tiêu đề các cấp

Typst dùng dấu `=` để tạo tiêu đề. Số lượng dấu `=` quyết định cấp tiêu đề,
từ 1 đến 6:

#code-block[
```typst
= Tiêu đề cấp 1 (chương)
== Tiêu đề cấp 2 (mục lớn)
=== Tiêu đề cấp 3 (mục con)
==== Tiêu đề cấp 4 (tiểu mục)
===== Tiêu đề cấp 5
====== Tiêu đề cấp 6
```
]

#chu-y[
  *Lưu ý quan trọng:* Sau dấu `=` phải có *ít nhất một khoảng trắng*.
  Typst phân biệt `= Tiêu đề` (tiêu đề) với `=3` (phép gán giá trị trong code mode).
]

Bạn có thể tùy chỉnh cách hiển thị tiêu đề bằng `#show heading` (sẽ học ở
Chương 5).

=== Danh sách (List)

Typst hỗ trợ hai loại danh sách chính:

*Danh sách không thứ tự* (unordered list / bullet list) dùng dấu `-`:

#code-block[
```typst
- Mục thứ nhất
- Mục thứ hai
  - Mục con (thụt vào 2 khoảng trắng)
  - Mục con khác
- Mục thứ ba
```
]

*Danh sách có thứ tự* (ordered list / numbered list) dùng dấu `+`:

#code-block[
```typst
+ Bước 1: Đọc đề
+ Bước 2: Phân tích
+ Bước 3: Giải
  + Bước 3a: Đặt ẩn
  + Bước 3b: Biến đổi
+ Bước 4: Kết luận
```
]

- Mục thứ nhất
- Mục thứ hai
  - Mục con (thụt vào 2 khoảng trắng)
  - Mục con khác
- Mục thứ ba

+ Bước 1: Đọc đề
+ Bước 2: Phân tích
+ Bước 3: Giải
  + Bước 3a: Đặt ẩn
  + Bước 3b: Biến đổi
+ Bước 4: Kết luận

=== Chú thích (Comments)

Dùng `//` cho chú thích một dòng. Chú thích *không xuất hiện* trong file PDF
— chúng chỉ dành cho người viết và cộng tác viên:

#code-block[
```typst
// Đây là chú thích — sẽ không thấy trong PDF
$ a^2 + b^2 = c^2 $ // Công thức Pythagoras
```
]

=== Ký tự đặc biệt và escape

Một số ký tự có ý nghĩa đặc biệt trong Typst và cần được *escape* (thoát)
nếu bạn muốn hiển thị chúng như văn bản thường:

| Ký tự | Ý nghĩa đặc biệt | Cách escape |
|-------|-----------------|-------------|
| `\` | Bắt đầu lệnh | `\\` |
| `$` | Bắt đầu/kết thúc công thức | `\$` |
| `#` | Bắt đầu code mode | `\#` |
| `~` | Khoảng trắng không ngắt | `\~` |

#code-block[
```typst
Giá sản phẩm là \$50.000
Đường dẫn: C:\\Users\\Admin
Địa chỉ email: ten\#123@email.com
```
]

=== Unicode và tiếng Việt

Typst hỗ trợ Unicode đầy đủ. Tiếng Việt với tất cả các dấu thanh
(á, à, ả, ã, ạ, ư, ơ, ê, ô, đ) được hiển thị chính xác mà không cần
gói bổ sung — một lợi thế lớn so với LaTeX, nơi bạn cần `\usepackage[utf8]{vietnam}`
và font phù hợp.

#code-block[
```typst
#set text(lang: "vi")

Tiếng Việt: Trường Đại học Sư phạm Huế
Toán học: Định lý Pythagoras
Dấu thanh đầy đủ: à á ả ã ạ, ầ ấ ẩ ẫ ậ
```
]

Nếu font không hiển thị đúng dấu tiếng Việt, hãy chuyển sang font
hỗ trợ đầy đủ Unicode tiếng Việt như *Noto Serif*, *STIX Two*,
hoặc *New Computer Modern*.

#chu-y[
  Khi dùng `#set text(lang: "vi")`, Typst sẽ kích hoạt các quy tắc
  ngắt dòng và gạch nối (hyphenation) phù hợp với tiếng Việt.
]

== Liên kết, hình ảnh và bảng biểu

=== Siêu liên kết (Hyperlinks)

Trong Typst, siêu liên kết được tạo bằng hàm `#link`:

#code-block[
```typst
#link("https://typst.app")[Tài liệu chính thức Typst]
#link("https://github.com")[GitHub]
```
]

Liên kết trong PDF sẽ có thể nhấn được và thường có màu sắc khác biệt
(tùy thuộc vào style đã cấu hình).

=== Chèn hình ảnh

Typst hỗ trợ các định dạng ảnh phổ biến: PNG, JPEG, GIF, và SVG.
Để chèn ảnh chuyên nghiệp kèm caption, dùng `#figure`:

#code-block[
```typst
#figure(
  image("figures/do-thi.png", width: 80%),
  caption: [Đồ thị hàm số $y = x^2$],
)
```

Để căn chỉnh ảnh:

#code-block[
```typst
#align(center, image("figures/do-thi.png", width: 60%))
```
]

=== Bảng biểu cơ bản

Typst có hàm `#table` rất linh hoạt để tạo bảng:

#code-block[
```typst
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  table.header[*Họ tên*], table.header[*Điểm Toán*], table.header[*Điểm Lý*],
  [Nguyễn Văn Bình], [8.5], [9.0],
  [Trần Thị Cúc], [9.0], [8.5],
)
```
]

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  table.header[*Họ tên*], table.header[*Điểm Toán*], table.header[*Điểm Lý*],
  [Nguyễn Văn Bình], [8.5], [9.0],
  [Trần Thị Cúc], [9.0], [8.5],
)

#ghi-nho[
  - `columns: (auto, auto, auto)` — ba cột, mỗi cột rộng tự động
  - `stroke: 0.5pt` — đường kẻ dày 0.5 point
  - `table.header[...]` — ô tiêu đề (in đậm, tự động)
  - Mỗi dòng trong bảng là một tập hợp các ô, cách nhau bởi dấu phẩy
]

=== Bảng chứa công thức Toán

#code-block[
```typst
#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  [Phương trình], [Nghiệm],
  [$x^2 - 1 = 0$], [$x = ±1$],
  [$x^2 + x - 6 = 0$], [$x = 2 " hoặc " x = -3$],
)
```
]

#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  [Phương trình], [Nghiệm],
  [$x^2 - 1 = 0$], [$x = ±1$],
  [$x^2 + x - 6 = 0$], [$x = 2 " hoặc " x = -3$],
)

=== Tham chiếu chéo (Cross-reference)

Tham chiếu chéo cho phép bạn liên kết đến các phần khác trong tài liệu.
Rất hữu ích khi viết sách, luận văn:

#code-block[
```typst
== Phương trình bậc hai <sec:pt-bac-hai>

// ... nội dung ...

// Ở một chỗ khác:
Như đã trình bày ở Mục @sec:pt-bac-hai, ...
```
]

Cú pháp: `<tên-nhãn>` để đặt nhãn, `@tên-nhãn` để tham chiếu.
Typst tự động cập nhật số thứ tự khi bạn thêm/xóa nội dung.

== Tổng kết Chương 2 (Phần 1)

#ghi-nho[
  *Những điều cần nhớ:*
  - Typst dùng cú pháp kiểu Markdown cho định dạng cơ bản
  - `=` đến `======` tạo tiêu đề 6 cấp
  - `-` cho danh sách không thứ tự, `+` cho có thứ tự
  - `#table(...)` tạo bảng mạnh mẽ, hỗ trợ công thức Toán
  - `#figure(image(...), caption: ...)` cho hình ảnh chuyên nghiệp
  - `<label>` và `@label` cho tham chiếu chéo tự động
]

#pagebreak()
