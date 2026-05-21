#import "../assets/style.typ": *

== Xác suất và Thống kê

Xác suất — Thống kê là một trong những lĩnh vực Toán học có nhiều ứng dụng
thực tiễn nhất, từ khoa học dữ liệu đến kinh tế, y học. Lý thuyết xác suất
hiện đại được *Andrey Kolmogorov* (1903–1987) tiên đề hóa vào năm 1933.

=== Ký hiệu Xác suất trong Typst

Typst hỗ trợ đầy đủ các ký hiệu xác suất chuẩn:

#code-block[
```typst
// Xác suất cơ bản
$ P(A) $                         // xác suất của biến cố A
$ P(A | B) $                     // xác suất có điều kiện
$ P(A ∩ B) $                     // xác suất giao (intersection)
$ P(A ∪ B) $                     // xác suất hợp (union)

// Kỳ vọng và phương sai
$ EE[X] = sum_i x_i p_i $        // kỳ vọng (expected value)
$ "Var"(X) = EE[(X - EE[X])^2] $ // phương sai (variance)
$ sigma_X = sqrt("Var"(X)) $     // độ lệch chuẩn
```
]

*Giải thích ký hiệu:*

- $P(A)$: xác suất xảy ra biến cố $A$, giá trị từ $0$ đến $1$
- $P(A | B)$: xác suất $A$ xảy ra *với điều kiện* $B$ đã xảy ra
- $EE[X]$: giá trị kỳ vọng (trung bình có trọng số)
- $"Var"(X)$: phương sai — đo độ phân tán của dữ liệu quanh kỳ vọng
- $sigma$: độ lệch chuẩn — căn bậc hai của phương sai

=== Công thức Xác suất quan trọng

*Công thức cộng:*
$ P(A ∪ B) = P(A) + P(B) - P(A ∩ B) $

*Công thức nhân* (A và B độc lập):
$ P(A ∩ B) = P(A) P(B) $

*Công thức Bayes* (đặt theo tên *Thomas Bayes*, 1701–1761, nhưng được
*Pierre-Simon Laplace* công bố rộng rãi vào năm 1812):

$ P(A | B) = frac(P(B | A) P(A), P(B)) $

*Công thức Bernoulli* (phép thử lặp độc lập, đặt theo tên *Jacob Bernoulli*,
1655–1705):

$ P(X = k) = C_n^k p^k (1-p)^(n-k) $

=== Hàm phân phối và hàm mật độ

$ F(x) = P(X <= x) $ — hàm phân phối tích lũy (CDF)

$ f(x) = (dif F)/(dif x) $ — hàm mật độ xác suất (PDF)

#chu-y[
  Ký hiệu $f(x)$ cho hàm mật độ chỉ áp dụng cho biến ngẫu nhiên *liên tục*.
  Với biến *rời rạc*, ta dùng $P(X = x_i)$.
]

=== Bảng phân phối Chuẩn (Z-table)

Bảng phân phối chuẩn tắc $N(0, 1)$ là công cụ quan trọng trong Thống kê.
Dưới đây là một đoạn bảng Z được tạo bằng Typst:

#table(
  columns: (auto, auto, auto, auto, auto),
  stroke: 0.5pt,
  table.header[*z*], table.header[*0.00*], table.header[*0.01*], table.header[*0.02*], table.header[*0.03*],
  [0.0], [0.5000], [0.5040], [0.5080], [0.5120],
  [0.1], [0.5398], [0.5438], [0.5478], [0.5517],
  [0.2], [0.5793], [0.5832], [0.5871], [0.5910],
  [0.3], [0.6179], [0.6217], [0.6255], [0.6293],
  [0.4], [0.6554], [0.6591], [0.6628], [0.6664],
  [0.5], [0.6915], [0.6950], [0.6985], [0.7019],
)

*Lưu ý:* Typst có thể đọc bảng Z đầy đủ từ file CSV bên ngoài
(sẽ học ở Chương 5), giúp sinh bảng tự động với hàng nghìn giá trị.

=== Công thức Thống kê suy luận

*Thống kê mô tả mẫu:*

$&
  overline(X) &= frac(1, n) sum_(i=1)^n X_i                                         && "trung bình mẫu" \
  S^2          &= frac(1, n-1) sum_(i=1)^n (X_i - overline(X))^2                     && "phương sai mẫu điều chỉnh" \
  S            &= sqrt(S^2)                                                          && "độ lệch chuẩn mẫu"
