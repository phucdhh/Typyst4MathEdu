# KẾ HOẠCH VIẾT SÁCH — Typst cho Toán học

> **Mục tiêu:** ~220 trang | **Đối tượng:** Sinh viên & Giáo viên Toán | **Ngôn ngữ:** Tiếng Việt

---

## Tổng quan phân bổ trang

| Phần | Nội dung | Số trang |
|------|----------|----------|
| Phần đầu sách | Bìa, Lời nói đầu, Mục lục | 8 |
| Chương 1 | Giới thiệu Typst | 20 |
| Chương 2 | Cú pháp cơ bản | 35 |
| Chương 3 | Toán học nâng cao | 50 |
| Chương 4 | Trình bày tài liệu | 42 |
| Chương 5 | Tự động hóa & Lập trình | 32 |
| Chương 6 | Xuất bản & Cộng tác | 20 |
| Phụ lục | Bảng ký hiệu, Template, Tài nguyên | 13 |
| **Tổng** | | **220** |

---

## Phần đầu sách (8 trang)

### Trang bìa & bìa phụ (2 trang)
- Tên sách, tác giả, phiên bản, logo
- Trang bản quyền, thông tin xuất bản

### Lời nói đầu (3 trang)
- Tại sao viết cuốn sách này
- Typst sinh ra để giải quyết vấn đề gì của LaTeX
- Cách đọc sách hiệu quả nhất
- Quy ước ký hiệu, màu sắc, hộp ghi chú dùng trong sách

### Mục lục (2 trang)
- Mục lục tự động sinh bởi Typst
- Danh sách hình vẽ & bảng biểu

### Giới thiệu tổng quan (1 trang)
- Bản đồ nội dung sách (learning map)
- Lộ trình đề xuất theo từng đối tượng độc giả

---

## Chương 1 — Giới thiệu Typst (20 trang)

**Mục tiêu chương:** Đọc xong, người dùng hiểu Typst là gì, cài đặt được và tạo ra tài liệu Toán đầu tiên.

### 1.1 Typst là gì? (3 trang)
- Lịch sử ra đời: dự án nghiên cứu tại ETH Zürich, ra mắt 2023
- So sánh chi tiết Typst vs LaTeX vs Microsoft Word
  - Bảng so sánh 6 tiêu chí: cú pháp, tốc độ, công thức, lập trình, mã nguồn mở, đường cong học
  - Khi nào nên dùng Typst, khi nào vẫn cần LaTeX
- Hệ sinh thái: Typst App (web), Typst CLI, Typst Universe (package registry)

### 1.2 Cài đặt môi trường (5 trang)
- **Cài đặt Typst CLI:**
  - macOS qua Homebrew: `brew install typst`
  - Windows qua winget: `winget install --id Typst.Typst`
  - Linux qua Cargo: `cargo install typst-cli`
  - Kiểm tra cài đặt: `typst --version`
- **Cài đặt VS Code + extension Typst LSP:**
  - Tìm và cài extension "Typst LSP" / "Tinymist"
  - Cấu hình preview tự động
  - Phím tắt hữu ích
- **Sử dụng Typst App (web) không cần cài đặt:**
  - Đăng ký tài khoản tại typst.app
  - Giao diện editor trực tuyến
  - Ưu/nhược điểm so với CLI
- **Cài đặt font chữ Toán học:**
  - New Computer Modern (mặc định)
  - STIX Two, Fira Math

### 1.3 Tài liệu Typst đầu tiên — Hello Toán! (5 trang)
- Cấu trúc tối thiểu của một file `.typ`
- Biên dịch lần đầu: `typst compile hello.typ`
- Chế độ xem trực tiếp: `typst watch hello.typ`
- Ví dụ đầy đủ: định lý Pythagoras
  ```typst
  = Định lý Pythagoras
  Trong tam giác vuông: $ a^2 + b^2 = c^2 $
  ```
- Phân tích từng dòng lệnh
- Bài tập thực hành: tạo tài liệu giới thiệu bản thân bằng Typst

