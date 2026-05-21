#import "../assets/style.typ": *

== Công thức Toán block và đánh số

=== Công thức block (display math)

Khi bạn muốn công thức Toán nổi bật trên một dòng riêng, hãy dùng
cú pháp *display math* (còn gọi là *block math*):

#code-block[
```typst
$ a^2 + b^2 = c^2 $
```
]

$ a^2 + b^2 = c^2 $

Công thức block tự động được căn giữa, xuất hiện trên dòng riêng,
và có thể được đánh số tự động. Điều này rất quan trọng khi viết
các tài liệu Toán học chuyên nghiệp, nơi bạn cần tham chiếu đến
công thức từ các phần khác trong văn bản.

=== Đánh số công thức tự động

Để đánh số công thức, Typst cung cấp `#set math.equation(numbering: ...)`:

#code-block[
```typst
#set math.equation(numbering: "(1)")

$ a^2 + b^2 = c^2 $ <eq:pythagorean>
```
]

Với thiết lập này, tất cả công thức block trong tài liệu sẽ được
đánh số tự động theo định dạng `(1)`, `(2)`, ...

Bạn có thể chọn nhiều kiểu đánh số:
- `"(1)"` — số trong ngoặc đơn
- `"1"` — số đơn thuần
- `"1.1"` — bao gồm số chương
- `"I"` — số La Mã

Ngoài ra, gói `equate` từ Typst Universe cung cấp thêm tùy chọn
đánh số linh hoạt hơn (tham khảo Chương 5).

=== Căn chỉnh nhiều dòng công thức

Khi cần trình bày một chuỗi biến đổi, bạn dùng `&` để xác định
vị trí căn chỉnh và `\` để xuống dòng:

#code-block[
```typst
$ &
  (x + y)^2 &= x^2 + 2 x y + y^2 \
  (x - y)^2 &= x^2 - 2 x y + y^2 \
  x^2 - y^2  &= (x - y)(x + y)
$
```
]

$ &
  (x + y)^2 &= x^2 + 2 x y + y^2 \
  (x - y)^2 &= x^2 - 2 x y + y^2 \
  x^2 - y^2  &= (x - y)(x + y)
$

Kỹ thuật này đặc biệt hữu ích khi trình bày lời giải Toán, nơi bạn
cần biến đổi qua nhiều bước có căn chỉnh.

=== Ví dụ: Chứng minh công thức nghiệm phương trình bậc hai

Dưới đây là một chứng minh đầy đủ, trình bày chuyên nghiệp với Typst:

*Định lý.* Phương trình $a x^2 + b x + c = 0$ với $a != 0$ có nghiệm:

$ x_(1,2) = frac(-b ± sqrt(b^2 - 4 a c), 2 a) $

*Chứng minh.*

Bước 1: Chia hai vế cho $a$:

$ x^2 + frac(b, a) x + frac(c, a) = 0 $

Bước 2: Thêm và bớt $frac(b^2, 4a^2)$ để tạo bình phương đúng:

$ &
  x^2 + frac(b, a) x + frac(b^2, 4a^2) - frac(b^2, 4a^2) + frac(c, a) &= 0 \
  lr((x + frac(b, 2a))^2) - frac(b^2 - 4a c, 4a^2) &= 0 \
$

Bước 3: Chuyển vế và khai căn:

$ lr((x + frac(b, 2a))^2) = frac(b^2 - 4a c, 4a^2) $

$ x + frac(b, 2a) = ± frac(sqrt(b^2 - 4a c), 2a) $

Bước 4: Kết luận:

$ x_(1,2) = frac(-b ± sqrt(b^2 - 4a c), 2a) quad square $

=== Ví dụ: Trình bày bài toán Giải tích

Tính giới hạn $L = lim_(x -> 0) (e^x - 1)/x$.

*Giải.*

Ta biết khai triển Taylor của $e^x$ tại $x = 0$:

$ e^x = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + dots $

Do đó:

$ &
  (e^x - 1)/x &= frac((1 + x + x^2/2 + dots) - 1, x) \
  &= frac(x + frac(x^2, 2) + dots, x) \
  &= 1 + frac(x, 2) + dots
$

Lấy giới hạn khi $x -> 0$:

$ L = lim_(x -> 0) (1 + frac(x, 2) + dots) = 1 $

== Trang, cột và bố cục cơ bản

=== Thiết lập trang (Page Setup)

Typst cho phép bạn kiểm soát toàn bộ bố cục trang thông qua `#set page(...)`:

