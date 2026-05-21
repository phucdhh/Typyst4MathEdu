#import "../assets/style.typ": *

== Công thức Toán block và đánh số

Công thức Toán block — hay còn gọi là *display math* — là những công thức được
trình bày trên dòng riêng, căn giữa trang. Đây là kiểu trình bày chuẩn cho các
công thức quan trọng, định lý, và các bước lời giải cần hiển thị rõ ràng.

=== Công thức block (display math)

Quy tắc đơn giản: thêm khoảng trắng sau `$` đầu và trước `$` cuối:

#code-preview(
  ```typst
Công thức inline: $a^2 + b^2 = c^2$ (không có khoảng trắng)

Công thức block:
$ a^2 + b^2 = c^2 $ (có khoảng trắng)
  ```,
  [
    Công thức inline: $a^2 + b^2 = c^2$ (nằm trong dòng văn bản)

    Công thức block:
    $ a^2 + b^2 = c^2 $
  ]
)

=== Đánh số công thức tự động

Trong văn bản học thuật, công thức thường được đánh số để dễ tham chiếu.
Typst đánh số tự động bằng `#set math.equation(numbering: ...)`:

#code-block[
```typst
#set math.equation(numbering: "(1)")

Công thức Pythagoras:
$ a^2 + b^2 = c^2 $ <eq:pythagoras>

Nhắc lại phương trình @eq:pythagoras ở trên...
```
]

Các kiểu đánh số phổ biến:
- `"(1)"` → (1), (2), (3)...
- `"1"` → 1, 2, 3...
- `"1.1"` → 1.1, 1.2... (bao gồm số chương)
- `"I"` → I, II, III...

=== Căn chỉnh nhiều dòng công thức

Khi trình bày chuỗi biến đổi Toán học (thường gặp trong lời giải),
dùng `&` để xác định điểm căn chỉnh và `\` để xuống dòng:

#code-preview(
  ```typst
$
  (x + y)^2 &= x^2 + 2 x y + y^2 \
  (x - y)^2 &= x^2 - 2 x y + y^2 \
  x^2 - y^2  &= (x - y)(x + y)
$
  ```,
  [
    $
      (x + y)^2 &= x^2 + 2 x y + y^2 \
      (x - y)^2 &= x^2 - 2 x y + y^2 \
      x^2 - y^2  &= (x - y)(x + y)
    $
  ]
)

Tất cả các dấu `=` được căn thẳng hàng theo chiều dọc — đây là cách trình bày
chuẩn mực trong tài liệu Toán học và giáo trình.

=== Ví dụ: Chứng minh công thức nghiệm phương trình bậc hai

Dưới đây là một ví dụ thực tế cho thấy cách trình bày lời giải/chứng minh
đẹp và chuyên nghiệp bằng Typst. Đây là kỹ năng cực kỳ hữu ích khi soạn
đề thi có lời giải chi tiết:

#vi-du[
  *Định lý.* Phương trình $a x^2 + b x + c = 0$ ($a != 0$) có nghiệm:
  $ x_(1,2) = frac(-b plus.minus sqrt(b^2 - 4 a c), 2 a) $

  *Chứng minh.* Chia hai vế cho $a$ và hoàn thành bình phương:

  $
    x^2 + frac(b, a) x + frac(c, a) &= 0 \
    lr((x + frac(b, 2a)))^2 &= frac(b^2 - 4 a c, 4 a^2) \
    x + frac(b, 2a) &= plus.minus frac(sqrt(b^2 - 4 a c), 2a) \
    x_(1,2) &= frac(-b plus.minus sqrt(b^2 - 4 a c), 2a) quad square
  $
]

#code-block[
```typst
*Chứng minh.* Chia hai vế cho $a$ và hoàn thành bình phương:

$
  x^2 + frac(b, a) x + frac(c, a) &= 0 \
  lr((x + frac(b, 2a)))^2 &= frac(b^2 - 4 a c, 4 a^2) \
  x + frac(b, 2a) &= plus.minus frac(sqrt(b^2 - 4 a c), 2a) \
  x_(1,2) &= frac(-b plus.minus sqrt(b^2 - 4 a c), 2a) quad square