### 1.4 Cấu trúc dự án Typst (4 trang)
- File đầu vào chính (`book.typ`), file con (`include`)
- File cấu hình `typst.toml`
- Tổ chức thư mục dự án chuẩn
- Import gói từ Typst Universe: cú pháp `#import "@preview/gói:phiên-bản": *`

### 1.5 Quy trình làm việc thực tế (3 trang)
- Vòng lặp: viết → lưu → xem kết quả tức thì
- Quản lý lỗi biên dịch: đọc thông báo lỗi của Typst
- Mẹo gỡ lỗi nhanh
- Tổng kết chương & câu hỏi ôn tập

---

## Chương 2 — Cú pháp cơ bản (35 trang)

**Mục tiêu chương:** Thành thạo cú pháp văn bản, định dạng, công thức toán inline và block cơ bản.

### 2.1 Văn bản và định dạng (7 trang)
- Đoạn văn, xuống dòng, xuống đoạn
- **In đậm**, *in nghiêng*, `code inline`, gạch chân
- Tiêu đề cấp 1–6: `= Tiêu đề`, `== Tiêu đề nhỏ`...
- Danh sách không thứ tự (`-`), có thứ tự (`+`), lồng nhau
- Chú thích: `// bình luận một dòng`
- Ký tự đặc biệt và escape: `\`, `~` (khoảng trắng không ngắt)
- Unicode và tiếng Việt: cài font, kiểm tra hiển thị dấu

### 2.2 Liên kết, hình ảnh và bảng biểu (8 trang)
- Siêu liên kết: `#link("url")[văn bản]`
- Chèn hình ảnh: `#image("figures/hinh.png", width: 80%)`
  - Căn chỉnh, thêm caption, đánh số tự động
- Hình + caption chuẩn với `#figure`
- Bảng biểu:
  - Cú pháp cơ bản `#table(columns: ..., [ô], ...)`
  - Header, đường kẻ, căn chỉnh cột
  - Bảng chứa công thức Toán
- Cross-reference: `<label>` và `@label`

### 2.3 Công thức Toán inline (8 trang)
- Cú pháp: `$biểu_thức$` (inline), `$ biểu_thức $` (block)
- **Số và chữ cái:** `a`, `x_1`, `x^2`, `x_i^n`
- **Phép toán cơ bản:** `+`, `-`, `*`, `/`, `=`, `!=`, `<=`, `>=`
- **Phân số:** `a/b` vs `frac(a, b)`
- **Căn thức:** `sqrt(x)`, `root(3, x)`
- **Ký hiệu Hy Lạp:** `alpha`, `beta`, `gamma`, `Delta`, `Sigma`, `pi`, `theta`
- **Dấu ngoặc tự co giãn:** `lr(( ))`, `lr([ ])`, `lr({ })`
- **Dấu chấm lược:** `dots`, `dots.c`, `dots.v`, `dots.d`
- Ví dụ thực hành: viết 10 công thức Toán THPT thường gặp

### 2.4 Công thức Toán block và đánh số (7 trang)
- Công thức block: thêm khoảng trắng bao quanh `$`
- Đánh số công thức tự động với gói `equate`
- Căn chỉnh nhiều dòng công thức: môi trường `&`
- Tham chiếu đến công thức đã đánh số: `@eq:pythagorean`
- Ví dụ: trình bày chứng minh công thức bậc hai
- Bài tập: viết lại một đề bài Toán THPT bằng Typst

### 2.5 Trang, cột và bố cục cơ bản (5 trang)
- Thiết lập trang: `#set page(paper: "a4", margin: ...)`
- Cỡ chữ, font, giãn dòng: `#set text(font: ..., size: ..., lang: "vi")`
- Chia cột: `#columns(2)[...]`
- Ngắt trang thủ công: `#pagebreak()`
- Header & footer đơn giản: `#set page(header: ..., footer: ...)`

---

## Chương 3 — Toán học nâng cao (50 trang)

**Mục tiêu chương:** Soạn thảo thành thạo mọi công thức Toán học từ THPT đến Đại học.

