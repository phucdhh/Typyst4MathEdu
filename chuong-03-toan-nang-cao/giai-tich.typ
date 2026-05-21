#import "../assets/style.typ": *

== Giải tích

Giải tích (Calculus) là ngôn ngữ của thay đổi và chuyển động. Từ việc tính diện tích
hình phức tạp, tìm giá trị lớn nhất-nhỏ nhất, đến mô hình hóa sự tăng trưởng dân số
— Giải tích là công cụ không thể thiếu. Phần này trình bày cách soạn thảo
các ký hiệu Giải tích trong Typst.

=== Giới hạn (Limit)

Giới hạn là nền tảng của Giải tích. Trong Typst, dùng `lim_(x -> a)`:

#code-preview(
  ```typst
$ lim_(x -> 0) frac(sin x, x) = 1 $

$ lim_(x -> infinity) (1 + frac(1, x))^x = e $

$ lim_(x -> 0^+) frac(1, x) = +infinity $
  ```,
  [
    $ lim_(x -> 0) frac(sin x, x) = 1 $

    $ lim_(x -> infinity) (1 + frac(1, x))^x = e $

    $ lim_(x -> 0^+) frac(1, x) = +infinity $
  ]
)

=== Đạo hàm

Typst hỗ trợ tất cả các hệ thống ký hiệu đạo hàm phổ biến:

#code-preview(
  ```typst
// Ký hiệu Lagrange (prime) — phổ biến nhất ở VN
$f'(x)$, $f''(x)$, $f^((n))(x)$

// Ký hiệu Leibniz — chuẩn Toán học quốc tế
$(dif f)/(dif x)$, $(dif^2 f)/(dif x^2)$

// Đạo hàm riêng — Giải tích nhiều biến
$(partial f)/(partial x)$, $(partial^2 f)/(partial x partial y)$
  ```,
  [
    *Lagrange:* $f'(x)$, $f''(x)$, $f^((n))(x)$

    *Leibniz:* $(dif f)/(dif x)$, $(dif^2 f)/(dif x^2)$

    *Đạo hàm riêng:* $(partial f)/(partial x)$, $(partial^2 f)/(partial x partial y)$
  ]
)

#ghi-nho[
  Ký hiệu `dif` trong Typst là chữ "d" thẳng đứng (upright d), đúng theo
  tiêu chuẩn quốc tế ISO 80000 cho ký hiệu vi phân. Gõ `dif` thay vì
  chỉ gõ chữ `d` để công thức đúng chuẩn typographic.
]

=== Tích phân

#code-preview(
  ```typst
// Tích phân bất định
$ integral x^2 dif x = frac(x^3, 3) + C $

// Tích phân xác định
$ integral_0^1 x^2 dif x = frac(1, 3) $

// Tích phân kép
$ integral.double_D f(x, y) dif x dif y $

// Tích phân đường
$ integral_C P dif x + Q dif y $
  ```,
  [
    $ integral x^2 dif x = frac(x^3, 3) + C $

    $ integral_0^1 x^2 dif x = frac(1, 3) $

    $ integral.double_D f(x, y) dif x dif y $

    $ integral_C P dif x + Q dif y $
  ]
)

=== Khai triển chuỗi Taylor và MacLaurin

Chuỗi Taylor là công cụ gần đúng hàm bằng đa thức. Đây là cú pháp Typst
để trình bày khai triển chuỗi với dấu chấm lược:

#code-preview(
  ```typst
$ e^x = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + dots = sum_(n=0)^infinity frac(x^n, n!) $

$ sin x = x - frac(x^3, 3!) + frac(x^5, 5!) - dots $

$ cos x = 1 - frac(x^2, 2!) + frac(x^4, 4!) - dots $
  ```,
  [
    $ e^x = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + dots = sum_(n=0)^infinity frac(x^n, n!) $

    $ sin x = x - frac(x^3, 3!) + frac(x^5, 5!) - dots $

    $ cos x = 1 - frac(x^2, 2!) + frac(x^4, 4!) - dots $
  ]
)

