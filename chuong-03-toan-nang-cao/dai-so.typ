#import "../assets/style.typ": *

= Chương 3: Toán học nâng cao

#ghi-nho[
  *Mục tiêu chương:* Soạn thảo thành thạo các cấu trúc Toán học từ
  THPT đến Đại học: ma trận, định thức, hệ phương trình, giới hạn,
  đạo hàm, tích phân, hình học, và xác suất thống kê.
]

== Đại số tuyến tính

=== Ma trận — Cú pháp cơ bản

Ma trận là cấu trúc Toán học quan trọng bậc nhất trong Đại số tuyến tính.
Typst hỗ trợ ma trận với cú pháp rất trực quan thông qua hàm `mat()`:

#code-block[
```typst
$ A = mat(1, 2; 3, 4) $
```
]

$ A = mat(1, 2; 3, 4) $

Trong đó:
- Dấu phẩy `,` phân cách các phần tử trong cùng một hàng
- Dấu chấm phẩy `;` phân cách các hàng
- Ma trận được bao bởi ngoặc tròn `( )` (mặc định)

=== Delimiter — thay đổi ngoặc bao ma trận

Bạn có thể thay đổi ngoặc bao ma trận bằng tham số `delim`:

#code-block[
```typst
$ A = mat(delim: "[", 1, 2; 3, 4) $   // ngoặc vuông
$ A = mat(delim: "{", 1, 2; 3, 4) $   // ngoặc nhọn
$ A = mat(delim: "|", 1, 2; 3, 4) $   // định thức
$ A = mat(delim: "(", 1, 2; 3, 4) $   // ngoặc tròn (mặc định)
```
]

- Ngoặc vuông `[...]`: $mat(delim: "[", 1, 2; 3, 4)$
- Ngoặc nhọn `{...}`: $mat(delim: "{", 1, 2; 3, 4)$
- Trị tuyệt đối `|...|`: $mat(delim: "|", 1, 2; 3, 4)$

=== Ma trận cỡ lớn

Với ma trận cỡ lớn, bạn dùng các loại chấm lược để biểu diễn
các phần tử không viết ra:

#code-block[
```typst
$ A = mat(
  1, 0, dots, 0;
  0, 1, dots, 0;
  dots.v, dots.v, dots.c, dots.v;
  0, 0, dots, 1
) $
```
]

$ A = mat(
  1, 0, dots, 0;
  0, 1, dots, 0;
  dots.v, dots.v, dots.c, dots.v;
  0, 0, dots, 1
)$

=== Ma trận đặc biệt

*Ma trận đơn vị* cấp $n$, ký hiệu $I_n$:

$ I_3 = mat(1, 0, 0; 0, 1, 0; 0, 0, 1) $

*Ma trận không* cấp $m times n$, ký hiệu $O_(m times n)$:

$ O_2 = mat(0, 0; 0, 0) $

=== Định thức

Định thức (determinant) — khái niệm gắn liền với mỗi ma trận vuông — được
viết bằng cách dùng `delim: "|"`:

#code-block[
```typst
$ det(A) = |mat(1, 2; 3, 4)| = 1 dot 4 - 2 dot 3 = -2 $
```
]

$ det(A) = |mat(1, 2; 3, 4)| = 1 dot 4 - 2 dot 3 = -2 $

Đối với ma trận cấp 3:

$ &
  |mat(a_(1 1), a_(1 2), a_(1 3);
       a_(2 1), a_(2 2), a_(2 3);
       a_(3 1), a_(3 2), a_(3 3))| \
  = a_(1 1) a_(2 2) a_(3 3) + a_(1 2) a_(2 3) a_(3 1) + a_(1 3) a_(2 1) a_(3 2) \
  quad - a_(1 3) a_(2 2) a_(3 1) - a_(1 1) a_(2 3) a_(3 2) - a_(1 2) a_(2 1) a_(3 3)
$

=== Hệ phương trình tuyến tính

Dùng `cases()` để biểu diễn hệ phương trình một cách gọn gàng:

#code-block[
```typst
$
  cases(
    2x + 3y - z = 1,
    x - y + 2z = -1,
    3x + 2y + z = 4,
  )
$
```
]

$
  cases(
    2x + 3y - z = 1,
    x - y + 2z = -1,
    3x + 2y + z = 4,
  )
$

=== Phương pháp khử Gauss

Phương pháp Gauss (đặt tên theo nhà Toán học Đức *Carl Friedrich Gauss*,
1777–1855) là thuật toán nền tảng để giải hệ phương trình tuyến tính.
Dưới đây là cách trình bày phương pháp trên Typst:

#code-block[
```typst
$
  mat(2, 3, -1, 1; 1, -1, 2, -1; 3, 2, 1, 4)
  arrow R_2 - frac(1, 2) R_1
  mat(2, 3, -1, 1; 0, -frac(5, 2), frac(5, 2), -frac(3, 2); 3, 2, 1, 4)
$
```
]

=== Tổng (Sigma) và Tích (Pi)

Ký hiệu tổng $sum$ và tích $product$ là những ký hiệu thường gặp nhất
trong Toán học, có nguồn gốc từ chữ cái Hy Lạp *Sigma* ($Sigma$) và *Pi* ($Pi$).

*Tổng cơ bản:*

#code-block[
```typst
$ sum_(i=1)^n i = frac(n(n+1), 2) $     // tổng Gauss
$ sum_(k=1)^n k^2 = frac(n(n+1)(2n+1), 6) $ // tổng bình phương
$ sum_(i=1)^n sum_(j=1)^m a_(i j) $      // tổng kép
```
]

$ sum_(i=1)^n i = frac(n(n+1), 2) $ — công thức do Gauss tìm ra khi mới 7 tuổi.

$ sum_(k=1)^n k^2 = frac(n(n+1)(2n+1), 6) $

*Tích:*

$ product_(k=1)^n k = n! $ (giai thừa của $n$)

=== Không gian vector

Typst hỗ trợ nhiều cách biểu diễn vector:

#code-block[
```typst
$ arrow(v) = (x, y, z) $              // vector dạng mũi tên
$ bold(v) = (x, y, z) $               // vector in đậm
$ hat(u) = frac(arrow(v), |arrow(v)|) $ // vector đơn vị
```
]

$arrow(v) = (x, y, z)$

$bold(v) = (x, y, z)$

*Tích vô hướng:*

$ arrow(u) dot arrow(v) = |arrow(u)| |arrow(v)| cos theta $

*Tích có hướng (cross product):*

$ arrow(u) times arrow(v) = mat(i, j, k; u_1, u_2, u_3; v_1, v_2, v_3) $

=== Ví dụ hoàn chỉnh: Ma trận Jacobian

Ma trận Jacobian của hàm $f: RR^2 -> RR^2$, $f(x,y) = (u(x,y), v(x,y))$:

#code-block[
```typst
$
  J_f = mat(
    partial u / partial x, partial u / partial y;
    partial v / partial x, partial v / partial y
  )
$
```
]

$ J_f = mat(partial u / partial x, partial u / partial y; partial v / partial x, partial v / partial y) $

=== Bài tập thực hành (Đại số)

*Bài 1.* Viết ma trận $A$ cấp $4 times 4$ với $A_(i j) = i + j$ và tính
định thức của nó (trình bày các bước tính).

*Bài 2.* Trình bày phương pháp Gauss-Jordan để tìm ma trận nghịch đảo
của $A = mat(2, 1; 5, 3)$. Viết đầy đủ các bước biến đổi sơ cấp.

*Bài 3.* Chứng minh rằng $sum_(k=1)^n k^3 = lr((frac(n(n+1), 2))^2)$.
Trình bày bằng quy nạp Toán học với Typst.

*Bài 4.* Soạn 2 trang bài giảng về "Ma trận và các phép toán" bao gồm:
định nghĩa, ví dụ, tính chất, và bài tập.

#pagebreak()