### 3.1 Đại số tuyến tính (12 trang)
- **Ma trận:**
  - Cú pháp: `mat(a, b; c, d)` với delimiters tùy chọn
  - Ma trận vuông, ma trận đơn vị, ma trận 0
  - Ma trận cỡ lớn với dấu chấm lược: `dots.v`, `dots.h`, `dots.d`
  - Ví dụ: Ma trận xoay, ma trận Jacobian
- **Định thức:** `|mat(...)|` hoặc `det(A)`
- **Hệ phương trình tuyến tính:**
  - Dùng `cases(...)` cho hệ phương trình
  - Trình bày phương pháp Gauss
  - Ví dụ: hệ 3 ẩn 3 phương trình
- **Tổng và tích sigma/pi:**
  - `sum_(i=1)^n a_i`, `product_(k=1)^n k`
  - Tổng đôi, tổng ba
- **Không gian vector:**
  - Ký hiệu vector: `arrow(v)`, `hat(u)`, `bold(v)`
  - Tích vô hướng, tích có hướng
- Bài tập thực hành: soạn bài giảng Đại số tuyến tính 2 trang

### 3.2 Giải tích (14 trang)
- **Giới hạn:**
  - `lim_(x -> 0) sin(x)/x`
  - Giới hạn một phía, giới hạn vô cực
  - Ký hiệu O lớn, o nhỏ: `O(n^2)`, `o(h)`
- **Đạo hàm:**
  - Ký hiệu Leibniz: `(dif f)/(dif x)`, `(dif^2 f)/(dif x^2)`
  - Ký hiệu Newton: `dot(f)`, `ddot(f)`
  - Ký hiệu prime: `f'(x)`, `f''(x)`
  - Đạo hàm riêng: `partial f / partial x`
  - Gradient, divergence, curl (∇)
- **Tích phân:**
  - Tích phân xác định: `integral_a^b f(x) dif x`
  - Tích phân bội: `integral.double`, `integral.triple`
  - Tích phân đường, tích phân mặt
  - Ký hiệu `dif` (differential) vs `d` thường
- **Chuỗi số và chuỗi hàm:**
  - Chuỗi Taylor, chuỗi Maclaurin
  - Ký hiệu tổng vô hạn
- Ví dụ thực hành: trình bày đầy đủ bài toán tích phân có giải chi tiết
- Bài tập: soạn đề thi Giải tích 1 (2 trang A4)

### 3.3 Hình học và đồ họa với cetz (12 trang)
- **Cài đặt và import gói `cetz`:**
  - `#import "@preview/cetz:0.3.2": canvas, draw`
- **Các lệnh vẽ cơ bản:**
  - Điểm: `draw.point((x,y), name: "A")`
  - Đoạn thẳng: `draw.line((0,0), (3,0))`
  - Đường tròn: `draw.circle((0,0), radius: 2)`
  - Hình chữ nhật: `draw.rect((0,0), (3,2))`
  - Cung tròn: `draw.arc(...)`
  - Đường cong Bezier
- **Nhãn và chú thích:**
  - Đặt tên điểm, thêm nhãn toán học
  - Ghi chú góc, chiều dài cạnh
- **Ví dụ Hình học phẳng:**
  - Tam giác vuông với ký hiệu góc vuông
  - Đường tròn nội tiếp, ngoại tiếp
  - Hình bình hành, hình thang
- **Vẽ đồ thị hàm số:**
  - Hàm bậc 2: parabol
  - Hàm lượng giác: sin, cos
  - Hàm mũ, logarithm
  - Đồ thị có lưới tọa độ, trục, nhãn
- **Vẽ sơ đồ với `fletcher`:**
  - Mũi tên giữa các đối tượng
  - Ứng dụng: vẽ sơ đồ bài toán tối ưu, đồ thị hàm hợp
- Bài tập: vẽ hình minh họa định lý Ceva

