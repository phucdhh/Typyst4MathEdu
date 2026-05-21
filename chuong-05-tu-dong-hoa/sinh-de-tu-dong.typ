#import "../assets/style.typ": *
== Sinh đề thi tự động

=== Thiết kế ngân hàng câu hỏi JSON

#code-block[
```json
// ngan-hang.json
[
  {
    "id": 1,
    "noi-dung": "Giới hạn $lim_(x -> 0) (sin x)/x$ bằng:",
    "dap-an": ["0", "1", "∞", "Không tồn tại"],
    "dung": 1,
    "muc-do": "de",
    "chu-de": "gioi-han"
  },
  {
    "id": 2,
    "noi-dung": "Đạo hàm của $sin x$ là:",
    "dap-an": ["cos x", "-cos x", "sin x", "-sin x"],
    "dung": 0,
    "muc-do": "de",
    "chu-de": "dao-ham"
  }
]
```
]

=== Phân loại theo Bloom

| Mức độ | Mô tả | Tỷ lệ trong đề |
|--------|-------|----------------|
| Nhận biết | Nhớ lại công thức, định nghĩa | 30% |
| Thông hiểu | Hiểu và áp dụng cơ bản | 40% |
| Vận dụng | Bài toán phức tạp, tổng hợp | 30% |

=== Thuật toán chọn câu hỏi

#code-block[
```typst
#let chon-cau-hoi(ngan-hang, so-cau, ty-le) = {
  // Phân loại câu hỏi theo mức độ
  let de = ngan-hang.filter(x => x.muc-do == "de")
  let tb = ngan-hang.filter(x => x.muc-do == "trung-binh")
  let kho = ngan-hang.filter(x => x.muc-do == "kho")

  // Tính số câu mỗi mức độ
  let so-de = int(so-cau * ty-le.de)
  let so-tb = int(so-cau * ty-le.trung-binh)
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
#let sinh-ma-de(ngan-hang, so-cau, ma) = {
  let cau-hoi = chon-cau-hoi(ngan-hang, so-cau, ty-le)
  // Tạo nội dung đề
  [
    #align(right)[Mã đề: #ma]
    
    #for i in range(cau-hoi.len()) [
      *Câu #(i + 1).* #cau-hoi.at(i).noi-dung \
      #let dap-an = cau-hoi.at(i).dap-an
      A. #dap-an.at(0) \
      B. #dap-an.at(1) \
      C. #dap-an.at(2) \
      D. #dap-an.at(3) \
    ]
  ]
}
```
]

=== Tự động tạo đáp án

#code-block[
```typst
#let tao-dap-an(ngan-hang, cau-hoi, ma) = {
  let dap-an = cau-hoi.map(x => {
    let bang = ("A", "B", "C", "D")
    bang.at(x.dung)
  })

  [
    *ĐÁP ÁN MÃ ĐỀ #ma*
    #table(
      columns: (auto, auto, auto, auto),
      stroke: 0.5pt,
      ..for i in range(cau-hoi.len()) {
        (str(i + 1), dap-an.at(i))
      },
    )
  ]
}
```
]

=== Ví dụ hoàn chỉnh

#code-block[
```typst
#let ngan-hang = json("ngan-hang.json")
#let ty-le = (de: 0.3, trung-binh: 0.4, kho: 0.3)

// Sinh 4 mã đề
#for ma in ("101", "102", "103", "104") {
  #pagebreak()
  #let cau-hoi = chon-cau-hoi(ngan-hang, 30, ty-le)
  #sinh-ma-de(ngan-hang, 30, ma)
  #pagebreak()
  #tao-dap-an(ngan-hang, cau-hoi, ma)
}
```
]

=== Thảo luận: Giới hạn của `#random` trong Typst

- `random()` trong Typst sử dụng seed dựa trên thời gian biên dịch
- Kết quả có thể thay đổi giữa các lần biên dịch
- Để cố định kết quả, có thể dùng seed tùy chỉnh
- Với nhu cầu phức tạp hơn, nên kết hợp Typst với Python sinh dữ liệu đầu vào

=== Bài tập thực hành

*Bài 1.* Xây dựng ngân hàng 30 câu hỏi trắc nghiệm chương Giới hạn (đủ 3 mức độ).

*Bài 2.* Viết chương trình sinh 4 mã đề, mỗi đề 20 câu, đảm bảo không trùng câu giữa các mã.

*Bài 3.* Tạo file đáp án đi kèm mỗi mã đề dạng bảng 4 cột: số câu, đáp án, mức độ, chủ đề.

#pagebreak()
