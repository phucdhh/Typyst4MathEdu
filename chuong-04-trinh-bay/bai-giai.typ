#import "../assets/style.typ": *
== Trình bày lời giải chuẩn

=== Nguyên tắc trình bày lời giải Toán

Một lời giải Toán tốt thường có cấu trúc:

1. *Đầu bài* — tóm tắt lại đề hoặc trích dẫn
2. *Phân tích* — xác định hướng giải
3. *Giải* — trình bày các bước tính toán
4. *Kết luận* — đưa ra đáp số cuối cùng

#code-block[
```typst
*Bài toán.* Giải phương trình $x^2 - 5x + 6 = 0$.

*Phân tích.* Đây là phương trình bậc hai với $a = 1$, $b = -5$, $c = 6$.

*Giải.*
$ Delta = (-5)^2 - 4 dot 1 dot 6 = 25 - 24 = 1 > 0 $
$ x_1 = frac(5 + 1, 2) = 3, quad x_2 = frac(5 - 1, 2) = 2 $

*Kết luận.* Phương trình có hai nghiệm $x = 2$ và $x = 3$.
```
]

*Đầu bài.* Giải phương trình $x^2 - 5x + 6 = 0$.

*Phân tích.* Đây là phương trình bậc hai với $a = 1$, $b = -5$, $c = 6$.

*Giải.*
$ Delta = (-5)^2 - 4 dot 1 dot 6 = 25 - 24 = 1 > 0 $
$ x_1 = frac(5 + 1, 2) = 3, quad x_2 = frac(5 - 1, 2) = 2 $

*Kết luận.* Phương trình có hai nghiệm $x = 2$ và $x = 3$.

=== Công cụ pinit — chú thích công thức

Gói `pinit` cho phép thêm chú thích dạng mũi tên vào từng phần của công thức:

#code-block[
```typst
#import "@preview/pinit:0.2.2": *

$ L = pinit-highlight(
  integral_a^b f(x) dif x,
  label: [Diện tích dưới đường cong],
) = F(b) - F(a) $
```
]

=== Layout lời giải 2 cột

#columns(2)[
  *Bước 1: Đặt ẩn*
  $ t = sqrt(x + 1) $
  $ t >= 0 $
  $ x = t^2 - 1 $

  *Bước 2: Thay vào*
  $ integral t dot 2t dif t $
  $ = 2 integral t^2 dif t $
  $ = frac(2, 3) t^3 + C $

  *Bước 3: Trả ẩn*
  $ = frac(2, 3) (x + 1)^(3/2) + C $
]

=== Ví dụ: Lời giải bài tích phân từng phần

*Đề bài.* Tính $I = integral_0^(pi/2) x sin x dif x$.

#columns(2)[
  *Phân tích.*
  Hàm $x$ (đa thức) và $sin x$ (lượng giác).
  Đặt $u = x$, $dif v = sin x dif x$.

  *Giải.*
  $ u = x => dif u = dif x $
  $ dif v = sin x dif x => v = -cos x $

  $ I = [-x cos x]_0^(pi/2) + integral_0^(pi/2) cos x dif x $
  $ = 0 + [sin x]_0^(pi/2) = 1 $
]

*Kết luận.* $I = 1$.

=== Ví dụ: Bài hình học không gian

*Đề bài.* Cho hình chóp S.ABCD có đáy là hình vuông cạnh $a$,
$"SA" perp ("ABCD")$ và $"SA" = a sqrt(3)$. Tính thể tích khối chóp.

*Phân tích.* Đây là hình chóp có đáy là hình vuông, đường cao $"SA"$.

*Giải.*
$ V = frac(1, 3) S_("ABCD") dot "SA" $
$ S_("ABCD") = a^2 $
$ "SA" = a sqrt(3) $
$ V = frac(1, 3) dot a^2 dot a sqrt(3) = frac(a^3 sqrt(3), 3) $

*Kết luận.* $V = frac(a^3 sqrt(3), 3)$ (đơn vị thể tích).

=== Bài tập thực hành

*Bài 1.* Trình bày lời giải chi tiết bài toán: Tính $integral_1^e x^2 ln x dif x$.

*Bài 2.* Dùng pinit để chú thích các bước biến đổi trong công thức nghiệm phương trình bậc hai.

*Bài 3.* Trình bày lời giải bài hình học không gian: tính khoảng cách từ điểm đến mặt phẳng,
có kèm hình vẽ minh họa.