### 3.4 Xác suất và Thống kê (12 trang)
- **Ký hiệu Xác suất:**
  - `P(A)`, `P(A|B)`, `P(A ∩ B)`, `P(A ∪ B)`
  - Kỳ vọng: `E[X]`, phương sai: `"Var"(X)`, độ lệch chuẩn: `sigma`
  - Hàm phân phối: `F(x)`, hàm mật độ: `f(x)`
- **Bảng phân phối:**
  - Bảng phân phối chuẩn Z
  - Bảng phân phối t-Student
  - Dùng `#table` có header cố định
- **Biểu đồ thống kê với cetz:**
  - Biểu đồ cột (histogram)
  - Đường phân phối chuẩn
  - Hộp râu (box plot) đơn giản
- **Công thức thống kê:**
  - Trung bình mẫu, phương sai mẫu
  - Khoảng tin cậy
  - Kiểm định giả thuyết
- Ví dụ: trình bày đầy đủ bài toán kiểm định t
- Bài tập: soạn bài tập Xác suất có lời giải

---

## Chương 4 — Trình bày tài liệu (42 trang)

**Mục tiêu chương:** Tạo được đề thi, bài tập, lời giải và slide bài giảng chuẩn chuyên nghiệp.

### 4.1 Show-boxes và môi trường nội dung (8 trang)
- **Gói `showybox` — hộp định dạng nội dung:**
  - Cài đặt: `#import "@preview/showybox:2.0.4": showybox`
  - Hộp Định lý (theorem box): viền xanh, nền nhạt
  - Hộp Ví dụ (example box): viền cam
  - Hộp Chú ý (warning box): viền đỏ
  - Hộp Ghi nhớ (note box): viền xám
  - Hộp Bài tập (exercise box)
  - Tùy chỉnh màu sắc, kiểu viền, shadow
- **Môi trường định lý tự định nghĩa:**
  - Định lý, Bổ đề, Mệnh đề, Hệ quả
  - Đánh số tự động theo chương
  - Ví dụ thực hành: soạn 1 trang lý thuyết với 3 định lý

### 4.2 Template bài tập tự luyện (8 trang)
- Thiết kế layout bài tập: tiêu đề, phần học sinh điền tên
- Phần câu hỏi đánh số tự động
- Ô chừa chỗ trả lời (blank space)
- Điểm số, rubric chấm điểm
- Ví dụ hoàn chỉnh: phiếu bài tập Giải tích chương Giới hạn (4 trang)
  - 5 câu trắc nghiệm
  - 3 câu tự luận với chỗ trình bày
  - Bảng điểm ở cuối
- Kỹ thuật: `#counter`, `#numbering`, re-usable components

### 4.3 Template đề thi & kiểm tra (10 trang)
- **Đề thi trắc nghiệm:**
  - Layout 2 cột câu hỏi
  - Đánh số câu A, B, C, D
  - Hộp bôi đen đáp án
  - Mã đề, phách thi
- **Đề thi tự luận:**
  - Phần hướng dẫn, thang điểm
  - Câu hỏi có nhiều ý (a), b), c))
  - Đường gạch chừa chỗ làm bài
- **Đề thi hỗn hợp (THPT Quốc gia style):**
  - 40 câu trắc nghiệm + 6 câu tự luận ngắn
  - Trang bìa đề thi, thông tin thí sinh
- Ví dụ hoàn chỉnh: đề kiểm tra 1 tiết Đại số lớp 11 (4 trang)
- Mẹo: dùng `#random` để xáo câu hỏi (nâng cao)

### 4.4 Trình bày lời giải chuẩn (8 trang)
- **Nguyên tắc trình bày lời giải Toán:**
  - Cấu trúc: đầu bài → phân tích → giải → kết luận
  - Ghi rõ điều kiện, miền xác định
- **Công cụ `pinit` — chú thích từng phần công thức:**
  - Cài đặt và cú pháp cơ bản
  - Mũi tên chỉ vào phần của công thức kèm giải thích
  - Ứng dụng: giải thích từng bước biến đổi đại số
- **Layout lời giải:**
  - Hai cột: bên trái viết, bên phải giải thích
  - Khung "Hướng dẫn" tách biệt khỏi lời giải chính thức
