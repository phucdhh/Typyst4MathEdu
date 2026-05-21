#import "../assets/style.typ": *

== Sinh đề thi tự động

=== Tổng quan

Khả năng sinh đề thi tự động là một trong những ứng dụng ấn tượng nhất
của Typst scripting. Kết hợp dữ liệu từ JSON và logic lập trình, bạn có thể:

- Tạo ngân hàng câu hỏi một lần, sinh nhiều đề khác nhau
- Đảm bảo cân bằng mức độ (dễ/trung bình/khó) theo tỷ lệ mong muốn
- Tự động sinh đáp án cho từng mã đề
- Trộn thứ tự câu hỏi và đáp án

Kiến trúc tổng thể:

#code-block[
```
ngan-hang.json      style.typ
      \               /
       \             /
    sinh-de.typ (script chính)
           |
           v
    de-101.pdf, de-102.pdf, ...
    dap-an-101.pdf, dap-an-102.pdf, ...
```
]

=== Thiết kế ngân hàng câu hỏi

Cấu trúc JSON cho một câu hỏi:

#code-block[
```json
{
  "id": 1,
  "noi-dung": "Giới hạn $lim_(x -> 0) (sin x)/x$ bằng:",
  "dap-an": ["0", "1", "∞", "Không tồn tại"],
  "dap-an-dung": "B",
  "muc-do": "Nhận biết",
  "chu-de": "Giới hạn"
}
```
]

=== Phân loại câu hỏi theo Bloom

Dựa trên *Thang nhận thức Bloom* (Benjamin Bloom, 1956), câu hỏi
được phân thành 3 mức:

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt,
  table.header[*Mức độ*], table.header[*Tỷ lệ đề xuất*], table.header[*Mô tả*],
  [Nhận biết], [30%], [Nhớ và nhận ra công thức, định nghĩa, định lý],
  [Thông hiểu], [40%], [Hiểu ý nghĩa, áp dụng trực tiếp công thức],
  [Vận dụng], [30%], [Giải bài toán phức tạp, tổng hợp nhiều kiến thức],
)

=== Thuật toán chọn câu hỏi

#code-block[
```typst
#let chon-cau-hoi(ngan-hang, so-cau, ty-le) = {
  // Phân loại câu hỏi
  let de  = ngan-hang.filter(x => x.muc-do == "Nhận biết")
  let tb  = ngan-hang.filter(x => x.muc-do == "Thông hiểu")
  let kho = ngan-hang.filter(x => x.muc-do == "Vận dụng")

  // Tính số câu mỗi loại
  let so-de  = int(so-cau * ty-le.de)
  let so-tb  = int(so-cau * ty-le.tb)
  let so-kho = so-cau - so-de - so-tb

  // Chọn ngẫu nhiên và trộn
  let chon = (
    ..de.shuffle().slice(0, so-de),
    ..tb.shuffle().slice(0, so-tb),
    ..kho.shuffle().slice(0, so-kho),
  ).shuffle()

  chon
}
```
]

=== Sinh nhiều mã đề

#code-block[
```typst
#let tao-de-thi(ngan-hang, so-cau, ty-le, ma-de) = {
  let cau-hoi = chon-cau-hoi(ngan-hang, so-cau, ty-le)

  // Cấu trúc đề thi
  align(center, text(size: 14pt, weight: "bold")[ĐỀ KIỂM TRA])
  align(right, text(size: 10pt)[Mã đề: #ma-de])

  for (i, ch) in cau-hoi.enumerate() {
    [
      *Câu #(i + 1).* #ch.noi-dung
      #let da = ch.dap-an.shuffle()  // trộn đáp án
      A. #da.at(0) \
      B. #da.at(1) \
      C. #da.at(2) \
      D. #da.at(3) \
    ]

    // Tạo file đáp án riêng
    // ...
  }
}

// Sinh 4 mã đề
#for ma in ("101", "102", "103", "104") {
  #pagebreak()
  #tao-de-thi(ngan-hang, 30, ty-le, ma)
}
```
]

=== Một vòng đời đề thi tự động

1. *Chuẩn bị:* Soạn ngân hàng câu hỏi (JSON) — làm một lần
2. *Cấu hình:* Tạo file cấu hình (JSON) — số câu, tỷ lệ mức độ, thời gian
3. *Sinh đề:* Chạy `typst compile sinh-de.typ` — tạo file PDF
4. *In ấn:* Mỗi mã đề là một file PDF riêng, sẵn sàng in

#ghi-nho[
  *Lợi ích của sinh đề tự động:*
  - Tiết kiệm hàng chục giờ soạn đề thủ công mỗi kỳ
  - Đảm bảo tính công bằng (mỗi mã đề có độ khó tương đương)
  - Dễ dàng cập nhật ngân hàng câu hỏi qua các năm
  - Giảm thiểu sai sót do con người
]

=== Thảo luận: Giới hạn của `#random`

Hàm `random()` trong Typst có một số hạn chế cần lưu ý:

- *Seed thay đổi:* mỗi lần biên dịch, kết quả `random()` có thể khác nhau.
  Để cố định, dùng `random(seed: 42)`.

- *Không thực sự ngẫu nhiên:* Typst dùng thuật toán sinh số giả ngẫu nhiên
  (PRNG), đủ tốt cho đề thi nhưng không dùng cho mật mã.

- *Workaround:* Với nhu cầu phức tạp (ví dụ: đảm bảo không trùng câu giữa
  các mã đề), bạn nên kết hợp Typst với Python để sinh dữ liệu đầu vào.

=== Bài tập thực hành (Sinh đề)

*Bài 1.* Xây dựng ngân hàng 30 câu hỏi trắc nghiệm chương "Giới hạn",
phân bổ đều 3 mức độ (10 câu mỗi mức).

*Bài 2.* Viết script sinh 4 mã đề, mỗi đề 20 câu, đảm bảo:
- Tỷ lệ: 6 Nhận biết + 8 Thông hiểu + 6 Vận dụng
- Không mã đề nào trùng quá 5 câu với mã đề khác

*Bài 3.* Tạo file đáp án đi kèm cho mỗi mã đề, dạng bảng gồm các cột:
Số câu | Đáp án đúng | Mức độ | Chủ đề.

== Tổng kết Chương 5

#ghi-nho[
  *Những điều cần nhớ:*
  - Typst có ngôn ngữ scripting với biến, điều kiện, vòng lặp, hàm
  - `#set` thay đổi mặc định, `#show` biến đổi hiển thị
  - Đọc CSV/JSON/YAML để sinh nội dung động
  - Kết hợp JSON ngân hàng câu hỏi + script để sinh đề tự động
  - Dùng `counter` để đánh số tự động, `random(seed: ...)` để sinh ngẫu nhiên
]

#pagebreak()