=== Gradient, Divergence và Curl (Giải tích vector)

Các toán tử vi phân quan trọng trong Giải tích vector:

#code-preview(
  ```typst
// Gradient
$nabla f = (frac(partial f, partial x), frac(partial f, partial y), frac(partial f, partial z))$

// Divergence
$nabla dot bold(F) = frac(partial F_x, partial x) + frac(partial F_y, partial y) + frac(partial F_z, partial z)$

// Laplacian
$nabla^2 f = frac(partial^2 f, partial x^2) + frac(partial^2 f, partial y^2)$
  ```,
  [
    Gradient: $nabla f = (frac(partial f, partial x), frac(partial f, partial y), frac(partial f, partial z))$

    Divergence: $nabla dot bold(F) = frac(partial F_x, partial x) + frac(partial F_y, partial y) + frac(partial F_z, partial z)$

    Laplacian: $nabla^2 f = frac(partial^2 f, partial x^2) + frac(partial^2 f, partial y^2)$
  ]
)

=== Ví dụ: Tích phân từng phần

#vi-du[
  *Tính* $I = integral_0^(pi/2) x sin x dif x$.

  *Phương pháp:* Tích phân từng phần — đặt $u = x$, $dif v = sin x dif x$
  thì $dif u = dif x$, $v = -cos x$.

  $
    I &= [-x cos x]_0^(pi/2) + integral_0^(pi/2) cos x dif x \
      &= 0 + [sin x]_0^(pi/2) \
      &= 1
  $
]

=== Bài tập (Giải tích)

*Bài 1.* Tính các giới hạn và trình bày bằng Typst:
a) $lim_(x -> 0) (tan x)/x$;
b) $lim_(x -> infinity) (ln x)/x$;
c) $lim_(x -> 0) (e^(3x) - 1)/x$.

*Bài 2.* Lập bảng đạo hàm của 10 hàm số sơ cấp thường gặp (2 cột: hàm số và đạo hàm).

*Bài 3.* Tính các tích phân và trình bày chi tiết các bước:
a) $integral_0^1 x e^x dif x$;
b) $integral x^3 ln x dif x$;
c) $integral_0^pi sin^2 x dif x$.

*Bài 4.* Trình bày khai triển Taylor của $f(x) = cos x$ quanh $x = 0$ đến bậc 6.

#pagebreak()


#code-block[
```typst
// Gradient
$ nabla f = (partial f)/(partial x) arrow(i) + (partial f)/(partial y) arrow(j) $

// Divergence
$ nabla dot arrow(F) = (partial F_x)/(partial x) + (partial F_y)/(partial y) $

// Curl (xoắn)
$ nabla times arrow(F) $
```
]

=== Tích phân

Tích phân là công cụ trung tâm của Giải tích, được Leibniz giới thiệu
với ký hiệu $integral$ (chữ S kéo dài, viết tắt của "summa" — tổng).

#code-block[
```typst
// Tích phân bất định
$ integral f(x) dif x $

// Tích phân xác định
$ integral_a^b f(x) dif x $

// Tích phân suy rộng
$ integral_0^infinity e^(-x) dif x $
```
]

$ integral_a^b f(x) dif x $ — tích phân xác định (Newton-Leibniz)

=== Tích phân bội

Tích phân kép và tích phân ba:

#code-block[
```typst
// Tích phân kép
$ integral.double_D f(x,y) dif A $

// Tích phân ba
$ integral.triple_V f(x,y,z) dif V $

// Tích phân đường
$ integral_C arrow(F) dot dif arrow(r) $
```
]

$ integral.double_D f(x,y) dif A $ — tích phân kép trên miền $D$
$ integral.triple_V f(x,y,z) dif V $ — tích phân ba trên thể tích $V$

=== Lưu ý: `dif` vs `d`

