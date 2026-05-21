#import "../assets/style.typ": *

= Chương 3: SOẠN CÔNG THỨC TOÁN NÂNG CAO

Chương này đưa bạn từ cú pháp cơ bản của Typst vào thế giới Toán học thực sự: ma trận, hệ phương trình, giới hạn, đạo hàm, tích phân,
hình học và xác suất thống kê. Đây là những cấu trúc mà giáo viên Toán
và sinh viên sẽ dùng hàng ngày khi soạn đề, lời giải và giáo trình.

#ghi-nho[
  *Mục tiêu chương:* Soạn thảo thành thạo các cấu trúc Toán học từ
  THPT đến Đại học: ma trận, định thức, hệ phương trình, giới hạn,
  đạo hàm, tích phân, hình học và xác suất thống kê.
]

== Đại số tuyến tính

Đại số tuyến tính là nền tảng của nhiều ngành khoa học hiện đại — từ
học máy (machine learning) đến giải tích số, từ mã hóa đến đồ họa máy tính.
Phần này trình bày cách soạn thảo các cấu trúc Đại số tuyến tính bằng Typst.

=== Ma trận — Cú pháp cơ bản

Ma trận được tạo bằng hàm `mat()`, trong đó dấu phẩy phân tách các phần tử
trong một hàng, và dấu chấm phẩy `;` phân tách các hàng:

#code-preview(
  ```typst
$ A = mat(1, 2; 3, 4) $

$ B = mat(1, 2, 3; 4, 5, 6; 7, 8, 9) $
  ```,
  [
    $ A = mat(1, 2; 3, 4) $

    $ B = mat(1, 2, 3; 4, 5, 6; 7, 8, 9) $
  ]
)

=== Delimiter — thay đổi ngoặc bao ma trận

Tùy theo ngữ cảnh, bạn có thể thay đổi loại ngoặc bao quanh ma trận:

#code-preview(
  ```typst
$mat(delim: "[", 1, 2; 3, 4)$   // ngoặc vuông
$mat(delim: "{", 1, 2; 3, 4)$   // ngoặc nhọn
$mat(delim: "|", 1, 2; 3, 4)$   // trị tuyệt đối (định thức)
  ```,
  [
    $mat(delim: "[", 1, 2; 3, 4)$   (ngoặc vuông — phổ biến nhất)

    $mat(delim: "{", 1, 2; 3, 4)$   (ngoặc nhọn)

    $mat(delim: "|", 1, 2; 3, 4)$   (ký hiệu định thức)
  ]
)

=== Ma trận cỡ lớn

Với ma trận cỡ lớn, dùng các loại chấm lược để biểu diễn
các phần tử không viết ra:

#code-preview(
  ```typst
$ A = mat(
  a_(1 1), a_(1 2), dots, a_(1 n);
  a_(2 1), a_(2 2), dots, a_(2 n);
  dots.v, dots.v, dots.c, dots.v;
  a_(m 1), a_(m 2), dots, a_(m n)
) $
  ```,
  [
    $ A = mat(
      a_(1 1), a_(1 2), dots, a_(1 n);
      a_(2 1), a_(2 2), dots, a_(2 n);
      dots.v, dots.v, dots.c, dots.v;
      a_(m 1), a_(m 2), dots, a_(m n)
    ) $
  ]
)

=== Ma trận đặc biệt

#code-preview(
  ```typst
// Ma trận đơn vị cấp 3
$ I_3 = mat(1, 0, 0; 0, 1, 0; 0, 0, 1) $

// Ma trận không
$ O_(2 times 3) = mat(0, 0, 0; 0, 0, 0) $
  ```,
  [
    $ I_3 = mat(1, 0, 0; 0, 1, 0; 0, 0, 1) $

    $ O_(2 times 3) = mat(0, 0, 0; 0, 0, 0) $
  ]
)

=== Định thức

Định thức của ma trận vuông được ký hiệu bằng `|...|` (dấu gạch đứng hai bên):

#code-preview(
  ```typst
$ det(A) = |mat(delim: "|", 1, 2; 3, 4)|
         = 1 dot 4 - 2 dot 3 = -2 $
  ```,
  [
    $ det(A) = mat(delim: "|", 1, 2; 3, 4) = 1 dot 4 - 2 dot 3 = -2 $
  ]
)

=== Hệ phương trình tuyến tính

Dùng `cases()` để trình bày hệ phương trình gọn gàng và chuẩn mực:

#code-preview(
  ```typst
$
  cases(
    2x + 3y - z = 1,
    x - y + 2z = -1,
    3x + 2y + z = 4,
  )
$
  ```,
  [
    $
      cases(
        2x + 3y - z = 1,
        x - y + 2z = -1,
        3x + 2y + z = 4,
      )
    $
  ]
)

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
