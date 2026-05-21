#import "../assets/style.typ": *

== Công thức Toán inline

=== Cú pháp cơ bản

Công thức Toán trong Typst được viết giữa hai dấu `$`. Có hai chế độ:

- *Inline* (trong dòng): `$a^2 + b^2 = c^2$` — dấu `$` liền với nội dung.
  Công thức nằm cùng dòng với văn bản, kích thước nhỏ gọn.

- *Block* (độc lập): `$ a^2 + b^2 = c^2 $` — dấu `$` có khoảng trắng
  trước và sau nội dung. Công thức được căn giữa, xuống dòng riêng.

#vi-du[
  Công thức inline: Định lý Pythagoras nói rằng $a^2 + b^2 = c^2$
  trong mọi tam giác vuông. Với $a = 3$, $b = 4$, ta có $c = sqrt(9 + 16) = 5$.
]

=== Số và chữ cái trong chế độ Toán

Trong chế độ Toán, Typst tự động in nghiêng chữ cái (theo quy ước
*typography toán học* do người Pháp *Nicolas Bourbaki* phổ biến
vào thế kỷ 20) và giữ thẳng chữ số:

#code-block[
```typst
$x$           // chữ cái thường (in nghiêng)
$X$           // chữ cái in hoa (in nghiêng)
$x_1$         // chỉ số dưới (subscript)
$x^2$         // số mũ (superscript)
$x_i^n$       // kết hợp cả hai
$a_(i j)$     // chỉ số dưới nhiều ký tự
```
]

$x$, $X$, $x_1$, $x^2$, $x_i^n$, $a_(i j)$

=== Phép toán cơ bản

Typst hỗ trợ tất cả các phép toán số học và quan hệ:

+ Cộng: $a + b$
- Trừ: $a - b$
$ast$ hoặc $.$$ $: $a b$ (phép nhân ngầm, không cần ký hiệu)
/ Chia: $a / b$
= Bằng: $a = b$
!= Khác: $a != b$
<= Nhỏ hơn hoặc bằng: $a <= b$
>= Lớn hơn hoặc bằng: $a >= b$
$<<$ Nhỏ hơn rất nhiều: $a << b$
$>>$ Lớn hơn rất nhiều: $a >> b$
$=>$ Suy ra/kéo theo: $a => b$

#chu-y[
  Trong Typst, $a b$ (có khoảng trắng) được hiểu là $a$ nhân $b$.
  Nhưng $ab$ (không có khoảng trắng) bị hiểu là một biến có tên "ab",
  do đó *luôn thêm khoảng trắng giữa các biến khi muốn nhân*.
]

=== Phân số

Typst có hai cách viết phân số, cho kết quả hiển thị khác nhau:

#code-block[
```typst
$a/b$              // phân số nhỏ gọn (inline fraction)
$frac(a, b)$       // phân số đầy đủ (display fraction)
```
]

So sánh trực quan:
- Inline: $a/b$ (nhỏ, phù hợp trong dòng văn bản)
- Block: $frac(a, b)$ (lớn, phù hợp trong công thức độc lập)

=== Căn thức

#code-block[
```typst
$sqrt(x)$             // căn bậc hai
$root(3, x)$          // căn bậc ba
$root(n, x)$          // căn bậc n
$sqrt(a^2 + b^2)$     // căn của biểu thức phức tạp
```
]

$sqrt(x)$, $root(3, x)$, $root(n, x)$, $sqrt(a^2 + b^2)$

=== Ký hiệu Hy Lạp

Bảng chữ cái Hy Lạp là nền tảng của ký hiệu Toán học. Typst hỗ trợ
đầy đủ cả chữ thường và chữ in hoa:

*Chữ thường:* $alpha$, $beta$, $gamma$, $delta$, $epsilon$, $zeta$, $eta$, $theta$,
$iota$, $kappa$, $lambda$, $mu$, $nu$, $xi$, $pi$, $rho$, $sigma$, $tau$,
$upsilon$, $phi$, $chi$, $psi$, $omega$

