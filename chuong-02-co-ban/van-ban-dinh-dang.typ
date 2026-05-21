#import "../assets/style.typ": *

= Chương 2: CÚ PHÁP CƠ BẢN TRONG TYPST

Sau chương đầu, bạn đã cài đặt được Typst và thấy một tài liệu đơn giản chạy được. Chương này sẽ đi sâu vào ngữ pháp của Typst: cách làm việc với văn bản, định dạng chữ, tiêu đề, danh sách, bảng biểu — tất cả những gì cần thiết để viết một tài liệu giáo dục hoàn chỉnh.

Điểm nhấn quan trọng: mỗi ví dụ trong chương này đều có hai phần — *code bạn gõ* và *kết quả bạn thấy trong PDF* — đặt cạnh nhau để so sánh trực tiếp.

#ghi-nho[
  *Mục tiêu chương:* Thành thạo cú pháp văn bản và định dạng cơ bản; viết công thức Toán *inline* và *block*; tạo bảng biểu, chèn hình ảnh và thiết lập bố cục trang.
]

== Văn bản và định dạng cơ bản

Typst coi văn bản là thành phần mặc định — bạn không cần thẻ đặc biệt nào để bắt đầu viết chữ. Điều này khác với LaTeX, nơi bạn phải viết `\begin{document}` trước khi có bất kỳ văn bản nào hiện ra.

=== Đoạn văn và xuống dòng

Trong Typst, quy tắc xuống dòng khác với những gì bạn hay dùng trong Word:

1. *Xuống dòng đơn* (soft break) — nhấn Enter một lần. Văn bản vẫn thuộc cùng một đoạn. Typst tự động nối thành dòng liên tục và tự ngắt khi cần.

2. *Xuống đoạn* (paragraph break) — để trống một dòng giữa hai đoạn. Đây mới là cách tạo đoạn văn mới trong Typst.

#code-preview(
  ```typst
Đoạn thứ nhất. Vẫn trong đoạn thứ nhất.
Dòng này cũng vẫn trong đoạn thứ nhất.

Đoạn thứ hai bắt đầu ở đây, vì phía
trên có một dòng trống.
  ```,
  [
    Đoạn thứ nhất. Vẫn trong đoạn thứ nhất. Dòng này cũng vẫn trong đoạn thứ nhất.

    Đoạn thứ hai bắt đầu ở đây, vì phía trên có một dòng trống.
  ]
)

=== In đậm, in nghiêng và code inline

Typst dùng cú pháp đánh dấu (tương tự Markdown) cho các kiểu chữ cơ bản:

#code-preview(
  ```typst
*In đậm* dùng cho từ khóa và định nghĩa.
_In nghiêng_ dùng cho thuật ngữ tiếng Anh.
`code inline` dùng cho tên lệnh, cú pháp.
_*Vừa đậm vừa nghiêng*_ để nhấn mạnh mạnh.
  ```,
  [
    *In đậm* dùng cho từ khóa và định nghĩa.
    _In nghiêng_ dùng cho thuật ngữ tiếng Anh.
    `code inline` dùng cho tên lệnh, cú pháp.
    _*Vừa đậm vừa nghiêng*_ để nhấn mạnh mạnh.
  ]
)

Bảng tóm tắt các kiểu chữ thường dùng trong tài liệu Toán học:

#figure(
  table(
    columns: (0.7fr, 0.8fr, 0.5fr, 1.0fr),
    stroke: 0.5pt,
    fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
    table.header([*Cú pháp*], [*Kết quả*], [*Phím tắt*], [*Khi nào dùng*]),
    [`*nội dung*`], [*in đậm*], [`Ctrl+B`], [Từ khóa, định nghĩa],
    [`_nội dung_`], [_in nghiêng_], [`Ctrl+I`], [Thuật ngữ tiếng Anh],
    [`` `nội dung` ``], [`code`], [-], [Tên lệnh, cú pháp],
    [`_*nội dung*_`], [_*đậm + nghiêng*_], [-], [Nhấn mạnh đặc biệt],
  ),
  caption: [Các kiểu định dạng chữ cơ bản trong Typst],
)