$

*Khoảng tin cậy cho trung bình (phân phối Student):*

Khoảng tin cậy $100(1 - alpha)%$ cho trung bình tổng thể $mu$:

$ overline(X) ± t_(alpha/2, n-1) dot frac(S, sqrt(n)) $

*Kiểm định giả thuyết:*

$ T = frac(overline(X) - mu_0, S / sqrt(n)) $ (kiểm định một mẫu)

=== Ví dụ: Bài toán kiểm định t hai mẫu

*Đề bài.* Một giáo viên muốn so sánh điểm trung bình của hai lớp học:

- Lớp A: $n_1 = 30$ học sinh, $overline(X_1) = 7.5$, $S_1 = 1.2$
- Lớp B: $n_2 = 28$ học sinh, $overline(X_2) = 6.8$, $S_2 = 1.5$

Kiểm định xem có sự khác biệt ý nghĩa giữa hai lớp không (mức ý nghĩa $alpha = 0.05$).

*Lời giải.*

Đặt giả thuyết:

$&
  H_0 &: mu_1 = mu_2 quad "không có khác biệt" \
  H_1 &: mu_1 != mu_2 quad "có khác biệt"
$

Tính giá trị thống kê kiểm định:

$ t = frac(overline(X_1) - overline(X_2), sqrt(frac(S_1^2, n_1) + frac(S_2^2, n_2))) $

$ = frac(7.5 - 6.8, sqrt(frac(1.44, 30) + frac(2.25, 28))) $

$ = frac(0.7, sqrt(0.0480 + 0.0804)) = frac(0.7, sqrt(0.1284)) $

$ = frac(0.7, 0.3583) approx 1.95 $

Kết luận: So sánh với giá trị tới hạn $t_(0.025, 56) approx 2.003$,
ta thấy $|t| = 1.95 < 2.003$ nên *chưa đủ cơ sở bác bỏ* $H_0$.
Điểm trung bình hai lớp không khác biệt có ý nghĩa thống kê ở mức 5%.

=== Ví dụ: Xác suất có điều kiện — Bài toán chẩn đoán y khoa

*Đề bài.* Một xét nghiệm phát hiện bệnh có:
- Độ nhạy $P("+"|"bệnh") = 0.95$ (95% người bệnh có kết quả dương tính)
- Độ đặc hiệu $P("−"|"khỏe") = 0.90$ (90% người khỏe có kết quả âm tính)
- Tỷ lệ mắc bệnh trong dân số: $P("bệnh") = 0.01$ (1%)

Tính xác suất một người có kết quả dương tính thực sự mắc bệnh $P("bệnh" | "+")$.

*Lời giải.* Áp dụng công thức Bayes:

$ P("bệnh" | "+") = frac(P("+"|"bệnh") dot P("bệnh"), P("+")) $

Trong đó:
$ &
  P("+") &= P("+"|"bệnh") dot P("bệnh") + P("+"|"khỏe") dot P("khỏe") \
  &= 0.95 dot 0.01 + 0.10 dot 0.99 = 0.0095 + 0.0990 = 0.1085
$

Vậy:
$ P("bệnh" | "+") = frac(0.95 dot 0.01, 0.1085) approx 0.0876 $

*Kết luận:* Chỉ khoảng 8.76% người có kết quả dương tính thực sự mắc bệnh!
Đây là nghịch lý *tỷ lệ cơ sở* (base rate fallacy) — một bài học quan trọng
trong suy luận thống kê.

=== Bài tập thực hành (Xác suất & Thống kê)

*Bài 1.* Một hộp có 7 bi đỏ và 3 bi xanh. Lấy ngẫu nhiên 2 bi.
Tính xác suất để:
a) Cả 2 bi đều đỏ
b) Có ít nhất 1 bi xanh
Trình bày lời giải chi tiết với Typst.

*Bài 2.* Cho $X ~ N(mu, sigma^2)$ với $mu = 170$, $sigma = 6$.
Tính $P(164 < X < 176)$. Vẽ hình minh họa trên phân phối chuẩn.

*Bài 3.* Tạo bảng phân phối Student (t-table) với 5 bậc tự do đầu tiên,
tra cứu các giá trị $t_(0.05)$ và $t_(0.01)$ hai phía.

*Bài 4.* Trình bày đầy đủ bài toán kiểm định Chi-bình phương
(Chi-square test) cho một bảng dữ liệu quan sát.

#pagebreak()
