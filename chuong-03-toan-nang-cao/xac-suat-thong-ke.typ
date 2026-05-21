#import "../assets/style.typ": *
== Xác suất và Thống kê

=== Ký hiệu Xác suất

#code-block[
```typst
// Xác suất của biến cố
$ P(A) $                    // xác suất của A
$ P(A | B) $                // xác suất có điều kiện
$ P(A ∩ B) $                // xác suất giao
$ P(A ∪ B) $                // xác suất hợp

// Kỳ vọng và phương sai
$ EE[X] = sum_i x_i p_i $                   // kỳ vọng
$ "Var"(X) = EE[(X - EE[X])^2] $            // phương sai
$ sigma_X = sqrt("Var"(X)) $                // độ lệch chuẩn

// Hàm phân phối
$ F(x) = P(X <= x) $        // hàm phân phối tích lũy
$ f(x) $                    // hàm mật độ xác suất
```
]

$P(A)$ — xác suất biến cố $A$
$P(A | B)$ — xác suất $A$ với điều kiện $B$
$EE[X]$ — kỳ vọng của $X$
$"Var"(X)$ — phương sai
$sigma$ — độ lệch chuẩn

=== Công thức xác suất quan trọng

#code-block[
```typst
// Công thức cộng
$ P(A ∪ B) = P(A) + P(B) - P(A ∩ B) $

// Công thức nhân (biến cố độc lập)
$ P(A ∩ B) = P(A) P(B) $

// Công thức Bayes
$ P(A | B) = frac(P(B | A) P(A), P(B)) $

// Công thức Bernoulli
$ P(X = k) = C_n^k p^k (1-p)^(n-k) $
```
]

=== Bảng phân phối

*Phân phối chuẩn tắc Z:*

#table(
  columns: (auto, auto, auto, auto, auto),
  stroke: 0.5pt,
  [*z*], [*0.00*], [*0.01*], [*0.02*], [*0.03*],
  [0.0], [0.5000], [0.5040], [0.5080], [0.5120],
  [0.1], [0.5398], [0.5438], [0.5478], [0.5517],
  [0.2], [0.5793], [0.5832], [0.5871], [0.5910],
  [0.3], [0.6179], [0.6217], [0.6255], [0.6293],
)

=== Công thức Thống kê

#code-block[
```typst
// Trung bình mẫu
$ overline(X) = frac(1, n) sum_(i=1)^n X_i $

// Phương sai mẫu (điều chỉnh)
$ S^2 = frac(1, n-1) sum_(i=1)^n (X_i - overline(X))^2 $

// Khoảng tin cậy 95% cho trung bình
$ overline(X) ± t_(alpha/2, n-1) frac(S, sqrt(n)) $

// Kiểm định t (hai mẫu độc lập)
$ T = frac(overline(X_1) - overline(X_2), sqrt(frac(S_1^2, n_1) + frac(S_2^2, n_2))) $
```
]

$overline(X)$ — trung bình mẫu
$S^2$ — phương sai mẫu

=== Ví dụ: Bài toán kiểm định t

Đề bài: So sánh điểm trung bình của hai lớp học.

#code-block(
  ```typst
  *Lớp A:* $n_1 = 30$, $overline(X_1) = 7.5$, $S_1 = 1.2$
  *Lớp B:* $n_2 = 28$, $overline(X_2) = 6.8$, $S_2 = 1.5$

  Giả thuyết:
  $ H_0: mu_1 = mu_2 $ (không có khác biệt)
  $ H_1: mu_1 != mu_2 $ (có khác biệt)

  Giá trị thống kê:
  $ t = frac(7.5 - 6.8, sqrt(frac(1.2^2, 30) + frac(1.5^2, 28))) approx 1.92 $
  ```
)

=== Bài tập thực hành

*Bài 1.* Trình bày công thức xác suất đầy đủ của biến cố hợp 3 biến cố:
$P(A ∪ B ∪ C)$.

*Bài 2.* Tạo bảng phân phối chuẩn Z với các giá trị z từ 0.0 đến 1.0, bước 0.1.

*Bài 3.* Giải bài toán: Một xạ thủ bắn trúng bia với xác suất 0.7. Bắn 5 phát độc lập.
Tính xác suất bắn trúng ít nhất 3 phát. Trình bày lời giải chi tiết.

*Bài 4.* Trình bày bài toán kiểm định t hai mẫu: so sánh điểm thi Toán của nam và nữ trong lớp.

#pagebreak()