=== Tiêu đề các cấp

Số dấu `=` quyết định cấp của tiêu đề, từ 1 đến 6. Typst tự động đánh số và định dạng mỗi cấp theo style đã cấu hình:

#code-preview(
  ```typst
= Tiêu đề cấp 1 (chương)
== Tiêu đề cấp 2 (mục lớn)
=== Tiêu đề cấp 3 (mục con)
==== Tiêu đề cấp 4 (tiểu mục)
  ```,
  [
    #text(size: 16pt, weight: "bold")[1 Tiêu đề cấp 1 (chương)]
    #v(0.3em)
    #text(size: 13pt, weight: "bold", fill: rgb("#2e86c1"))[1.1 Tiêu đề cấp 2 (mục lớn)]
    #v(0.2em)
    #text(size: 11pt, weight: "bold")[1.1.1 Tiêu đề cấp 3 (mục con)]
    #v(0.2em)
    #text(size: 11pt, weight: "bold")[Tiêu đề cấp 4 (tiểu mục)]
  ]
)

#chu-y[
  Sau dấu `=` phải có *ít nhất một khoảng trắng*. Typst phân biệt
  `= Tiêu đề` (tiêu đề cấp 1) với `=x` (phép so sánh bằng trong code mode). Trong sách này, chúng tôi dùng tối đa 3 cấp tiêu đề có đánh số.
]

=== Danh sách (List)

Typst hỗ trợ hai loại danh sách phổ biến nhất:

#code-preview(
  ```typst
// Danh sách không thứ tự (dùng dấu -)
- Giải tích
- Đại số tuyến tính
  - Ma trận
  - Định thức
- Xác suất thống kê

// Danh sách có thứ tự (dùng dấu +)
+ Đọc đề bài
+ Phân tích yêu cầu
+ Thực hiện tính toán
+ Kiểm tra kết quả
  ```,
  [
    - Giải tích
    - Đại số tuyến tính
      - Ma trận
      - Định thức
    - Xác suất thống kê

    + Đọc đề bài
    + Phân tích yêu cầu
    + Thực hiện tính toán
    + Kiểm tra kết quả
  ]
)

=== Chú thích và ký tự đặc biệt

Dùng `//` cho chú thích — sẽ *không xuất hiện* trong file PDF:

#code-block[
```typst
// Đây là chú thích — chỉ người viết nhìn thấy
$ a^2 + b^2 = c^2 $ // Công thức Pythagoras
```  
]

Một số ký tự có ý nghĩa đặc biệt và cần escape bằng dấu `\`:

#figure(
  table(
    columns: (1fr, 1.5fr, 1fr),
    stroke: 0.5pt,
    fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
    table.header([*Ký tự*], [*Ý nghĩa trong Typst*], [*Cách escape*]),
    [`$`], [Bắt đầu/kết thúc công thức], [`\$`],
    [`#`], [Bắt đầu lệnh Typst], [`\#`],
    [`*`], [Bắt đầu in đậm], [`\*`],
    [`_`], [Bắt đầu in nghiêng], [`\_`],
    [`\`], [Ký tự escape], [`\\`],
  ),
  caption: [Các ký tự đặc biệt và cách escape trong Typst],
)

=== Unicode và tiếng Việt

Typst hỗ trợ Unicode đầy đủ từ đầu — không cần cài thêm package hay cấu hình phức tạp
như LaTeX. Tất cả chữ tiếng Việt với dấu thanh đều hiển thị đúng ngay khi bạn gõ:

#code-preview(
  ```typst
#set text(lang: "vi")

Đây là văn bản tiếng Việt với đầy đủ dấu thanh:
Sắc: á, ắ, ấ, é, ế, í, ó, ố, ớ, ú, ứ, ý
Huyền: à, ằ, ầ, è, ề, ì, ò, ồ, ờ, ù, ừ, ỳ
  ```,
  [
    #set text(lang: "vi")
    Đây là văn bản tiếng Việt với đầy đủ dấu thanh:

    Sắc: á, ắ, ấ, é, ế, í, ó, ố, ớ, ú, ứ, ý

    Huyền: à, ằ, ầ, è, ề, ì, ò, ồ, ờ, ù, ừ, ỳ
  ]
)

#ghi-nho[
  Lệnh `#set text(lang: "vi")` báo cho Typst biết ngôn ngữ tài liệu là tiếng Việt,
  kích hoạt quy tắc ngắt dòng và gạch nối (hyphenation) phù hợp với tiếng Việt.
  Đây là lệnh nên đặt ở đầu mỗi tài liệu tiếng Việt.
]

