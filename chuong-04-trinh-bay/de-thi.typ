#import "../assets/style.typ": *

== Template đề thi & Kiểm tra

=== Đề thi trắc nghiệm — Layout 2 cột

Đề thi trắc nghiệm thường dùng layout 2 cột để tiết kiệm giấy và
tạo cảm giác chuyên nghiệp:

#code-block[
```typst
#columns(2)[
  *Câu 1.* $2 + 2$ bằng?
  A. $3$ \
  B. $4$ \
  C. $5$ \
  D. $6$

  *Câu 2.* $sqrt(144)$ bằng?
  A. $10$ \
  B. $11$ \
  C. $12$ \
  D. $13$

  *Câu 3.* Đạo hàm của $sin x$ là:
  A. $cos x$ \
  B. $-cos x$ \
  C. $sin x$ \
  D. $-sin x$

  *Câu 4.* $integral_0^1 x dif x$ bằng:
  A. $0$ \
  B. $frac(1, 2)$ \
  C. $1$ \
  D. $2$
]
```
]

=== Đề thi tự luận

Một đề thi tự luận có cấu trúc gồm:
- Tiêu đề và thông tin kỳ thi
- Hướng dẫn thí sinh
- Các câu hỏi kèm thang điểm
- Khoảng trắng để làm bài

#v(0.5em)

#align(center, text(size: 15pt, weight: "bold")[ĐỀ KIỂM TRA 1 TIẾT])
#align(center)[Môn: Đại số & Giải tích — Lớp 11]
#align(center)[Thời gian: 45 phút (không kể thời gian phát đề)]

#v(0.3em)

#table(columns: (1fr, 1fr),
  [Họ và tên: .................................],
  [Lớp: ........ Số báo danh: .................],
)

#v(0.3em)
#line(length: 100%)
#v(0.3em)

*Câu 1 (3.0 điểm).* Giải các phương trình lượng giác sau:

a) $sin x = frac(1, 2)$, $x in [0, 2pi]$

b) $cos 2x = -frac(sqrt(3), 2)$

c) $tan x = sqrt(3)$, $x in (0, pi)$

#v(3.5cm)

*Câu 2 (3.0 điểm).* Giải phương trình:

$ sqrt(3) sin x + cos x = sqrt(2) $

(Hướng dẫn: đưa về dạng $sin(x + alpha)$ hoặc $cos(x - beta)$)

#v(4cm)

*Câu 3 (2.5 điểm).* Cho phương trình $sin^2 x + (2m - 1) sin x - 2m = 0$.

a) Giải phương trình khi $m = 1$.

b) Tìm $m$ để phương trình có đúng 2 nghiệm thuộc $[0, pi]$.

#v(4cm)

*Câu 4 (1.5 điểm).* Chứng minh rằng với mọi $x$:

$ cos^4 x - sin^4 x = cos 2x $

#v(2cm)

#align(center)[--- HẾT ---]
#align(right, text(size: 9pt, fill: gray)[Tổng: 10 điểm])

=== Đề thi hỗn hợp (THPT Quốc gia style)

#code-block[
```typst
#align(center, text(size: 14pt, weight: "bold")[
  KỲ THI TỐT NGHIỆP TRUNG HỌC PHỔ THÔNG
])
#align(center, text(size: 11pt)[
  Bài thi: TOÁN — Thời gian làm bài: 90 phút
])
```
]

Một đề thi THPT Quốc gia điển hình gồm:
- *Phần 1*: 40 câu trắc nghiệm (mỗi câu 0.2 điểm = 8 điểm)
- *Phần 2*: 6 câu tự luận ngắn (mỗi câu 0.33 điểm = 2 điểm)

=== Mã đề và thông tin thí sinh

#code-block[
```typst
#align(right, text(size: 12pt, weight: "bold")[Mã đề: 101])

#table(columns: (1fr, 1fr),
  [Họ tên: ...............................................................],
  [Số báo danh: .............................................],
)
```
]

=== Mẹo nâng cao: Trộn câu hỏi

Typst có thể trợ giúp xáo câu hỏi bằng script (học chi tiết ở Chương 5):

#code-block[
```typst
#let cau-hoi = (
  (1, "Tính $1+1$", "A), "B), "C), "D)"),
  (2, "Đạo hàm của $x^2$", "A), "B), "C), "D)"),
  (3, "Tích phân $int x dif x$", "A), "B), "C), "D)"),
)

// Xáo thứ tự câu hỏi cho mỗi mã đề
#let de = cau-hoi.shuffle()
```
]

=== Bài tập thực hành (Đề thi)

*Bài 1.* Tạo đề kiểm tra 1 tiết Đại số lớp 11 gồm 4 câu tự luận
(có thang điểm). Định dạng theo mẫu trên, thêm trang bìa có
thông tin trường và logo.

*Bài 2.* Thiết kế layout đề thi trắc nghiệm 40 câu, mỗi câu 4
lựa chọn, dùng 2 cột. Thêm phần phiếu trả lời trắc nghiệm ở cuối đề.

*Bài 3.* Tạo 4 mã đề khác nhau từ cùng 10 câu hỏi bằng cách dùng script.
Kiểm tra rằng không có mã đề nào trùng thứ tự câu hỏi.

#pagebreak()
