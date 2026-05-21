#import "assets/style.typ": *

#include "assets/cover.typ"

#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm))

#pagebreak()

#align(center, text(size: 20pt, weight: "bold", fill: primary-color)[Mục lục])
#v(1em)
#outline(
  title: none,
  indent: auto,
)

#pagebreak()

= Lời nói đầu

Typst là một hệ thống soạn thảo tài liệu thế hệ mới, ra đời năm 2023 từ dự án nghiên cứu tại ETH Zürich.
Khác với LaTeX — công cụ đã thống trị mảng soạn thảo học thuật trong hơn 40 năm — Typst được thiết kế
với triết lý đơn giản hơn, hiện đại hơn và thân thiện với người dùng hơn.

Cuốn sách này được viết dành cho *sinh viên và giáo viên Toán* muốn tận dụng sức mạnh của Typst
để tạo ra các tài liệu Toán học đẹp, chuyên nghiệp và dễ bảo trì. Bạn không cần biết gì về Typst
trước khi đọc — chúng tôi sẽ hướng dẫn bạn từ những bước đầu tiên.

== Cách đọc sách hiệu quả

- Đọc theo thứ tự từ Chương 1 đến Chương 6 nếu bạn là người mới bắt đầu.
- Nếu đã biết Typst cơ bản, bạn có thể nhảy thẳng đến Chương 3 hoặc Chương 5.
- Mỗi chương đều có bài tập thực hành — hãy làm chúng ngay trên máy tính của bạn.
- Code examples được đánh dấu bằng khung riêng. Bạn có thể copy-paste trực tiếp vào file `.typ`.

== Quy ước trong sách

- *In đậm*: thuật ngữ quan trọng, khái niệm mới.
- *In nghiêng*: thuật ngữ tiếng Anh (giữ nguyên bản gốc).
- `Code inline`: tên lệnh, cú pháp Typst.
- Hộp Định lý, Ví dụ, Chú ý, Ghi nhớ: các loại nội dung đặc biệt.

#pagebreak()

= Giới thiệu tổng quan

Cuốn sách gồm 6 chương và 3 phụ lục:

*Chương 1* — Giới thiệu Typst: lịch sử, cài đặt, tài liệu đầu tiên.
*Chương 2* — Cú pháp cơ bản: văn bản, định dạng, công thức inline và block.
*Chương 3* — Toán học nâng cao: ma trận, giải tích, hình học, xác suất thống kê.
*Chương 4* — Trình bày tài liệu: bài tập, đề thi, lời giải, slide.
*Chương 5* — Tự động hóa & Lập trình: hàm, dữ liệu ngoài, sinh đề tự động.
*Chương 6* — Xuất bản & Cộng tác: PDF, Git, template, tích hợp.
*Phụ lục*: bảng ký hiệu, template sẵn dùng, tài nguyên tham khảo.

#pagebreak()

// ============================================
// Chương 1
// ============================================
#include "chuong-01-gioi-thieu/index.typ"

// ============================================
// Chương 2
// ============================================
#include "chuong-02-co-ban/index.typ"

// ============================================
// Chương 3
// ============================================
#include "chuong-03-toan-nang-cao/index.typ"

// ============================================
// Chương 4
// ============================================
#include "chuong-04-trinh-bay/index.typ"

// ============================================
// Chương 5
// ============================================
#include "chuong-05-tu-dong-hoa/index.typ"

// ============================================
// Chương 6
// ============================================
#include "chuong-06-xuat-ban/index.typ"

// ============================================
// Phụ lục
// ============================================
#include "phu-luc/index.typ"