== Liên kết, hình ảnh và bảng biểu

=== Siêu liên kết (Hyperlinks)

Trong Typst, siêu liên kết được tạo bằng hàm `#link(url)[văn bản hiển thị]`:

#code-preview(
  ```typst
Tài liệu chính thức: #link("https://typst.app")[typst.app]

Kho package: #link("https://typst.app/universe")[Typst Universe]
  ```,
  [
    Tài liệu chính thức: #link("https://typst.app")[typst.app]

    Kho package: #link("https://typst.app/universe")[Typst Universe]
  ]
)

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
]

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
  [*Họ tên*], [*Điểm Toán*], [*Điểm Lý*],
  [Nguyễn Văn Bình], [8.5], [9.0],
  [Trần Thị Cúc], [9.0], [8.5],
)
```
]
#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  [*Họ tên*], [*Điểm Toán*], [*Điểm Lý*],
  [Nguyễn Văn Bình], [8.5], [9.0],
  [Trần Thị Cúc], [9.0], [8.5],
)
]
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
#align(center)[
#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  [Phương trình], [Nghiệm],
  [$x^2 - 1 = 0$], [$x = ±1$],
  [$x^2 + x - 6 = 0$], [$x = 2 " hoặc " x = -3$],
)
]

=== Bảng có tiêu đề cố định

Dùng `table.header(...)` để khai báo hàng tiêu đề. Khi bảng kéo dài sang trang mới, Typst tự động lặp lại hàng tiêu đề — rất hữu ích cho bảng dài trong báo cáo, luận văn:

#code-block[
```typst
#figure(
  table(
    columns: (1.5fr, auto, auto, auto),
    stroke: 0.5pt,
    fill: (_, row) => if row == 0 { rgb("#dce6f1") } else { white },
    table.header(
      [*Học sinh*], [*Toán*], [*Lý*], [*Hóa*],
    ),
    [Nguyễn Văn An],  [8.5], [9.0], [7.5],
    [Trần Thị Bình],  [9.0], [8.5], [9.5],
    [Lê Hoàng Cường], [7.0], [8.0], [8.5],
    [Phạm Thị Dung],  [9.5], [9.5], [9.0],
  ),
  caption: [Bảng điểm học kỳ I],
)
```
]
#figure(
  table(
    columns: (1.5fr, auto, auto, auto),
    stroke: 0.5pt,
    fill: (_, row) => if row == 0 { rgb("#dce6f1") } else { white },
    table.header(
      [*Học sinh*], [*Toán*], [*Lý*], [*Hóa*],
    ),
    [Nguyễn Văn An],  [8.5], [9.0], [7.5],
    [Trần Thị Bình],  [9.0], [8.5], [9.5],
    [Lê Hoàng Cường], [7.0], [8.0], [8.5],
    [Phạm Thị Dung],  [9.5], [9.5], [9.0],
  ),
  caption: [Bảng điểm học kỳ I],
)

=== Bảng gộp ô (Colspan và Rowspan)

Dùng `table.cell(colspan: n)` để gộp `n` ô theo chiều ngang, `table.cell(rowspan: n)` để gộp theo chiều dọc:

*Gộp ô ngang (colspan):*

#code-block[
```typst
#table(
  columns: (2fr, 1.5fr, 1fr),
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
  table.cell(colspan: 3, align: center)[*Bảng hằng đẳng thức đáng nhớ*],
  [*Biểu thức*],  [*Khai triển*],       [*Loại*],
  [$(a + b)^2$],  [$a^2 + 2a b + b^2$], [Tổng bình phương],
  [$(a - b)^2$],  [$a^2 - 2a b + b^2$], [Hiệu bình phương],
  [$(a+b)(a-b)$], [$a^2 - b^2$],        [Hiệu hai bình phương],
)
```
]
#align(center)[
#table(
  columns: (2fr, 1.5fr, 1fr),
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
  table.cell(colspan: 3, align: center)[*Bảng hằng đẳng thức đáng nhớ*],
  [*Biểu thức*],  [*Khai triển*],       [*Loại*],
  [$(a + b)^2$],  [$a^2 + 2a b + b^2$], [Tổng bình phương],
  [$(a - b)^2$],  [$a^2 - 2a b + b^2$], [Hiệu bình phương],
  [$(a+b)(a-b)$], [$a^2 - b^2$],        [Hiệu hai bình phương],
)
]

*Gộp ô dọc (rowspan):*

#code-block[
```typst
#table(
  columns: (auto, 1.5fr, auto),
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
  [*Môn học*], [*Nội dung*], [*Tín chỉ*],
  table.cell(rowspan: 2)[Toán], [Giải tích 1],       [3],
                                [Đại số tuyến tính], [3],
  table.cell(rowspan: 2)[Lý],   [Cơ học đại cương],  [2],
                                [Nhiệt học],          [2],
)
```
]
#align(center)[
#table(
  columns: (auto, 1.5fr, auto),
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
  [*Môn học*], [*Nội dung*], [*Tín chỉ*],
  table.cell(rowspan: 2)[Toán], [Giải tích 1],       [3],
                                [Đại số tuyến tính], [3],
  table.cell(rowspan: 2)[Lý],   [Cơ học đại cương],  [2],
                                [Nhiệt học],          [2],
)
]

#chu-y[
  Khi dùng `rowspan`, các ô bị chiếm bởi cell đó *không cần khai báo lại*.
  Typst tự động điền ô tiếp theo vào cột kế bên.
]

=== Bảng màu xen kẽ

Bảng màu xen kẽ giúp người đọc dễ theo dõi từng hàng khi bảng có nhiều dữ liệu.
Dùng `calc.odd(row)` để tô màu các hàng lẻ:

#code-block[
```typst
#table(
  columns: (2fr, 1fr, 1fr),
  stroke: 0.5pt,
  fill: (_, row) => {
    if row == 0 { rgb("#d5e8f3") }
    else if calc.odd(row) { rgb("#eaf4fb") }
    else { white }
  },
  table.header([*Công thức*], [*Tên gọi*], [*Lĩnh vực*]),
  [$a^2 + b^2 = c^2$],       [Pytago],              [Hình học],
  [$S = pi r^2$],             [Diện tích hình tròn], [Hình học],
  [$(a+b)^2 = a^2 + 2 a b + b^2$], [Hằng đẳng thức],      [Đại số],
  [$e^(i pi) + 1 = 0$],           [Euler],               [Giải tích],
  [$sin^2 x + cos^2 x = 1$],      [Pytago lượng giác],   [Lượng giác],
)
```
]
#table(
  columns: (2fr, 1fr, 1fr),
  stroke: 0.5pt,
  fill: (_, row) => {
    if row == 0 { rgb("#d5e8f3") }
    else if calc.odd(row) { rgb("#eaf4fb") }
    else { white }
  },
  table.header([*Công thức*], [*Tên gọi*], [*Lĩnh vực*]),
  [$a^2 + b^2 = c^2$],       [Pytago],              [Hình học],
  [$S = pi r^2$],             [Diện tích hình tròn], [Hình học],
  [$(a+b)^2 = a^2 + 2 a b + b^2$], [Hằng đẳng thức],      [Đại số],
  [$e^(i pi) + 1 = 0$],           [Euler],               [Giải tích],
  [$sin^2 x + cos^2 x = 1$],      [Pytago lượng giác],   [Lượng giác],
)

=== Bảng căn chỉnh nội dung cột

Tham số `align` nhận một mảng để căn chỉnh từng cột riêng: `left`, `center`, hoặc `right`.
Cột số liệu nên căn phải để dễ so sánh giá trị:

#code-block[
```typst
#table(
  columns: (2fr, 1fr, 1fr),
  align: (left, center, right),
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
  table.header([*Biểu thức*], [*Loại*], [*Giá trị gần đúng*]),
  [$sin(pi / 6)$],           [Lượng giác], [0.5000],
  [$log_10 1000$],           [Logarit],    [3.0000],
  [$integral_0^1 x dif x$], [Tích phân],  [0.5000],
  [$lim_(n->oo)(1+1/n)^n$], [Giới hạn],   [2.7183],
)
```
]
#align(center)[
#table(
  columns: (2fr, 1fr, 1fr),
  align: (left, center, right),
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
  table.header([*Biểu thức*], [*Loại*], [*Giá trị gần đúng*]),
  [$sin(pi / 6)$],           [Lượng giác], [0.5000],
  [$log_10 1000$],           [Logarit],    [3.0000],
  [$integral_0^1 x dif x$], [Tích phân],  [0.5000],
  [$lim_(n->oo)(1+1/n)^n$], [Giới hạn],   [2.7183],
)
]

=== Bảng kiểu học thuật (Booktabs)

Trong bài báo và luận văn khoa học, bảng thường chỉ có đường kẻ ngang — không có
viền dọc. Dùng `stroke: none` kết hợp `table.hline()`:

#code-block[
```typst
#figure(
  table(
    columns: (2fr, 1fr, 1fr),
    stroke: none,
    table.hline(stroke: 1pt),
    table.header([*Thuật toán*], [*Thời gian*], [*Bộ nhớ*]),
    table.hline(stroke: 0.5pt),
    [Sắp xếp nổi bọt], [$O(n^2)$],     [$O(1)$],
    [Sắp xếp trộn],    [$O(n log n)$], [$O(n)$],
    [Sắp xếp nhanh],   [$O(n log n)$], [$O(log n)$],
    [Sắp xếp đếm],     [$O(n + k)$],   [$O(k)$],
    table.hline(stroke: 1pt),
  ),
  caption: [So sánh độ phức tạp các thuật toán sắp xếp],
)
```
]
#figure(
  table(
    columns: (2fr, 1fr, 1fr),
    stroke: none,
    table.hline(stroke: 1pt),
    table.header([*Thuật toán*], [*Thời gian*], [*Bộ nhớ*]),
    table.hline(stroke: 0.5pt),
    [Sắp xếp nổi bọt], [$O(n^2)$],     [$O(1)$],
    [Sắp xếp trộn],    [$O(n log n)$], [$O(n)$],
    [Sắp xếp nhanh],   [$O(n log n)$], [$O(log n)$],
    [Sắp xếp đếm],     [$O(n + k)$],   [$O(k)$],
    table.hline(stroke: 1pt),
  ),
  caption: [So sánh độ phức tạp các thuật toán sắp xếp],
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
  - `#table(...)` tạo bảng nhiều dạng: có tiêu đề cố định, gộp ô, màu xen kẽ, căn chỉnh cột, kiểu học thuật
  - `#figure(image(...), caption: ...)` cho hình ảnh chuyên nghiệp
  - `<label>` và `@label` cho tham chiếu chéo tự động
]

#pagebreak()