$
```
]

=== Ví dụ: Trình bày bài toán Giải tích

#vi-du[
  *Tính giới hạn* $L = lim_(x -> 0) frac(e^x - 1, x)$.

  *Giải.* Dùng khai triển Taylor của $e^x$ tại $x = 0$:
  $ e^x = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + dots $

  Do đó:
  $
    frac(e^x - 1, x) &= frac(x + frac(x^2, 2) + frac(x^3, 6) + dots, x) \
                      &= 1 + frac(x, 2) + frac(x^2, 6) + dots
  $

  Lấy giới hạn: $L = lim_(x -> 0) lr((1 + frac(x, 2) + dots)) = 1$.
]

== Trang, cột và bố cục cơ bản

=== Thiết lập trang (Page Setup)

Bố cục trang được kiểm soát hoàn toàn bằng `#set page(...)`. Đây thường là
lệnh đặt ở đầu file, thiết lập một lần cho toàn bộ tài liệu:

#code-block[
```typst
#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,    // lề trái rộng hơn (gáy sách)
    right: 2cm,
  ),
  header: align(right)[Tên tài liệu],
  footer: align(center)[#counter(page).display()],
  numbering: "1",
)
```
]

Các khổ giấy phổ biến:

#figure(
  table(
    columns: (1fr, 1fr, 1.5fr),
    stroke: 0.5pt,
    fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
    table.header([*Khổ giấy*], [*Kích thước*], [*Ứng dụng thường gặp*]),
    [A4], [210 × 297 mm], [Đề thi, báo cáo, giáo trình],
    [A5], [148 × 210 mm], [Sách nhỏ, tài liệu phát tay],
    [B5], [176 × 250 mm], [Sách giáo khoa, luận văn],
    [Letter], [215.9 × 279.4 mm], [Tài liệu quốc tế (Mỹ)],
  ),
  caption: [Các khổ giấy thường dùng trong tài liệu Toán học],
)

=== Chia cột

`#columns(n)[...]` chia nội dung thành $n$ cột — rất hữu ích cho đề thi
trắc nghiệm hoặc khi muốn bố cục tạp chí:

#code-preview(
  ```typst
#columns(2)[
  *Cột trái:* Bên này có thể để phần bài toán,
  mô tả đề bài và các điều kiện.

  *Cột phải:* Bên này để hình vẽ hoặc bảng
  số liệu tương ứng với bài toán.
]
  ```,
  [
    #columns(2)[
      *Cột trái:* Bên này có thể để phần bài toán, mô tả đề bài và các điều kiện.

      *Cột phải:* Bên này để hình vẽ hoặc bảng số liệu tương ứng với bài toán.
    ]
  ]
)

=== Ngắt trang thủ công

Dùng `#pagebreak()` để chèn ngắt trang tại bất kỳ vị trí nào:

#code-block[
```typst
#pagebreak()            // ngắt trang ngay tại đây
#pagebreak(weak: true)  // chỉ ngắt nếu cần (tránh trang trắng)
```
]

== Bài tập Chương 2

*Bài 1.* Tạo một tài liệu hoàn chỉnh gồm: tiêu đề "Báo cáo Toán học",
3 mục con với tiêu đề cấp 2, mỗi mục có 1-2 đoạn văn tiếng Việt,
một bảng so sánh 4 hàng 3 cột, và ít nhất 3 công thức inline + 2 công thức block.

*Bài 2.* Soạn 1 trang A4 về "Các hằng đẳng thức đáng nhớ", trình bày
7 hằng đẳng thức dưới dạng công thức block có căn chỉnh `&`.

*Bài 3.* Viết chứng minh đầy đủ của bất đẳng thức Cauchy-Schwarz cho 2 số:
$frac(x + y, 2) >= sqrt(x y)$ với $x, y >= 0$.

#ghi-nho[
  *Tóm tắt Chương 2:*
  - `$biểu_thức$` → inline; `$ biểu_thức $` → block (căn giữa)
  - `frac(a, b)` → phân số đầy đủ; `sqrt(x)` → căn thức
  - `lr(())` → ngoặc tự co giãn
  - `&` và `\` → căn chỉnh nhiều dòng công thức
  - `#set page(...)` → thiết lập khổ giấy, lề, header/footer
  - `#columns(n)[...]` → chia cột nội dung
]

#pagebreak()
