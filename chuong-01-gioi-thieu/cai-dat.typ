#import "../assets/style.typ": *

= Chương 1: Giới thiệu Typst

#ghi-nho[
  *Mục tiêu chương:* Sau khi học xong chương này, bạn sẽ hiểu Typst là gì,
  cài đặt được môi trường làm việc, và tạo ra tài liệu Toán học đầu tiên
  của mình bằng Typst.
]

== Typst là gì?

Typst là một hệ thống soạn thảo tài liệu mã nguồn mở, được thiết kế để
thay thế LaTeX trong các tác vụ soạn thảo học thuật, đặc biệt là các tài liệu
có nhiều công thức Toán học.

=== Lịch sử ra đời

Dự án Typst bắt đầu vào năm 2019 tại *ETH Zürich* (Viện Công nghệ Liên bang Thụy Sĩ),
một trong những trường đại học kỹ thuật hàng đầu thế giới. Nghiên cứu sinh
*Laurenz Mädje*, dưới sự hướng dẫn của các giáo sư tại ETH, đã bắt đầu xây dựng
một hệ thống soạn thảo tài liệu mới với ba mục tiêu cốt lõi:

1. *Cú pháp đơn giản* — loại bỏ sự phức tạp của LaTeX, giúp người mới có thể
   bắt đầu sau vài phút.
2. *Tốc độ biên dịch tức thì* — sử dụng kỹ thuật *incremental compilation*
   (biên dịch tăng dần), các thay đổi nhỏ không cần biên dịch lại toàn bộ.
3. *Ngôn ngữ lập trình tích hợp* — Typst có một ngôn ngữ scripting đầy đủ,
   cho phép tự động hóa nội dung mà không cần công cụ bên ngoài.

Phiên bản công khai đầu tiên được phát hành vào tháng 3 năm 2023.
Kể từ đó, Typst đã thu hút một cộng đồng phát triển nhanh chóng và
một hệ sinh thái package phong phú (*Typst Universe*), tương tự như *CTAN* của LaTeX.

=== So sánh chi tiết: Typst vs LaTeX vs Microsoft Word

Để hiểu rõ vị trí của Typst trong bức tranh soạn thảo tài liệu, hãy xem xét
bảng so sánh dưới đây. Mỗi công cụ đều có thế mạnh riêng:

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    stroke: 0.5pt,
    table.header[*Tiêu chí*], table.header[*Typst*], table.header[*LaTeX*], table.header[*Word*],
    [Cú pháp], [Đơn giản, dễ đọc], [Phức tạp, nhiều lệnh], [Kéo thả, trực quan],
    [Tốc độ], [Tức thì (incremental)], [Chậm (full compile)], [Tức thì],
    [Công thức Toán], [Tuyệt vời], [Tiêu chuẩn vàng], [Hạn chế (Equation Editor)],
    [Lập trình], [Có sẵn (scripting)], [Macro TeX phức tạp], [Macro VBA],
    [Mã nguồn mở], table.cell(fill: rgb("#eafaf1"))[Có], table.cell(fill: rgb("#eafaf1"))[Có], table.cell(fill: rgb("#fadbd8"))[Không],
    [Đường cong học tập], table.cell(fill: rgb("#eafaf1"))[Thoải mái], table.cell(fill: rgb("#fadbd8"))[Dốc], table.cell(fill: rgb("#eafaf1"))[Thoải mái],
    [Git-friendly], table.cell(fill: rgb("#eafaf1"))[Có (plain text)], table.cell(fill: rgb("#eafaf1"))[Có (plain text)], table.cell(fill: rgb("#fadbd8"))[Không (binary)],
    [Hỗ trợ Unicode], table.cell(fill: rgb("#eafaf1"))[Đầy đủ], table.cell(fill: rgb("#f9e79f"))[Cần gói], table.cell(fill: rgb("#eafaf1"))[Đầy đủ],
    [Cộng tác thời gian thực], table.cell(fill: rgb("#eafaf1"))[Có (Typst App)], table.cell(fill: rgb("#f9e79f"))[Qua Overleaf], table.cell(fill: rgb("#eafaf1"))[Có (OneDrive)],
  ),
  caption: [So sánh chi tiết Typst, LaTeX và Microsoft Word dựa trên 9 tiêu chí],
)

