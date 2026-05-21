#import "../assets/style.typ": *

== Chia sẻ và xuất bản Template (bổ sung)

=== Publish template lên Typst App

Sau khi đăng nhập Typst App, bạn có thể:

1. *Tạo dự án mới* — bắt đầu từ template có sẵn
2. *Chia sẻ link* — gửi link cho đồng nghiệp xem và góp ý
3. *Clone dự án* — sao chép dự án về tài khoản của mình
4. *Import từ Universe* — dùng template từ kho chính thức

=== Ví dụ: Template "Đề thi Toán THPT"

#code-block[
```typst
// lib.typ — Template đề thi toán
#let de-thi(
  tieu-de: "ĐỀ THI THỬ THPT QUỐC GIA",
  mon: "Toán",
  thoi-gian: "90 phút",
  ma-de: none,
  noi-dung,
) = {
  align(center, text(size: 16pt, weight: "bold")[#tieu-de])
  align(center)[Môn: #mon — Thời gian: #thoi-gian]

  if ma-de != none [
    align(right, text(size: 12pt, weight: "bold")[Mã đề: #ma-de])
  ]

  table(columns: (1fr, 1fr),
    [Họ tên: .............................................],
    [Số báo danh: ........................................],
  )

  line(length: 100%)
  v(0.5em)
  noi-dung
}
```
]

Sử dụng:

#code-block[
```typst
#import "@preview/template-de-thi-toan:1.0.0": de-thi

#de-thi(
  tieu-de: "KIỂM TRA GIỮA KỲ II",
  mon: "Giải tích 12",
  thoi-gian: "60 phút",
  ma-de: "201",
)[
  *Câu 1.* Tính $integral_0^1 x e^x dif x$.
  *Câu 2.* Tìm cực trị của $y = x^3 - 3x + 1$.
]
```
]

=== Thảo luận: Đóng góp cho cộng đồng

Khi template của bạn đã sẵn sàng, hãy chia sẻ với cộng đồng qua
Typst Universe. Mỗi template được cộng đồng sử dụng là một đóng góp
cho hệ sinh thái Typst — giống như cách cộng đồng LaTeX đã xây dựng
CTAN trong hơn 30 năm qua.