- Ví dụ: lời giải đầy đủ bài tích phân từng phần (3 trang)
- Ví dụ: lời giải bài hình học không gian có hình vẽ

### 4.5 Slide bài giảng với Polylux (8 trang)
- **Cài đặt `polylux`:**
  - `#import "@preview/polylux:0.4.0": *`
  - Thiết lập theme bài giảng Toán
- **Cú pháp slide cơ bản:**
  - `#slide[...]` — một trang slide
  - `#title-slide[...]` — trang tiêu đề
  - Navigation, progress bar
- **Hiệu ứng xuất hiện dần:**
  - `#pause` — dừng lại, click để hiện tiếp
  - `#only(2)[...]` — chỉ hiện ở bước 2
  - `#uncover(2-)[...]` — hiện từ bước 2 trở đi
- **Theme tùy chỉnh cho Toán:**
  - Font, màu sắc, logo trường
  - Khung định lý trên slide
  - Ví dụ + bài giải trên slide
- Ví dụ hoàn chỉnh: 8 slide bài giảng "Giới hạn dãy số"
- Xuất slide thành PDF: `typst compile --format pdf`

---

## Chương 5 — Tự động hóa & Lập trình (32 trang)

**Mục tiêu chương:** Dùng ngôn ngữ lập trình của Typst để tái sử dụng cấu trúc và sinh nội dung tự động.

### 5.1 Ngôn ngữ scripting của Typst (8 trang)
- **Hai chế độ:** content mode vs code mode
- **Biến và kiểu dữ liệu:**
  - `#let x = 5` — số, chuỗi, bool
  - Array: `(1, 2, 3)`, Dictionary: `(key: value)`
  - Content type: `[văn bản]`
- **Điều kiện:** `#if ... { } else { }`
- **Vòng lặp:** `#for item in list { }`
- **Hàm:**
  ```typst
  #let theorem(title, body) = {
    showybox(title: title)[#body]
  }
  ```
- **Scope và import:**
  - `#import "file.typ": function`
  - `#include "file.typ"`
- Ví dụ: hàm tạo bảng nhân, hàm vẽ tam giác tùy kích thước

### 5.2 Hàm và component tái sử dụng (8 trang)
- **Thiết kế hàm cho nội dung Toán:**
  - `#let dinh-ly(so, ten, noi-dung)` — Định lý tổng quát
  - `#let vi-du(so, bai, giai)` — Ví dụ có lời giải
  - `#let bai-tap(diem, noi-dung)` — Bài tập có điểm số
- **Set và show rules:**
  - `#set math.equation(numbering: "(1)")` — đánh số tất cả công thức
  - `#show heading: it => ...` — tùy chỉnh hiển thị tiêu đề
  - `#show math.equation: it => ...` — bọc tất cả công thức
- **State và counter:**
  - `#counter("example").step()` — bộ đếm ví dụ
  - `#context counter("example").display()` — hiển thị số hiện tại
  - Reset counter theo chương
- Ví dụ thực hành: xây dựng file `style.typ` dùng cho toàn bộ sách

### 5.3 Nhập dữ liệu từ CSV và JSON (8 trang)
- **Đọc file CSV:**
  - `#let data = csv("data.csv")`
  - Sinh bảng tự động từ dữ liệu
  - Ứng dụng: bảng điểm sinh viên, bảng phân phối xác suất
- **Đọc file JSON:**
  - `#let config = json("config.json")`
  - Ứng dụng: cấu hình đề thi (số câu, thang điểm, mã đề)
- **Đọc file YAML:**
  - `#let meta = yaml("meta.yaml")`
  - Ứng dụng: metadata sách (tác giả, năm, ISBN)
- **Ví dụ thực hành:**
  - Sinh tự động danh sách 20 bài tập từ file JSON
  - Tạo bảng thống kê điểm lớp từ CSV
- Bài tập: thiết kế cấu trúc JSON cho ngân hàng câu hỏi