==== Khi nào nên dùng Typst

- *Tài liệu Toán học*: báo cáo, khóa luận, luận văn, giáo trình
- *Đề thi và bài tập*: tạo đề, đáp án, phiếu bài tập hàng loạt
- *Slide bài giảng*: dùng gói `polylux` để tạo slide chuyên nghiệp
- *Dự án cá nhân hoặc nhóm nhỏ*: file plain text dễ quản lý bằng Git

==== Khi nào vẫn cần LaTeX

- *Gửi bài đến tạp chí khoa học* yêu cầu định dạng LaTeX (mẫu `.cls` có sẵn)
- *Sử dụng arXiv* — hiện tại arXiv chưa hỗ trợ Typst (dù đang được thảo luận)
- *Dự án có sẵn codebase LaTeX lớn* — chuyển đổi tốn thời gian

=== Hệ sinh thái Typst

Typst không chỉ là một chương trình biên dịch — nó là một hệ sinh thái gồm ba
thành phần chính, phối hợp với nhau:

*1. Typst CLI (Command Line Interface)* — công cụ dòng lệnh, cài đặt trên máy tính cá nhân.
Biên dịch file `.typ` thành PDF hoặc PNG. Phù hợp với người dùng chuyên nghiệp,
tích hợp vào CI/CD pipeline, script tự động hóa.

*2. Typst App (Web Editor)* — truy cập tại _typst.app_. Trình soạn thảo trực tuyến,
không cần cài đặt gì. Hỗ trợ cộng tác thời gian thực (nhiều người cùng viết),
lưu trữ đám mây, chia sẻ dự án qua link.

*3. Typst Universe (Package Registry)* — kho gói mở rộng chính thức.
Tương tự như CTAN của LaTeX hoặc npm của JavaScript. Tại đây bạn tìm thấy
các gói như `cetz` (vẽ hình), `polylux` (slide), `showybox` (hộp định lý),
và hàng trăm gói khác do cộng đồng đóng góp.

#ghi-nho[
  Một ưu điểm lớn của Typst so với LaTeX: bạn *không cần cài đặt hàng GB
  package* như TeX Live. Typst CLI chỉ ~40MB và tự động tải package
  từ Universe khi cần.
]

== Cài đặt môi trường

=== Cài đặt Typst CLI

Typst CLI có sẵn trên cả ba hệ điều hành chính. Dưới đây là hướng dẫn chi tiết
cho từng nền tảng.

==== macOS (Apple Silicon / Intel)

Sử dụng Homebrew — trình quản lý gói phổ biến nhất trên macOS:

#code-block[
```bash
# Cài đặt Homebrew nếu chưa có
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Cài đặt Typst
brew install typst

# Kiểm tra phiên bản
typst --version
```
]

==== Windows

Sử dụng winget (Windows Package Manager) — có sẵn trên Windows 10/11:

#code-block[
```bash
# Cài đặt Typst
winget install --id Typst.Typst

# Kiểm tra phiên bản
typst --version
```
]

Hoặc tải trực tiếp file `.msi` từ trang GitHub Releases của Typst:
_https://github.com/typst/typst/releases_

==== Linux

Sử dụng Cargo (trình quản lý gói của Rust):

#code-block[
```bash
# Cài đặt Rust và Cargo nếu chưa có
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Cài đặt Typst CLI
cargo install typst-cli

# Kiểm tra phiên bản
typst --version
```
]

