#import "../assets/style.typ": *
== Nhập dữ liệu từ CSV và JSON

Typst có khả năng đọc dữ liệu từ file ngoài, rất hữu ích cho sinh nội dung động.

=== Đọc file CSV

#code-block[
```typst
// File diem.csv:
// Ten,Toan,Ly,Hoa
// An,8.5,7.0,9.0
// Binh,6.5,8.0,7.5
// Chi,9.0,8.5,8.0

#let data = csv("diem.csv")

#table(
  columns: (auto, auto, auto, auto),
  stroke: 0.5pt,
  [*Họ tên*], [*Toán*], [*Lý*], [*Hóa*],
  ..data.flatten(),
)
```
]

=== Ứng dụng: Bảng phân phối xác suất

#code-block[
```typst
// File phanphoi.csv
// z,0.00,0.01,0.02
// 0.0,0.5000,0.5040,0.5080
// 0.1,0.5398,0.5438,0.5478

#let ztable = csv("phanphoi.csv")

#table(
  columns: (auto, auto, auto, auto),
  stroke: 0.5pt,
  ..ztable.flatten(),
)
```
]

=== Đọc file JSON

#code-block[
```typst
// File config.json:
// {
//   "so-cau": 40,
//   "thoi-gian": 90,
//   "mon": "Toan",
//   "ma-de": "101"
// }

#let config = json("config.json")

Thời gian làm bài: #config.thoi-gian phút
Môn: #config.mon
Mã đề: #config.ma-de
```
]

=== Ứng dụng: Cấu hình đề thi từ JSON

#code-block[
```typst
// File de-thi.json:
// {
//   "tieu-de": "ĐỀ KIỂM TRA GIỮA KỲ",
//   "mon": "Giải tích 1",
//   "thoi-gian": 60,
//   "so-cau": 30,
//   "diem-toi-da": 10
// }

#let de = json("de-thi.json")

#align(center, text(size: 16pt, weight: "bold")[#de.tieu-de])
#align(center)[Môn: #de.mon — Thời gian: #de.thoi-gian phút]
```
]

=== Đọc file YAML

#code-block[
```typst
// File meta.yaml:
// title: "Typst cho Toán học"
// author: "Nguyễn Đăng Minh Phúc"
// year: 2026
// isbn: "978-...-..."

#let meta = yaml("meta.yaml")

#set document(
  title: meta.title,
  author: meta.author,
)
```
]

=== Ví dụ thực hành: Sinh danh sách bài tập từ JSON

#code-block[
```typst
// File bai-tap.json:
// [
//   {"so": 1, "noi-dung": "Tính $1 + 1$", "diem": 0.5},
//   {"so": 2, "noi-dung": "Giải $x^2 - 1 = 0$", "diem": 1.0},
//   {"so": 3, "noi-dung": "Tính $integral_0^1 x dif x$", "diem": 1.5}
// ]

#let bai-tap-list = json("bai-tap.json")

#for bt in bai-tap-list {
  *Câu #bt.so (#bt.diem điểm).* #bt.noi-dung
}
```
]

=== Bài tập thực hành

*Bài 1.* Tạo file CSV chứa điểm của 10 học sinh, 5 môn. Dùng Typst đọc và hiển thị thành bảng điểm kèm điểm trung bình.

*Bài 2.* Thiết kế file JSON cho ngân hàng 20 câu hỏi trắc nghiệm, mỗi câu có: nội dung, 4 đáp án, đáp án đúng, mức độ (dễ/trung bình/khó).

*Bài 3.* Viết hàm đọc cấu hình từ JSON và tự động sinh đề thi với thông số: số câu, thời gian, mã đề.
