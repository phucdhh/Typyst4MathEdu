#import "../assets/style.typ": *
== Cộng tác bằng Git

=== Tại sao Typst + Git là cặp đôi hoàn hảo

File `.typ` là plain text — mỗi thay đổi đều có thể *diff* được rõ ràng.
Không có binary blob như `.docx` khiến việc merge trở nên khó khăn.

=== Quy trình Git cơ bản cho nhóm

==== Cấu trúc branch đề xuất

- `main` — nhánh chính, luôn ở trạng thái ổn định
- `draft/chuong-1` — nhánh viết nháp chương 1
- `draft/chuong-2` — nhánh viết nháp chương 2
- `fix/loi-chinh-ta` — sửa lỗi chính tả
- `feat/them-bai-tap` — thêm bài tập mới

==== File .gitignore cho Typst

#code-block[
```
# Typst
*.pdf
/out/
/_output/

# OS
.DS_Store
Thumbs.db

# Editor
.vscode/
.idea/
```
]

==== Commit message convention

#code-block[
```
feat: thêm chương 3 — Toán học nâng cao
fix: sửa công thức sai ở trang 42
docs: cập nhật README.md
style: định dạng lại code
refactor: tách style.typ thành module nhỏ
```
]

=== Giải quyết conflict

Conflict trong file `.typ` dễ giải quyết hơn `.docx` vì:
- Nội dung là text thuần, dễ đọc
- Có thể dùng merge tool của Git
- Tách file nhỏ để giảm xung đột

Ví dụ conflict:

#code-block[
```
<<<<<<< HEAD
Công thức: $a^2 + b^2 = c^2$
=======
Công thức: $a^2 + b^2 = c^2 + d^2$
>>>>>>> branch-2
```
]

=== GitHub Actions — Tự động biên dịch

File `.github/workflows/typst.yml`:

#code-block[
```yaml
name: Build Typst Document
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: typst-community/setup-typst@v3
      - run: typst compile book.typ
      - uses: actions/upload-artifact@v4
        with:
          name: book-pdf
          path: book.pdf
```
]

=== Cộng tác trên Typst App

- Hỗ trợ real-time collaboration (nhiều người cùng viết)
- Lịch sử phiên bản tự động
- Chia sẻ qua link

=== Bài tập thực hành

*Bài 1.* Khởi tạo Git repository cho dự án Typst, tạo `.gitignore` phù hợp.

*Bài 2.* Tạo nhánh `draft/chuong-1`, viết nội dung, commit và merge vào `main`.

*Bài 3.* Thiết lập GitHub Actions tự động biên dịch `book.typ` và upload PDF mỗi khi push.

#pagebreak()
