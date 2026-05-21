#import "../assets/style.typ": *

== Công thức Toán inline

Đây là phần cốt lõi của Typst dành cho giảng dạy Toán. Typst thừa hưởng hệ thống
công thức từ LaTeX — nghĩa là nếu bạn đã biết LaTeX math, phần lớn sẽ quen thuộc.
Nếu chưa biết, đừng lo — cú pháp Typst trực quan hơn LaTeX và dễ nhớ hơn nhiều.

#ghi-nho[
  *Quy tắc vàng về dấu `$` trong Typst:*
  - Inline (cùng dòng văn bản): `$biểu_thức$` — dấu `$` *sát* nội dung
  - Block (dòng riêng, căn giữa): `$ biểu_thức $` — có *khoảng trắng* sau `$` đầu và trước `$` cuối
]

=== Cú pháp cơ bản

#code-preview(
  ```typst
// Công thức inline: nằm trong dòng văn bản
Định lý Pythagoras: $a^2 + b^2 = c^2$

// Công thức block: nằm trên dòng riêng
$ a^2 + b^2 = c^2 $
  ```,
  [
    Định lý Pythagoras: $a^2 + b^2 = c^2$

    $ a^2 + b^2 = c^2 $
  ]
)

=== Số mũ, chỉ số và kết hợp

#code-preview(
  ```typst
$x^2$         // số mũ (superscript)
$x_1$         // chỉ số dưới (subscript)
$x_i^n$       // kết hợp cả hai
$a_(i j)$     // chỉ số dưới nhiều ký tự (cần ngoặc)
$x^(n+1)$     // số mũ là biểu thức (cần ngoặc)
  ```,
  [
    $x^2$, $x_1$, $x_i^n$, $a_(i j)$, $x^(n+1)$
  ]
)

#chu-y[
  Khi số mũ hoặc chỉ số dưới có nhiều hơn một ký tự, *phải dùng ngoặc đơn* `()`.
  Ví dụ: `$x^(n+1)$` cho $x^(n+1)$, chứ không phải `$x^n+1$` (sẽ cho $x^n + 1$).
]

=== Phân số

Typst có hai cú pháp viết phân số với kết quả hiển thị khác nhau:

#code-preview(
  ```typst
Phân số nhỏ gọn: $a/b$
Phân số đầy đủ: $frac(a, b)$
Phân số phức tạp: $frac(a^2 + b^2, 2 a b)$
  ```,
  [
    Phân số nhỏ gọn: $a/b$ (dùng khi inline)

    Phân số đầy đủ: $frac(a, b)$ (dùng khi block)

    Phân số phức tạp: $frac(a^2 + b^2, 2 a b)$
  ]
)

#ghi-nho[
  Trong công thức block, nên dùng `frac(tử, mẫu)` để phân số hiển thị đầy đủ.
  Trong văn bản inline, có thể dùng `a/b` để phân số gọn hơn.
]

=== Căn thức

#code-preview(
  ```typst
$sqrt(x)$              // căn bậc hai
$root(3, x)$           // căn bậc ba
$root(n, x)$           // căn bậc n tổng quát
$sqrt(a^2 + b^2)$      // căn của biểu thức phức tạp
  ```,
  [
    $sqrt(x)$, $root(3, x)$, $root(n, x)$, $sqrt(a^2 + b^2)$
  ]
)

=== Ký hiệu Hy Lạp

Bảng chữ cái Hy Lạp là nền tảng của ký hiệu Toán học và Vật lý.
Trong Typst, bạn gõ tên chữ cái bằng tiếng Anh:

#code-preview(
  ```typst
// Chữ thường
$alpha, beta, gamma, delta, epsilon, zeta$
$eta, theta, lambda, mu, nu, xi, pi$
$rho, sigma, tau, phi, chi, psi, omega$

// Chữ in hoa (viết hoa chữ đầu)
$Gamma, Delta, Theta, Lambda, Pi, Sigma, Phi, Omega$
  ```,
  [
    *Chữ thường:*
    $alpha, beta, gamma, delta, epsilon, zeta$,
    $eta, theta, lambda, mu, nu, xi, pi$,
    $rho, sigma, tau, phi, chi, psi, omega$

    *Chữ in hoa:*
    $Gamma, Delta, Theta, Lambda, Pi, Sigma, Phi, Omega$
  ]
)

=== Dấu ngoặc tự co giãn

Dùng `lr()` để ngoặc tự điều chỉnh kích thước theo nội dung bên trong.
Đây là kỹ thuật quan trọng giúp công thức luôn đẹp và dễ đọc:

#code-preview(
  ```typst
// So sánh: có và không có lr()
$(frac(1, 2))$           // ngoặc tĩnh (thường quá nhỏ)
$lr((frac(1, 2)))$       // ngoặc co giãn (đúng kích thước)

$lr([x + y]^2)$          // ngoặc vuông co giãn
$lr({x: x > 0})$         // ngoặc nhọn co giãn
$lr(|x - a|)$            // trị tuyệt đối
  ```,
  [
    Không co giãn: $(frac(1, 2))$

    Có co giãn: $lr((frac(1, 2)))$

    Ngoặc vuông: $lr([x + y]^2)$

    Trị tuyệt đối: $lr(|x - a|)$
  ]
)

=== Ví dụ tổng hợp: 10 công thức Toán THPT thường gặp

Dưới đây là 10 công thức Toán học phổ thông được viết bằng Typst,
bao phủ các chủ đề Đại số, Lượng giác, Hình học và Giải tích.
Hãy gõ thử từng công thức để luyện tập:

#code-block[
```typst
$ (a + b)^2 = a^2 + 2 a b + b^2 $
$ sin^2 x + cos^2 x = 1 $
$ S = pi R^2 $
$ V_"nón" = frac(1, 3) pi R^2 h $
$ log_a (b c) = log_a b + log_a c $
$ f'(x) = lim_(h -> 0) frac(f(x + h) - f(x), h) $
$ P(A union B) = P(A) + P(B) - P(A inter B) $
$ C_n^k = frac(n!, k!(n - k)!) $
$ u_n = u_1 + (n - 1) d $
$ a^2 = b^2 + c^2 - 2 b c cos A $
```
]

*Kết quả biên dịch:*

$ (a + b)^2 = a^2 + 2 a b + b^2 $
$ sin^2 x + cos^2 x = 1 $
$ S = pi R^2 $
$ V_"nón" = frac(1, 3) pi R^2 h $
$ log_a (b c) = log_a b + log_a c $
$ f'(x) = lim_(h -> 0) frac(f(x + h) - f(x), h) $
$ P(A union B) = P(A) + P(B) - P(A inter B) $
$ C_n^k = frac(n!, k!(n - k)!) $
$ u_n = u_1 + (n - 1) d $
$ a^2 = b^2 + c^2 - 2 b c cos A $

=== Bài tập thực hành

*Bài 1.* Viết bằng Typst 5 công thức Toán khác thuộc chương trình THPT chưa xuất hiện
trong danh sách trên. Yêu cầu: sử dụng ít nhất 3 ký hiệu Hy Lạp và 2 loại dấu ngoặc `lr`.

*Bài 2.* So sánh kết quả hiển thị giữa `$a/b$`, `$frac(a,b)$` và `$ frac(a,b) $`
(inline vs block). Mô tả sự khác biệt bạn quan sát thấy.

*Bài 3.* Viết công thức tổng quát:
$sum_(k=1)^n k = frac(n(n+1), 2)$ và $sum_(k=1)^n k^2 = frac(n(n+1)(2n+1), 6)$
bằng Typst rồi biên dịch để kiểm tra.

#pagebreak()