### 5.4 Sinh đề thi tự động (8 trang)
- **Thiết kế ngân hàng câu hỏi:**
  - Cấu trúc JSON: câu hỏi, 4 đáp án, đáp án đúng, mức độ, chủ đề
  - Phân loại theo Bloom: Nhận biết / Thông hiểu / Vận dụng
- **Thuật toán chọn câu hỏi:**
  - Chọn ngẫu nhiên có phân bổ theo chủ đề
  - Đảm bảo tỷ lệ khó/dễ
  - Sinh nhiều mã đề khác nhau
- **Tự động tạo đáp án:**
  - File đáp án đi kèm với mỗi mã đề
  - Ma trận đáp án format bảng
- Ví dụ hoàn chỉnh: sinh 4 mã đề kiểm tra từ 1 ngân hàng 60 câu
- Thảo luận: giới hạn của `#random` trong Typst, workaround

---

## Chương 6 — Xuất bản & Cộng tác (20 trang)

**Mục tiêu chương:** Xuất PDF chuyên nghiệp, chia sẻ template và cộng tác nhóm.

### 6.1 Xuất PDF chuẩn in ấn (5 trang)
- **Tùy chọn biên dịch:**
  - `typst compile --format pdf book.typ`
  - `typst compile --root . book.typ output.pdf`
- **Thiết lập trang cho in ấn:**
  - Khổ giấy: A4, B5, Letter
  - Margin: ngoài lề, gáy sách (bleed)
  - `#set page(binding: left)` — sách đọc từ trái
- **Metadata PDF:**
  - `#set document(title: ..., author: ..., keywords: ...)`
  - Thông tin xuất hiện trong Properties của file PDF
- **PDF/A cho lưu trữ lâu dài**
- Kiểm tra PDF: font nhúng, độ phân giải hình ảnh
- Mẹo tối ưu kích thước file

### 6.2 Chia sẻ và xuất bản template (5 trang)
- **Tạo package Typst cục bộ:**
  - Cấu trúc thư mục package: `typst.toml`, `lib.typ`, `README.md`
  - Xuất hàm public với `#import`
- **Đăng lên Typst Universe:**
  - Điều kiện: license, README đầy đủ, ví dụ thumbnail
  - Quy trình gửi Pull Request lên `typst/packages`
- **Chia sẻ qua Typst App:**
  - Publish template lên typst.app
  - Chia sẻ link dự án
- Ví dụ: đóng gói template đề thi thành package có thể import

### 6.3 Cộng tác bằng Git (5 trang)
- **Tại sao Typst + Git là cặp đôi hoàn hảo:**
  - File `.typ` là plain text → diff dễ đọc
  - Không có binary blob như `.docx`
- **Quy trình Git cơ bản cho nhóm:**
  - Cấu trúc branch: `main`, `draft/chuong-N`, `fix/...`
  - `.gitignore` cho Typst: ignore `*.pdf`, `_output/`
  - Commit message theo convention
- **Giải quyết conflict:**
  - Conflict ở file `.typ`: đọc được, giải quyết thủ công
  - Tách nhỏ file để giảm conflict
- **GitHub Actions tự động biên dịch:**
  - CI: mỗi push → biên dịch → upload PDF artifact
  - Workflow YAML mẫu cho Typst
- **Cộng tác trên Typst App:** real-time collaboration

### 6.4 Tích hợp với hệ sinh thái rộng hơn (5 trang)
- **Typst + Python:**
  - Sinh file `.typ` từ Python script
  - Kết hợp matplotlib → SVG → Typst
- **Typst + Pandoc:**
  - Chuyển đổi Markdown → Typst
  - Chuyển đổi Typst → HTML (hạn chế)
- **Typst + Overleaf/LaTeX:**
  - Khi nào vẫn cần LaTeX (arXiv, tạp chí khoa học)
  - Chuyển đổi một chiều LaTeX → Typst (thủ công + công cụ hỗ trợ)
- **Tương lai của Typst:**
  - Lộ trình phát triển chính thức
  - Những tính năng sắp ra mắt

---

## Phụ lục (13 trang)

