#import "../assets/style.typ": *
= Chương 6: Xuất bản & Cộng tác

== Xuất PDF chuẩn in ấn

=== Tùy chọn biên dịch

#code-block[
```bash
# Biên dịch cơ bản
typst compile book.typ

# Xuất ra file cụ thể
typst compile book.typ output.pdf

# Chỉ định thư mục gốc
typst compile --root . book.typ output.pdf
```
]

=== Thiết lập trang cho in ấn

#code-block[
```typst
#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 2.5cm,    // lề trong (gáy sách)
    right: 2cm,     // lề ngoài
  ),
  binding: left,    // sách đóng bìa trái
)
```
]

Các khổ giấy thường dùng:

| Khổ | Kích thước | Ứng dụng |
|-----|-----------|----------|
| A4 | 210 × 297 mm | Giáo trình, đề thi |
| B5 | 176 × 250 mm | Sách, luận văn |
| Letter | 215.9 × 279.4 mm | Tài liệu quốc tế |

=== Metadata PDF

#code-block[
```typst
#set document(
  title: "Typst cho Toán học",
  author: "Nguyễn Đăng Minh Phúc",
  keywords: ("Typst", "Toán học", "soạn thảo tài liệu"),
)
```
]

=== PDF/A cho lưu trữ

#code-block[
```bash
typst compile --format pdf --pdf-version 2.0 book.typ
```
]

=== Kiểm tra PDF sau khi xuất

- Font có được nhúng không? Dùng `pdfinfo` hoặc mở Properties trong Adobe Reader.
- Hình ảnh có đủ độ phân giải không? (tối thiểu 300 DPI cho in ấn)
- Kích thước file có phù hợp không?

=== Mẹo tối ưu kích thước file

- Nén hình ảnh trước khi chèn (dùng PNG/JPEG thay vì BMP)
- Dùng SVG cho hình vẽ vector (cetz xuất SVG rất nhẹ)
- Tránh nhúng font không cần thiết
- Dùng `--pages` để chỉ biên dịch trang cần kiểm tra

#code-block[
```bash
# Chỉ biên dịch 3 trang đầu
typst compile --pages 1-3 book.typ
```
]

== Chia sẻ và xuất bản template

=== Tạo package Typst cục bộ

Cấu trúc thư mục package:

```
template-de-thi/
├── typst.toml          // metadata package
├── lib.typ             // hàm public
└── README.md           // hướng dẫn sử dụng
```

File `typst.toml`:

#code-block[
```toml
[package]
name = "template-de-thi"
version = "1.0.0"
entrypoint = "lib.typ"
authors = ["Nguyễn Đăng Minh Phúc"]
license = "MIT"
description = "Template đề thi Toán học"
```
]

File `lib.typ`:

#code-block[
```typst
#let de-thi(tieu-de, thoi-gian, noi-dung) = {
  // Template đề thi hoàn chỉnh
}
```
]

=== Đăng lên Typst Universe

Điều kiện:
- File `typst.toml` đầy đủ thông tin
- Có `README.md` mô tả chi tiết
- License rõ ràng
- Code chạy được với phiên bản Typst mới nhất

Quy trình:
1. Fork repository `github.com/typst/packages`
2. Thêm thư mục package vào `packages/preview/<tên>/<phiên bản>/`
3. Gửi Pull Request

=== Chia sẻ qua Typst App

#code-block[
```bash
# Upload lên Typst App
typst publish
```
]

=== Bài tập thực hành

*Bài 1.* Thiết lập trang cho luận văn: A4, lề trái 3.5cm (gáy), lề phải 2.5cm, header có tên chương, footer số trang.

*Bài 2.* Xuất file PDF/A của cuốn sách này và kiểm tra thông tin metadata.

*Bài 3.* Đóng gói template đề thi thành package có cấu trúc đầy đủ (typst.toml, lib.typ, README.md).