Một số bản phân phối Linux cũng có sẵn Typst trong repository chính thức,
ví dụ Arch Linux (`pacman -S typst`).

=== Cài đặt VS Code + Extension

Visual Studio Code (VS Code) là trình soạn thảo mã nguồn phổ biến,
hỗ trợ Typst rất tốt thông qua các extension chuyên dụng.

*Bước 1:* Tải và cài đặt VS Code từ _https://code.visualstudio.com_

*Bước 2:* Mở VS Code, vào phần Extensions (tổ hợp phím `Cmd+Shift+X` trên macOS,
`Ctrl+Shift+X` trên Windows/Linux).

*Bước 3:* Tìm và cài một trong hai extension sau:

- *Tinymist* (khuyên dùng) — extension toàn diện nhất cho Typst:
  syntax highlighting, chẩn đoán lỗi, preview trực tiếp, tự động hoàn thành.

- *Typst LSP* — extension nhẹ hơn, tập trung vào Language Server Protocol.

*Phím tắt hữu ích trong VS Code với Typst:*

- `Cmd+K V` (macOS) / `Ctrl+K V` (Windows): mở preview PDF bên cạnh
- `Cmd+S` / `Ctrl+S`: lưu và tự động cập nhật preview
- `Cmd+Shift+P` → "Typst: Preview": mở preview thủ công

=== Sử dụng Typst App (không cần cài đặt)

Nếu bạn không muốn cài đặt bất kỳ phần mềm nào, Typst App là lựa chọn lý tưởng:

1. Truy cập _https://typst.app_
2. Đăng ký tài khoản miễn phí (có thể dùng tài khoản GitHub)
3. Nhấn "New Project" để tạo dự án mới
4. Bắt đầu viết ngay trên trình duyệt

#chu-y[
  *Ưu điểm của Typst App:*
  - Không cần cài đặt gì
  - Cộng tác thời gian thực (như Google Docs)
  - Chia sẻ dự án qua link
  - Tự động lưu trên đám mây

  *Nhược điểm:*
  - Cần kết nối Internet
  - Giới hạn số lượng dự án miễn phí
  - Không tích hợp được vào CI/CD pipeline
]

=== Cài đặt font chữ Toán học

Typst mặc định sử dụng font *New Computer Modern*, font này được thiết kế
dựa trên Computer Modern — font huyền thoại do Donald Knuth tạo ra cho TeX.
New Computer Modern hỗ trợ đầy đủ Unicode và công thức Toán học.

Tuy nhiên, bạn có thể muốn thử các font khác:

- *STIX Two* — font serif chuyên cho Toán học, hỗ trợ ký hiệu đặc biệt
- *Fira Math* — font sans-serif hiện đại, phù hợp cho slide bài giảng
- *Noto Sans Math* — font từ Google, hỗ trợ nhiều ngôn ngữ

Để thay đổi font trong toàn bộ tài liệu:

#code-block[
```typst
// Sử dụng STIX Two
#set text(font: "STIX Two")

// Sử dụng Fira Math cho slide
#set text(font: "Fira Math", size: 16pt)
```
]

== Cấu trúc dự án Typst

=== File đầu vào chính

Một dự án Typst thường có một file chính (entry point), ví dụ `book.typ` hoặc
`main.typ`. File này đóng vai trò như "người chỉ huy" — nó quyết định thứ tự
các phần và import các file con.

=== Tổ chức thư mục chuẩn

Dự án Typst nên được tổ chức theo cấu trúc module, giúp dễ quản lý và cộng tác:

#code-block[
```
du-an/
├── book.typ              # File biên dịch chính
├── typst.toml            # Cấu hình dự án & dependencies
│
├── chuong-01/
│   ├── index.typ         # Nội dung chương
│   ├── muc-1-1.typ       # Tách nhỏ theo mục
│   └── muc-1-2.typ
│
├── assets/
│   ├── style.typ         # Định nghĩa style toàn cục
│   └── figures/          # Hình ảnh minh họa
│
└── data/
    ├── diem.csv          # Dữ liệu ngoài
    └── cau-hoi.json      # Ngân hàng câu hỏi
```
]