### Phụ lục A — Bảng tra ký hiệu Toán học (5 trang)
Bảng tra cứu nhanh, phân loại theo chủ đề:

| Nhóm | Ký hiệu | Lệnh Typst |
|------|---------|------------|
| **Đại số** | | |
| | $\sum$ | `sum` |
| | $\prod$ | `product` |
| | $\in$ | `in` |
| | $\subset$ | `subset` |
| **Giải tích** | | |
| | $\partial$ | `partial` |
| | $\int$ | `integral` |
| | $\oint$ | `integral.cont` |
| | $\nabla$ | `nabla` |
| **Hình học** | | |
| | $\angle$ | `angle` |
| | $\perp$ | `perp` |
| | $\parallel$ | `parallel` |
| **Lôgic** | | |
| | $\forall$ | `forall` |
| | $\exists$ | `exists` |
| | $\Rightarrow$ | `=>` |

*(bảng đầy đủ ~150 ký hiệu trong sách)*

### Phụ lục B — Tổng hợp template sẵn dùng (5 trang)
- Template 1: Phiếu bài tập (A4, 1 cột)
- Template 2: Đề kiểm tra 1 tiết (A4, 2 cột trắc nghiệm)
- Template 3: Đề thi học kỳ (A4, tự luận)
- Template 4: Slide bài giảng 4:3 (Polylux)
- Template 5: Báo cáo khóa luận / luận văn
- Mỗi template: 1 ảnh xem trước + link tải về / mã nguồn rút gọn

### Phụ lục C — Tài nguyên & Tham khảo (3 trang)
- **Tài liệu chính thức:**
  - Typst Documentation: https://typst.app/docs
  - Typst Universe: https://typst.app/universe
- **Cộng đồng:**
  - Discord chính thức Typst
  - GitHub Discussions
  - Reddit r/typst
- **Gói hay dùng trong Toán:**
  - Danh sách 20 gói kèm mô tả và link
- **Sách và bài viết tham khảo:**
  - The LaTeX Companion (so sánh)
  - Practical Typography (nguyên lý typography)

---

## Lịch trình viết đề xuất

| Giai đoạn | Nội dung | Thời gian | Trang |
|-----------|----------|-----------|-------|
| **Giai đoạn 1** | Phần đầu + Chương 1 + Chương 2 | 3 tuần | 63 |
| **Giai đoạn 2** | Chương 3 (Toán nâng cao) | 3 tuần | 50 |
| **Giai đoạn 3** | Chương 4 (Trình bày) | 3 tuần | 42 |
| **Giai đoạn 4** | Chương 5 (Tự động hóa) | 2 tuần | 32 |
| **Giai đoạn 5** | Chương 6 + Phụ lục | 2 tuần | 33 |
| **Giai đoạn 6** | Review, chỉnh sửa, kiểm tra | 2 tuần | — |
| **Tổng** | | **~15 tuần** | **220** |

---

## Tiêu chuẩn chất lượng mỗi chương

- [ ] Mỗi khái niệm mới đều có **ví dụ minh họa** cụ thể
- [ ] Mỗi đoạn code Typst đều có **output hình ảnh** đi kèm
- [ ] Cuối mỗi mục có **bài tập** thực hành (ít nhất 2-3 bài)
- [ ] Cuối mỗi chương có **tóm tắt** và **câu hỏi ôn tập**
- [ ] Code examples đều **chạy được** với phiên bản Typst mới nhất
- [ ] Thuật ngữ tiếng Anh được giữ nguyên và *in nghiêng* lần đầu xuất hiện
- [ ] Hình vẽ minh họa rõ ràng, có caption và số hình

---

## Các gói Typst cần cài đặt và kiểm tra

```toml
# typst.toml
[dependencies]
cetz = "0.3.2"
fletcher = "0.5.7"
polylux = "0.4.0"
pinit = "0.2.2"
showybox = "2.0.4"
equate = "0.3.1"
```

---

*Kế hoạch này có thể điều chỉnh linh hoạt theo tiến độ thực tế.*
*Cập nhật lần cuối: 21/05/2026*
