#import "../assets/style.typ": *

== Cộng tác bằng Git

=== Tại sao Typst + Git là cặp đôi hoàn hảo

Trong thế giới soạn thảo tài liệu, khả năng cộng tác và quản lý
phiên bản là yếu tố sống còn. Typst có lợi thế vượt trội:

- File `.typ` là *plain text* — mỗi thay đổi đều có thể `diff` rõ ràng
- Không có *binary blob* như `.docx` — Git có thể merge tự động
- Cấu trúc module (nhiều file nhỏ) giảm xung đột khi nhiều người cùng làm

#ghi-nho[
  *So sánh Git-friendly:*
  - Typst (.typ): plain text → git diff đọc được → merge dễ
  - LaTeX (.tex): plain text → git diff đọc được → merge dễ
  - Word (.docx): binary ZIP → git diff không đọc được → merge rất khó
]

=== Quy trình Git cho nhóm viết sách

==== Cấu trúc branch đề xuất

#code-block[
```
main
├── draft/chuong-1       ← Người A viết Chương 1
├── draft/chuong-2       ← Người B viết Chương 2
├── draft/chuong-3       ← Người C viết Chương 3
├── fix/typo             ← Sửa lỗi chính tả
├── feat/bai-tap-moi     ← Thêm bài tập mới
└── review/chapter-1     ← Review trước khi merge
```
]

==== Quy trình làm việc

1. Tạo branch từ `main`: `git checkout -b draft/chuong-1`
2. Viết nội dung, commit thường xuyên với message rõ ràng
3. Push lên GitHub: `git push -u origin draft/chuong-1`
4. Tạo Pull Request để đồng nghiệp review
5. Merge vào `main` sau khi được duyệt

==== Commit message convention

#code-block[
```
feat: thêm nội dung mục 3.1 — Đại số tuyến tính
fix: sửa công thức sai ở trang 42 (dấu ±)
docs: cập nhật README với hướng dẫn cài đặt
style: định dạng lại code trong style.typ
refactor: tách hàm dinh-ly ra file riêng
chore: cập nhật typst.toml lên phiên bản 0.14
```
]

=== File .gitignore cho dự án Typst

#code-block[
```
# File PDF đầu ra
*.pdf

# Thư mục biên dịch
/out/
/_output/

# Hệ điều hành
.DS_Store
Thumbs.db

# Editor
.vscode/
.idea/
*.swp
*.swo
```
]

=== Giải quyết conflict

Conflict trong file `.typ` dễ giải quyết vì là text thuần:

#code-block[
```typst
<<<<<<< HEAD
$ a^2 + b^2 = c^2 $   // Định lý Pythagoras
=======
$ a^2 + b^2 = c^2 + d^2 $  // Định lý mở rộng
>>>>>>> draft/chuong-3
```
]

Cách giải quyết: thảo luận với đồng nghiệp, chọn phiên bản đúng,
xóa dấu `<<<<<<<`, `=======`, `>>>>>>>`.

=== GitHub Actions — CI/CD cho Typst

Tự động biên dịch sách mỗi khi push code lên GitHub:

Tạo file `.github/workflows/build.yml`:

#code-block[
```yaml
name: Build Typst Book
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Typst
        uses: typst-community/setup-typst@v3
        with:
          typst-version: '0.14.0'

      - name: Compile book
        run: typst compile book.typ book.pdf

      - name: Upload PDF artifact
        uses: actions/upload-artifact@v4
        with:
          name: typst-book
          path: book.pdf
```
]

Mỗi khi push lên `main`, GitHub sẽ:
1. Cài đặt Typst
2. Biên dịch `book.typ`
3. Upload file PDF để tải về

=== Cộng tác thời gian thực trên Typst App

Ngoài Git, Typst App cung cấp cộng tác thời gian thực
(real-time collaboration), tương tự Google Docs:

- Nhiều người cùng chỉnh sửa một dự án
- Thấy con trỏ và thay đổi của người khác ngay lập tức
- Lịch sử phiên bản tự động lưu
- Có thể comment và gợi ý chỉnh sửa

== Tích hợp với hệ sinh thái rộng hơn

=== Typst + Python

Kết hợp Python để sinh dữ liệu, Typst để trình bày:

#code-block[
```python
# generate_questions.py
import json
import random

questions = []
for i in range(100):
    a = random.randint(1, 10)
    b = random.randint(1, 10)
    questions.append({
        "id": i + 1,
        "noi-dung": f"Tính {a} + {b}",
        "dap-an-dung": str(a + b),
    })

with open("ngan-hang.json", "w") as f:
    json.dump(questions, f, ensure_ascii=False, indent=2)
```
]

Chạy Python script trước, sau đó Typst đọc file JSON đã sinh.

=== Typst + Pandoc

Pandoc — công cụ chuyển đổi tài liệu đa năng:

#code-block[
```bash
# Markdown → Typst
pandoc input.md -o output.typ

# Typst → HTML (hỗ trợ hạn chế)
pandoc input.typ -o output.html
```
]

=== Typst + LaTeX

Khi nào vẫn cần LaTeX:
- arXiv chưa hỗ trợ Typst
- Tạp chí yêu cầu file `.tex` (template `.cls`)
- Đồng tác giả chỉ biết LaTeX

Công cụ chuyển đổi (đang phát triển):
- `tex2typst` — chuyển LaTeX sang Typst (chất lượng hạn chế)
- Chuyển thủ công: viết lại từng phần

=== Tương lai của Typst

Theo lộ trình công khai (roadmap) của Typst:
- HTML output (đã có bản thử nghiệm)
- EPUB output (đang phát triển)
- Hỗ trợ bảng màu CMYK (đã lên kế hoạch)
- Typst 1.0 — phiên bản ổn định đầu tiên (dự kiến 2026)

== Tổng kết Chương 6

#ghi-nho[
  *Những điều cần nhớ:*
  - `typst compile --format pdf` để xuất PDF; `--pdf-standard a-2b` cho PDF/A
  - Thiết lập lề không đối xứng cho sách: trái > phải (gáy)
  - Package cần `typst.toml`, `lib.typ`, `README.md`, `LICENSE`
  - Typst + Git = plain text diff dễ đọc, merge dễ
  - GitHub Actions tự động biên dịch PDF mỗi khi push
  - Kết hợp Python + Typst cho bài toán sinh dữ liệu phức tạp
]

#pagebreak()
