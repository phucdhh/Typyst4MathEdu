#import "../assets/style.typ": *

== Nhập dữ liệu từ file ngoài

Một trong những tính năng mạnh nhất của Typst là khả năng đọc dữ liệu
từ file CSV, JSON, và YAML ngay trong quá trình biên dịch. Điều này
mở ra vô số ứng dụng: bảng điểm tự động, ngân hàng câu hỏi, cấu hình
đề thi, ...

=== Đọc file CSV

File CSV (Comma-Separated Values) là định dạng phổ biến để lưu trữ
dữ liệu dạng bảng, có thể xuất từ Excel, Google Sheets, hoặc Python.

Giả sử bạn có file `diem.csv`:

#code-block[
```csv
Họ tên,Toán,Lý,Hóa,Tin
Nguyễn Văn An,8.5,7.0,9.0,8.0
Trần Thị Bình,6.5,8.0,7.5,9.0
Lê Văn Cường,9.0,8.5,8.0,7.5
Phạm Thị Dung,7.0,6.5,8.5,8.0
```
]

Đọc và hiển thị trong Typst:

#code-block[
```typst
#let data = csv("diem.csv")

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  stroke: 0.5pt,
  table.header[*Họ tên*], table.header[*Toán*], table.header[*Lý*],
  table.header[*Hóa*], table.header[*Tin*], table.header[*TB*],
  ..for hs in data {
    let tb = (float(hs.Toán) + float(hs.Lý) + float(hs.Hóa) + float(hs.Tin)) / 4
    (hs.at(0), hs.at(1), hs.at(2), hs.at(3), hs.at(4), str(round(100 * tb) / 100))
  },
)
```
]

=== Đọc file JSON

JSON (JavaScript Object Notation) là định dạng linh hoạt cho dữ liệu
có cấu trúc, rất phù hợp để lưu ngân hàng câu hỏi, cấu hình.

#code-block[
```typst
// File cau-hinh.json:
// {
//   "tieu-de": "ĐỀ KIỂM TRA GIỮA KỲ",
//   "mon": "Giải tích 1",
//   "thoi-gian": 60,
//   "so-cau": 30,
//   "diem-toi-da": 10
// }

#let cfg = json("cau-hinh.json")

#align(center, text(size: 16pt, weight: "bold")[#cfg.tieu-de])
#align(center)[Môn: #cfg.mon — Thời gian: #cfg.thoi-gian phút]
```
]

=== Đọc file YAML

YAML có cú pháp thân thiện hơn JSON, thường dùng cho metadata:

#code-block[
```typst
// File meta.yaml:
// title: "Typst cho Toán học"
// author: "Nguyễn Đăng Minh Phúc"
// year: 2026

#let meta = yaml("meta.yaml")

#set document(
  title: meta.title,
  author: meta.author,
)
```
]

=== Ví dụ: Sinh danh sách bài tập từ JSON

File `bai-tap.json`:

#code-block[
```json
[
  {"so": 1, "cau": "Tính $1 + 1$", "diem": 0.5},
  {"so": 2, "cau": "Giải $x^2 - 1 = 0$", "diem": 1.0},
  {"so": 3, "cau": "Tính $integral_0^1 x dif x$", "diem": 1.5},
  {"so": 4, "cau": "Tính $lim_(x -> 0) (sin x)/x$", "diem": 1.0},
  {"so": 5, "cau": "Tìm đạo hàm của $x^3$", "diem": 1.0}
]
```
]

Code Typst:

#code-block[
```typst
#let bt-list = json("bai-tap.json")

#for bt in bt-list {
  *Câu #bt.so (#bt.diem điểm).* #bt.cau
  #v(2cm)
}

#align(right)[
  *Tổng: #bt-list.map(x => float(x.diem)).sum() điểm*
]
```
]

=== Bài tập thực hành (Dữ liệu ngoài)

*Bài 1.* Tạo file CSV chứa điểm của 20 học sinh, 5 môn học. Đọc vào
Typst và tạo bảng điểm kèm cột Trung bình và Xếp loại (dùng `#if`).

*Bài 2.* Thiết kế file JSON cho ngân hàng 30 câu hỏi trắc nghiệm
(Toán lớp 12), mỗi câu có: `id`, `noi-dung`, `dap-an` (4 lựa chọn),
`dap-an-dung`, `muc-do` (Nhận biết/Thông hiểu/Vận dụng), `chu-de`.

*Bài 3.* Viết hàm `doc-de-thi(config, ngan-hang)` tự động tạo đề thi
từ file cấu hình JSON và ngân hàng câu hỏi JSON.

#pagebreak()