Trong Typst, `dif` cho chữ $d$ đứng (roman) — đây là ký hiệu chuẩn
cho *vi phân* (differential) theo tiêu chuẩn ISO 80000-2.
Ngược lại, biến $d$ thường trong chế độ Toán sẽ in nghiêng.
Đây là chi tiết nhỏ nhưng tạo nên sự chuyên nghiệp cho tài liệu:

$integral x^2 dif x$ (dùng `dif` — đúng chuẩn)
vs
$integral x^2 d x$ (dùng `d` — không đúng chuẩn)

=== Chuỗi số và chuỗi hàm

Chuỗi Taylor (đặt theo tên *Brook Taylor*, 1685–1731) và chuỗi Maclaurin
(*Colin Maclaurin*, 1698–1746) là công cụ mạnh để xấp xỉ hàm số:

#code-block[
```typst
// Chuỗi Maclaurin của e^x
$ e^x = sum_(n=0)^infinity frac(x^n, n!) $

// Chuỗi Maclaurin của sin x
$ sin x = sum_(n=0)^infinity frac((-1)^n x^(2n+1), (2n+1)!) $

// Chuỗi hình học
$ sum_(n=0)^infinity r^n = frac(1, 1 - r), quad |r| < 1 $
```
]

$ e^x = sum_(n=0)^infinity frac(x^n, n!) $

$ sin x = sum_(n=0)^infinity frac((-1)^n x^(2n+1), (2n+1)!) $

=== Ví dụ hoàn chỉnh: Bài toán tích phân có lời giải chi tiết

*Đề bài.* Tính $ I = integral_0^(pi/2) x sin x dif x $.

*Phân tích.* Hàm dưới dấu tích phân là tích của $x$ (đa thức) và $sin x$
(lượng giác). Ta dùng phương pháp *tích phân từng phần*, được phát triển dựa trên
quy tắc đạo hàm của tích.

*Nhắc lại công thức:* $ integral u dif v = u v - integral v dif u $

*Lời giải.*

Bước 1 — Đặt ẩn:

$&
  "Đặt" u = x &=> dif u = dif x \
  dif v = sin x dif x &=> v = -cos x
$

Bước 2 — Áp dụng công thức:

$ I = [u v]_0^(pi/2) - integral_0^(pi/2) v dif u $

$ = [-x cos x]_0^(pi/2) + integral_0^(pi/2) cos x dif x $

Bước 3 — Tính từng phần:

$ [-x cos x]_0^(pi/2) = -frac(pi, 2) dot 0 - (-0 dot 1) = 0 $

$ integral_0^(pi/2) cos x dif x = [sin x]_0^(pi/2) = 1 - 0 = 1 $

Bước 4 — Kết luận:

$ I = 0 + 1 = 1 $

Vậy $I = 1$.

=== Bài tập thực hành (Giải tích)

*Bài 1.* Tính các giới hạn sau và trình bày bằng Typst:
a) $lim_(x -> 0) (tan x)/x$
b) $lim_(x -> infinity) (ln x)/x$
c) $lim_(x -> 0) (1 + x)^(1/x)$
d) $lim_(x -> 0) (e^(3x) - 1)/x$

*Bài 2.* Lập bảng đạo hàm của 10 hàm số sơ cấp thường gặp (2 cột:
hàm số và đạo hàm). Dùng ký hiệu Leibniz.

*Bài 3.* Tính các tích phân sau và trình bày chi tiết các bước biến đổi:
a) $integral_0^1 x e^x dif x$
b) $integral x^3 ln x dif x$
c) $integral_0^(pi) sin^2 x dif x$

*Bài 4.* Trình bày khai triển Taylor của $f(x) = cos x$ quanh $x = 0$
đến bậc 6. Dùng Typst để hiển thị chuỗi và số hạng dư.

*Bài 5.* Soạn một đề thi Giải tích 1 gồm 4 câu (Giới hạn, Đạo hàm,
Tích phân, Chuỗi) trình bày trên 2 trang A4.

#pagebreak()
