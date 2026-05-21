#import "../assets/style.typ": *

== Giải tích

Giải tích (Calculus), do *Isaac Newton* (1642–1727) và *Gottfried Wilhelm Leibniz*
(1646–1716) độc lập phát triển vào cuối thế kỷ 17, là một trong những thành tựu
vĩ đại nhất của Toán học. Typst hỗ trợ xuất sắc tất cả các ký hiệu Giải tích.

=== Giới hạn (Limit)

Giới hạn là khái niệm nền tảng của Giải tích, được *Augustin-Louis Cauchy*
(1789–1857) định nghĩa chặt chẽ lần đầu tiên.

#code-block[
```typst
// Giới hạn cơ bản
$ lim_(x -> 0) frac(sin x, x) = 1 $

// Giới hạn một phía
$ lim_(x -> 0^+) frac(1, x) = +infinity $
$ lim_(x -> 0^-) frac(1, x) = -infinity $

// Giới hạn vô cực
$ lim_(x -> infinity) (1 + frac(1, x))^x = e $
```
]

$ lim_(x -> 0) frac(sin x, x) = 1 $ — giới hạn lượng giác cơ bản

$ lim_(x -> infinity) (1 + frac(1, x))^x = e $ — định nghĩa Euler của hằng số $e$

=== Ký hiệu $O$ lớn và $o$ nhỏ

Trong phân tích thuật toán và Giải tích tiệm cận, ký hiệu Landau
(đặt theo tên nhà Toán học Đức *Edmund Landau*, 1877–1938) rất phổ biến:

#code-block[
```typst
$ f(n) = O(n^2) $     // O lớn (Big-O)
$ f(x) = o(h) $       // o nhỏ (little-o)
$ f(x) ~ g(x) $       // tương đương tiệm cận
```
]

=== Đạo hàm

Typst hỗ trợ cả bốn hệ thống ký hiệu đạo hàm chính, mỗi hệ thống
có nguồn gốc và ứng dụng riêng:

*1. Ký hiệu Leibniz* (`dif` — differential):

$ (dif f)/(dif x) $ — đạo hàm cấp 1 (do Leibniz đề xuất)

$ (dif^2 f)/(dif x^2) $ — đạo hàm cấp 2

Ký hiệu Leibniz đặc biệt hữu ích vì nó thể hiện rõ biến đạo hàm
và dễ mở rộng cho đạo hàm riêng.

*2. Ký hiệu Newton* — dùng dấu chấm trên đầu:

$ dot(f) $ — đạo hàm cấp 1 theo thời gian (phổ biến trong Vật lý)

$ dot(dot(f)) $ — đạo hàm cấp 2

*3. Ký hiệu Prime* (Lagrange):

$ f'(x) $ — đạo hàm cấp 1 (do *Joseph-Louis Lagrange* đề xuất)

$ f''(x) $ — đạo hàm cấp 2

$ f'''(x) $ — đạo hàm cấp 3

=== Đạo hàm riêng (Partial derivative)

Đạo hàm riêng xuất hiện trong Giải tích nhiều biến, được ký hiệu
bằng chữ `partial` ($partial$):

#code-block[
```typst
$ partial f / partial x $                       // cấp 1
$ (partial^2 f)/(partial x^2) $                 // cấp 2 thuần nhất
$ (partial^2 f)/(partial x partial y) $         // cấp 2 hỗn hợp
```
]

$ partial f / partial x $, $ (partial^2 f)/(partial x^2) $, $ (partial^2 f)/(partial x partial y) $

=== Gradient, Divergence, Curl

Ba toán tử vector quan trọng (ký hiệu Nabla $nabla$ có nguồn gốc từ
chữ Hebrew cổ):

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
