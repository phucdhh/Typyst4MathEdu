#import "../assets/style.typ": *

= Chương 6: Xuất bản & Cộng tác

Sau khi hoàn thiện nội dung, bước cuối cùng là *đưa tài liệu ra thế giới*:
xuất PDF đẹp để gửi in hoặc chia sẻ qua email, upload lên mạng để học sinh
truy cập, hoặc phối hợp cùng đồng nghiệp trên cùng một file.

Chương này bao gồm toàn bộ quy trình đó — từ lệnh biên dịch cuối cùng
đến việc chia sẻ template lên Typst Universe để người khác dùng lại.

#ghi-nho[
  *Mục tiêu chương:* Xuất file PDF đạt chuẩn in ấn chuyên nghiệp,
  chia sẻ tài liệu trực tuyến, làm việc nhóm với Git, và đăng template
  lên Typst Universe để cộng đồng cùng sử dụng.
]

== Xuất PDF chuẩn in ấn

=== Tùy chọn biên dịch

Typst CLI cung cấp nhiều tùy chọn để kiểm soát quá trình biên dịch:

#code-block[
```bash
# Biên dịch cơ bản → tạo ra book.pdf
typst compile book.typ

# Chỉ định tên file đầu ra
typst compile book.typ output.pdf

# Biên dịch toàn bộ từ thư mục gốc
typst compile --root . book.typ

# Xem trực tiếp (tự động biên dịch lại khi lưu)
typst watch book.typ
```
]

=== Thiết lập trang cho in ấn chuyên nghiệp

Khi chuẩn bị in sách, cần chú ý đến *binding* (gáy sách) và lề không đối xứng:

#code-block[
```typst
#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,     // lề trái lớn hơn (gáy sách)
    right: 2.5cm,  // lề phải nhỏ hơn
  ),
  binding: left,   // sách đọc từ trái sang phải
  numbering: "1",
)
```
]

Các khổ giấy chuẩn:

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  table.header[*Khổ giấy*], table.header[*Kích thước*], table.header[*Ứng dụng*],
  [A4], [210 × 297 mm], [Giáo trình, đề thi, báo cáo],
  [B5], [176 × 250 mm], [Sách giáo khoa, luận văn],
  [A5], [148 × 210 mm], [Sách bỏ túi, tài liệu phát tay],
  [Letter], [215.9 × 279.4 mm], [Tài liệu quốc tế (Mỹ/Canada)],
)

=== Metadata PDF

Thông tin metadata giúp file PDF chuyên nghiệp hơn và hỗ trợ
công cụ tìm kiếm, quản lý thư viện:

#code-block[
```typst
#set document(
  title: "Typst cho Toán học — Hướng dẫn thực hành",
  author: "Nguyễn Đăng Minh Phúc",
  keywords: ("Typst", "Toán học", "soạn thảo", "giáo trình"),
  date: datetime(year: 2026, month: 5, day: 21),
)
```
]

=== PDF/A cho lưu trữ lâu dài

PDF/A là tiêu chuẩn ISO dành cho lưu trữ tài liệu điện tử lâu dài.
Typst hỗ trợ xuất PDF/A:

#code-block[
```bash
# Xuất PDF/A-2b
typst compile --pdf-standard a-2b book.typ
```
]

=== Kiểm tra chất lượng PDF

Sau khi xuất PDF, bạn nên kiểm tra các yếu tố sau:

- *Font có được nhúng không?* Mở Properties của PDF (Ctrl+D / Cmd+D)
  và kiểm tra tab Fonts. Tất cả font nên có trạng thái "Embedded".

- *Độ phân giải hình ảnh*: tối thiểu 300 DPI cho in ấn, 150 DPI cho web.

- *Không gian màu*: nên dùng CMYK cho in ấn (Typst hiện hỗ trợ RGB,
  chuyển đổi CMYK có thể cần bước xử lý hậu kỳ).

=== Mẹo tối ưu kích thước file

- Dùng SVG thay vì PNG cho hình vector (cetz xuất SVG rất nhẹ)
- Nén ảnh JPEG ở chất lượng 85% trước khi chèn
- Tránh nhúng font không cần thiết
- Dùng `typst compile --pages 1-5` khi chỉ cần kiểm tra một phần

== Chia sẻ và Xuất bản Template

=== Tạo package Typst cục bộ

Một package Typst có cấu trúc thư mục đơn giản:

#code-block[
```
template-de-thi/
├── typst.toml          # metadata package
├── lib.typ             # code chính (public API)
├── README.md           # hướng dẫn sử dụng (bắt buộc)
├── LICENSE             # giấy phép (bắt buộc)
└── thumbnail.png       # ảnh xem trước (khuyến khích)
```
]

File `typst.toml`:

#code-block[
```toml
[package]
name = "template-de-thi-toan"
version = "1.0.0"
entrypoint = "lib.typ"
authors = ["Nguyễn Đăng Minh Phúc"]
license = "MIT"
description = "Template đề thi Toán học cho giáo viên"
keywords = ["toan", "de-thi", "giao-duc", "viet-nam"]
```
]

=== Đăng lên Typst Universe

Quy trình gửi package lên Universe:

1. *Fork* repository `github.com/typst/packages`
2. Tạo thư mục `packages/preview/template-de-thi-toan/1.0.0/`
3. Copy toàn bộ package vào thư mục trên
4. Gửi *Pull Request*
5. Đợi review từ đội ngũ Typst (thường 2-5 ngày)

Điều kiện để được chấp nhận:
- Có `typst.toml` đầy đủ
- Có `README.md` rõ ràng (tiếng Anh)
- Có `LICENSE` (MIT hoặc Apache 2.0 được khuyến khích)
- Code chạy được với phiên bản Typst mới nhất
- Có ít nhất một ví dụ minh họa

=== Chia sẻ qua Typst App

#code-block[
```bash
# Đăng nhập Typst App từ CLI
typst login

# Upload dự án
typst publish
```
]

Sau khi publish, dự án của bạn sẽ có link chia sẻ dạng
`https://typst.app/project/...` — người khác có thể xem,
clone, và chỉnh sửa trực tiếp trên trình duyệt.

=== Bài tập thực hành (Xuất bản)

*Bài 1.* Thiết lập trang cho luận văn tốt nghiệp: A4, lề trái 3.5cm,
lề phải 2.5cm, header có tên chương, footer có số trang. Xuất thử
và kiểm tra metadata PDF.

*Bài 2.* Đóng gói template "Phiếu bài tập Toán" thành package hoàn chỉnh
với `typst.toml`, `lib.typ`, `README.md`. Kiểm tra có thể import và
sử dụng từ dự án khác.

*Bài 3.* Thử nghiệm xuất PDF/A và so sánh kích thước file với
PDF thường. Kiểm tra font nhúng bằng công cụ `pdfinfo` hoặc Adobe Reader.

#pagebreak()