#code-block[
```typst
#set page(
  paper: "a4",                   // khổ giấy
  margin: (                      // lề
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,                   // lề trái (gáy sách)
    right: 2cm,                  // lề phải
  ),
  header: align(right)[Tên sách],
  footer: align(center)[Trang ],
  numbering: "1",
)
```
]

Các khổ giấy thường dùng tại Việt Nam và quốc tế:

| Khổ giấy | Kích thước | Ứng dụng |
|----------|-----------|----------|
| A4 | 210 × 297 mm | Giáo trình, đề thi, báo cáo |
| A5 | 148 × 210 mm | Sách nhỏ, tài liệu phát tay |
| B5 | 176 × 250 mm | Sách giáo khoa, luận văn |
| Letter | 215.9 × 279.4 mm | Tài liệu quốc tế (Mỹ) |

=== Cấu hình cỡ chữ và font

#code-block[
```typst
#set text(
  font: "New Computer Modern",  // font chữ
  size: 12pt,                   // cỡ chữ
  lang: "vi",                   // ngôn ngữ (hyphenation)
)

#set par(
  leading: 0.65em,              // giãn dòng
  justify: true,                // căn đều hai bên
)
```
]

=== Chia cột

`#columns` cho phép chia nội dung thành nhiều cột, rất hữu ích cho
đề thi trắc nghiệm hoặc bố cục tạp chí:

#code-block[
```typst
#columns(2)[
  Nội dung cột bên trái...

  Nội dung cột bên phải...
]
```
]

#columns(2)[
  Cột trái: Phần này sẽ nằm ở bên trái.
  Rất hữu ích khi bạn muốn so sánh hai nội dung
  song song.

  Cột phải: Phần này sẽ nằm ở bên phải.
  Bạn có thể để công thức ở cột trái
  và lời giải ở cột phải.
]

=== Ngắt trang thủ công

#code-block[
```typst
#pagebreak()    // ngắt trang tại vị trí này
#pagebreak(weak: true)  // ngắt trang nếu cần
```
]

=== Header và Footer nâng cao

Bạn có thể tạo header/footer có nội dung động (ví dụ: hiển thị tên chương hiện tại):

#code-block[
```typst
#set page(
  header: context {
    let heading = query(heading).lastOrNone()
    if heading != none {
      set text(size: 8pt)
      style(heading).body  // tên chương/mục hiện tại
    }
  },
  footer: context {
    set text(size: 8pt)
    counter(page).display()  // số trang
  },
)
```
]

== Bài tập Chương 2

*Bài 1.* Tạo một tài liệu hoàn chỉnh gồm:
- Tiêu đề "Báo cáo Toán học"
- 3 mục con với tiêu đề cấp 2
- Mỗi mục có 1-2 đoạn văn tiếng Việt
- Một bảng so sánh 4 hàng, 3 cột
- Ít nhất 3 công thức inline và 2 công thức block

*Bài 2.* Soạn 1 trang tài liệu (khổ A4) về "Các hằng đẳng thức đáng nhớ",
trình bày 7 hằng đẳng thức dưới dạng công thức block có căn chỉnh.

*Bài 3.* Viết chứng minh đầy đủ của bất đẳng thức Cauchy (AM-GM)
cho 2 số không âm: $frac(x + y, 2) >= sqrt(x y)$. Sử dụng ít nhất
5 dòng biến đổi có căn chỉnh `&`.

*Bài 4.* Thiết lập bố cục trang A4 gồm: margin trên 2.5cm, dưới 2.5cm,
trái 3cm (gáy), phải 2cm; header hiển thị tên chương; footer hiển thị
số trang căn giữa.

== Tổng kết Chương 2

#ghi-nho[
  *Những điều cần nhớ:*
  - `$a^2$` cho công thức inline, `$ a^2 $` cho công thức block
  - `frac(a, b)` cho phân số, `sqrt(x)` cho căn thức
  - `lr(())` cho ngoặc tự co giãn
  - `&` và `\` để căn chỉnh nhiều dòng công thức
  - `#set page(...)` để thiết lập khổ giấy, lề, header/footer
  - `#columns(n)[...]` để chia cột
]

#pagebreak()