=== Import gói từ Typst Universe

Để sử dụng các gói mở rộng, bạn khai báo trong file `.typ`:

#code-block[
```typst
// Import toàn bộ gói
#import "@preview/cetz:0.3.2": *

// Import một hàm cụ thể
#import "@preview/showybox:2.0.4": showybox

// Import với alias
#import "@preview/polylux:0.4.0": slide as trang-slide
```
]

Bạn cũng có thể khai báo dependencies trong `typst.toml` để Typst tự động tải:

#code-block[
```toml
# typst.toml
[dependencies]
cetz = "0.3.2"
polylux = "0.4.0"
```
]

== Quy trình làm việc thực tế

Vòng lặp làm việc với Typst rất nhanh và trực quan:

1. *Viết* — soạn nội dung trong file `.typ` bằng VS Code (hoặc Typst App)
2. *Lưu* — `Cmd+S` (hoặc tự động lưu trên App)
3. *Xem* — kết quả hiển thị tức thì trong cửa sổ preview

Typst sử dụng kỹ thuật biên dịch tăng dần (*incremental compilation*): khi bạn
thay đổi một phần nhỏ, chỉ phần đó và các phần liên quan được biên dịch lại.
Với tài liệu nhỏ đến trung bình, thời gian biên dịch thường *dưới 1 giây*,
tạo ra trải nghiệm gần như thời gian thực.

=== Đọc và xử lý lỗi biên dịch

Khi có lỗi, Typst hiển thị thông báo rất chi tiết:

#code-block[
```
error: unknown variable: xyz
  ┌─ chuong-01/muc-1.typ:12:8
  │
12│ $ a = xyz $
  │        ^^^
  │
  = hint: if you meant to display multiple letters
          as is, try adding spaces: `x y z`
```
]

Mỗi thông báo lỗi gồm:
- *Vị trí*: tên file, số dòng, số cột
- *Mô tả*: lỗi gì xảy ra
- *Gợi ý*: cách sửa lỗi (rất hữu ích cho người mới!)

=== Mẹo gỡ lỗi nhanh

1. *Comment tạm* — dùng `//` để vô hiệu hóa dòng nghi ngờ gây lỗi
2. *Chia nhỏ file* — tách nội dung ra file nhỏ để cô lập lỗi dễ hơn
3. *Kiểm tra cặp ngoặc* — đếm `()`, `[]`, `{}` có cân bằng không
4. *Kiểm tra `$`* — mỗi `$` mở công thức phải có `$` đóng

=== Tổng kết Chương 1

#ghi-nho[
  *Những điều cần nhớ:*

  - Typst là hệ thống soạn thảo tài liệu mã nguồn mở, ra đời từ ETH Zürich năm 2023
  - Typst có cú pháp đơn giản hơn LaTeX, biên dịch nhanh hơn, và có ngôn ngữ lập trình tích hợp
  - Typst CLI để biên dịch locally, Typst App để làm việc trực tuyến
  - VS Code + Tinymist là bộ công cụ được khuyên dùng
  - Dùng `typst compile` để biên dịch, `typst watch` để xem trực tiếp
  - Cấu trúc dự án nên chia theo chương, có `typst.toml` và `assets/style.typ`
]

=== Câu hỏi ôn tập

1. Typst ra đời từ trường đại học nào? Ai là tác giả chính?
2. Nêu 3 điểm khác biệt chính giữa Typst và LaTeX.
3. Sự khác nhau giữa Typst CLI và Typst App là gì?
4. Typst Universe là gì? Nó tương tự với thành phần nào của LaTeX?
5. Khi gặp lỗi biên dịch, bạn nên làm gì đầu tiên?

#pagebreak()
