#import "../assets/style.typ": *

== Trình bày lời giải chuẩn

=== Cấu trúc lời giải Toán

Một lời giải Toán tốt thường tuân theo cấu trúc 4 phần, được phát triển từ
phương pháp luận của nhà Toán học Hungary *George Pólya* (1887–1985)
trong tác phẩm kinh điển "How to Solve It" (1945):

1. *Đầu bài* — tóm tắt hoặc trích dẫn lại đề bài
2. *Phân tích* — xác định hướng giải, công thức cần dùng, điều kiện
3. *Giải* — trình bày tuần tự các bước tính toán, biến đổi
4. *Kết luận* — đưa ra đáp số cuối cùng, kiểm tra điều kiện

=== Ví dụ mẫu: Giải phương trình bậc hai

*Đề bài.* Giải phương trình $x^2 - 5x + 6 = 0$.

*Phân tích.* Đây là phương trình bậc hai dạng $a x^2 + b x + c = 0$
với $a = 1$, $b = -5$, $c = 6$. Dùng công thức nghiệm.

*Giải.*

Tính biệt thức:

$ Delta = b^2 - 4 a c = (-5)^2 - 4 dot 1 dot 6 = 25 - 24 = 1 > 0 $

Phương trình có hai nghiệm phân biệt:

$ x_1 = frac(-b + sqrt(Delta), 2a) = frac(5 + 1, 2) = 3 $

$ x_2 = frac(-b - sqrt(Delta), 2a) = frac(5 - 1, 2) = 2 $

*Kết luận.* Phương trình có hai nghiệm: $x_1 = 3$, $x_2 = 2$.

=== Ví dụ hoàn chỉnh: Tích phân từng phần

*Đề bài.* Tính $I = integral_0^(pi/2) x sin x dif x$.

*Phân tích.* Hàm dưới dấu tích phân là tích của đa thức ($x$) và
lượng giác ($sin x$). Áp dụng công thức tích phân từng phần:

$ integral u dif v = u v - integral v dif u $

*Giải.*

#columns(2)[
  Bước 1 — Đặt ẩn:

  $&
    u = x        &=> dif u = dif x \
    dif v = sin x dif x  &=> v = -cos x
  $

  Bước 2 — Áp dụng công thức:

  $ I = [-x cos x]_0^(pi/2) + integral_0^(pi/2) cos x dif x $

  Bước 3 — Tính:

  $ [-x cos x]_0^(pi/2) = -frac(pi, 2) dot 0 - (-0 dot 1) = 0 $

  $ integral_0^(pi/2) cos x dif x = [sin x]_0^(pi/2) = 1 - 0 = 1 $
]

*Kết luận.* $I = 0 + 1 = 1$.

=== Layout lời giải hai cột

Layout 2 cột *phân tích — giải* rất hiệu quả cho lời giải Toán:

#code-block[
```typst
#columns(2)[
  *Phân tích.*
  - Dạng: $0/0$
  - Dùng khai triển Taylor của $e^x$
  - Hoặc dùng quy tắc L'Hôpital

  *Giải.*
  $ lim_(x -> 0) (e^x - 1)/x $
  $ = lim_(x -> 0) (1 + x + x^2/2! + dots - 1)/x $
  $ = lim_(x -> 0) (1 + frac(x, 2) + dots) = 1 $
]
```
]

=== Công cụ pinit — Chú thích từng phần công thức

Gói `pinit` (của *OrangeX4*) cho phép bạn thêm mũi tên chú thích
vào từng phần của công thức — rất hữu ích khi giảng dạy:

#code-block[
```typst
#import "@preview/pinit:0.2.2": *

$
  pinit-highlight(
    x_(1,2) = frac(
      pinit-highlight(-b, label: [Hệ số $b$]),
      ± pinit-highlight(
        sqrt(b^2 - 4ac),
        label: [Biệt thức $Delta$],
      ),
      2a,
    ),
  )
$
```
]

Ứng dụng pinit trong giảng dạy:
- Chỉ ra từng phần của công thức và giải thích ý nghĩa
- Làm nổi bật các bước biến đổi
- Tạo "sơ đồ tư duy" ngay trên công thức

=== Bài tập thực hành (Lời giải)

*Bài 1.* Trình bày lời giải chi tiết bài toán: Tính $integral_1^e x^2 ln x dif x$.
Tuân thủ cấu trúc 4 phần (Đầu bài → Phân tích → Giải → Kết luận).

*Bài 2.* Dùng layout 2 cột để trình bày đồng thời lời giải bằng *phương pháp đổi biến*
và *phương pháp từng phần* cho cùng một bài tích phân. So sánh hai cách.

*Bài 3.* Dùng pinit để chú thích từng bước trong công thức nghiệm phương trình bậc hai,
giải thích vai trò của $Delta$, $sqrt(Delta)$, và dấu $±$.

*Bài 4.* Trình bày lời giải bài hình học không gian: "Tính khoảng cách từ điểm đến
mặt phẳng". Kèm theo hình vẽ minh họa bằng cetz.

#pagebreak()
