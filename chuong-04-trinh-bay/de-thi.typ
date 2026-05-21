#import "../assets/style.typ": *
== Template đề thi & kiểm tra

=== Đề thi trắc nghiệm

Layout đề thi trắc nghiệm thường dùng 2 cột để tiết kiệm giấy:

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
]
```
]

*Đánh số câu hỏi:*

#code-block[
```typst
#let cau-tn(body, choiceA, choiceB, choiceC, choiceD) = {
  let so = counter("tn").step()
  set counter("tn")
  [
    *Câu #counter("tn").display().* #body \
    A. #choiceA \
    B. #choiceB \
    C. #choiceC \
    D. #choiceD
  ]
}
```
]

=== Mã đề và thông tin thí sinh

#code-block[
```typst
#align(right)[Mã đề: 101]

#table(columns: (1fr, 1fr),
  [Họ tên: .........................],
  [Lớp: ............. SBD: .........],
)
```
]

=== Đề thi tự luận

#align(center, text(size: 15pt, weight: "bold")[ĐỀ KIỂM TRA 1 TIẾT])
#align(center)[Môn: Đại số — Lớp 11 — Thời gian: 45 phút]

#v(0.5em)

*Câu 1 (3 điểm).* Giải các phương trình sau:

a) $sin x = frac(1, 2)$

#v(3cm)

b) $cos 2x = -frac(sqrt(3), 2)$

#v(3cm)

*Câu 2 (3 điểm).* Giải phương trình:

$sqrt(3) sin x + cos x = 1$

#v(4cm)

*Câu 3 (4 điểm).* Cho phương trình $sin^2 x + m sin x - 1 = 0$.

a) Giải phương trình khi $m = 1$.

b) Tìm $m$ để phương trình có nghiệm trên $[0, pi]$.

#v(5cm)

=== Đề thi hỗn hợp (THPT Quốc gia style)

Một đề thi THPT Quốc gia điển hình gồm:
- Phần 1: Trắc nghiệm (40 câu, mỗi câu 0.2 điểm)
- Phần 2: Tự luận ngắn (6 câu, mỗi câu 0.33 điểm)

Cấu trúc trang:

#code-block[
```typst
#align(center, text(size: 14pt, weight: "bold")[
  KỲ THI TỐT NGHIỆP THPT
])
#align(center, text(size: 11pt)[
  Bài thi: TOÁN — Thời gian: 90 phút
])
```
]

=== Mẹo nâng cao: Xáo câu hỏi với `#random`

Dùng `#random` để xáo thứ tự câu hỏi hoặc đáp án:

#code-block[
```typst
#let tra-loi = ("A", "B", "C", "D")
#let xao = tra-loi.shuffle()
#xao
```
]

=== Bài tập thực hành

*Bài 1.* Tạo đề kiểm tra 1 tiết Đại số lớp 11 gồm 3 câu tự luận (4 trang).
Thêm trang bìa có thông tin thí sinh và mã đề.

*Bài 2.* Thiết kế layout đề thi trắc nghiệm 40 câu, mỗi câu 4 lựa chọn, dùng 2 cột.
Thêm phần tô đáp án ở cuối đề.

*Bài 3.* Tạo 4 mã đề khác nhau từ cùng một ngân hàng 10 câu hỏi.