*Chữ in hoa:* $Alpha$, $Beta$, $Gamma$, $Delta$, $Theta$, $Lambda$, $Pi$,
$Sigma$, $Phi$, $Psi$, $Omega$

#ghi-nho[
  Để có ký hiệu in hoa, *viết hoa chữ cái đầu tiên*:
  `Gamma` $arrow$ $Gamma$, `Delta` $arrow$ $Delta$.
]

=== Dấu ngoặc tự co giãn

Dùng `lr()` để ngoặc tự động điều chỉnh kích thước theo nội dung bên trong.
Đây là một trong những tính năng quan trọng nhất khi soạn công thức Toán —
nó đảm bảo ngoặc luôn "ôm trọn" biểu thức:

#code-block[
```typst
$lr((x + y)^2)$              // ngoặc tròn
$lr([x + y]^2)$              // ngoặc vuông
$lr({x + y}^2)$              // ngoặc nhọn
$lr(|x|)$                    // trị tuyệt đối
$lr(floor(x))$               // phần nguyên
$lr(angle a + b)$            // ngoặc góc
```
]

So sánh trực quan:
- Không co giãn: $(frac(1, 2))$ — ngoặc quá nhỏ
- Có co giãn: $lr((frac(1, 2)))$ — ngoặc vừa khít

#code-block[
```typst
// So sánh
$(frac(1, 2))$              // xấu
$lr((frac(1, 2)))$          // đẹp
```
]

$(frac(1, 2))$ vs $lr((frac(1, 2)))$ — sự khác biệt rõ rệt.

=== Dấu chấm lược (Ellipsis)

Typst phân biệt ba loại chấm lược, mỗi loại có hướng khác nhau:

#code-block[
```typst
$a_1, a_2, dots, a_n$        // chấm lược ngang, đáy
$a_1 + a_2 + dots.c + a_n$   // chấm lược ngang, giữa
$x_(1 1) dots.v x_(1 n)$     // chấm lược dọc
```
]

$a_1, a_2, dots, a_n$ (đáy)
$a_1 + a_2 + dots.c + a_n$ (giữa)
$x_(1 1) dots.v x_(1 n)$ (dọc)

=== Ví dụ thực hành: 10 công thức Toán THPT thường gặp

Dưới đây là 10 công thức Toán phổ thông được viết bằng Typst, bao phủ
các chủ đề Đại số, Hình học và Giải tích:

#code-block[
```typst
1. $ (a + b)^2 = a^2 + 2 a b + b^2 $
2. $ sin^2 x + cos^2 x = 1 $
3. $ S = pi R^2 $
4. $ V = frac(1, 3) pi R^2 h $
5. $ log_a (b c) = log_a b + log_a c $
6. $ f'(x) = lim_(h -> 0) frac(f(x + h) - f(x), h) $
7. $ P(A ∪ B) = P(A) + P(B) - P(A ∩ B) $
8. $ C_n^k = frac(n!, k!(n - k)!) $
9. $ u_n = u_1 + (n - 1) d $
10. $ a^2 = b^2 + c^2 - 2 b c cos A $
```
]

=== Bài tập thực hành (Công thức inline)

*Bài 1.* Viết bằng Typst 10 công thức Toán khác (ngoài 10 công thức trên)
thuộc chương trình THPT. Yêu cầu: sử dụng ít nhất 5 ký hiệu Hy Lạp,
3 loại dấu ngoặc `lr`, và 2 loại chấm lược.

*Bài 2.* So sánh kết quả hiển thị giữa `$a/b$`, `$frac(a,b)$`, và
`$ a / b $`. Chụp màn hình hoặc mô tả sự khác biệt.

*Bài 3.* Viết một bảng gồm 5 dòng, mỗi dòng là một công thức Toán
và tên gọi của nó (ví dụ: Định lý Pythagoras, Công thức Heron, ...).

#pagebreak()
