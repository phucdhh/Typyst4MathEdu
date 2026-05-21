#import "../assets/style.typ": *

== Tài liệu Typst đầu tiên

Giờ là lúc bắt tay viết! Phần này sẽ hướng dẫn bạn từng bước tạo tài liệu Typst
đầu tiên có chứa công thức Toán học. Bạn sẽ thấy rõ sự khác biệt giữa code bạn gõ
và kết quả hiển thị trong file PDF.

=== Cấu trúc tối thiểu

Điểm khác biệt đầu tiên bạn nhận ra khi chuyển từ LaTeX sang Typst: *không cần phần khai báo
(preamble) phức tạp*. Với LaTeX, bạn phải có `\documentclass`, `\usepackage`, rồi mới đến
`\begin{document}` ... `\end{document}`. Với Typst, bạn chỉ cần mở file `.typ` và bắt đầu viết:

#code-preview(
  ```typst
= Định lý Pythagoras

Trong một tam giác vuông, bình phương cạnh huyền
bằng tổng bình phương hai cạnh góc vuông:

$ a^2 + b^2 = c^2 $
  ```,
  [
    *1  Định lý Pythagoras*
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.3em)
    Trong một tam giác vuông, bình phương cạnh huyền bằng tổng bình phương hai cạnh góc vuông:

    $ a^2 + b^2 = c^2 $
  ]
)

#v(0.5em)

Để hiểu rõ từng dòng lệnh, hãy xem bảng phân tích dưới đây:

#figure(
  table(
    columns: (auto, 1fr),
    stroke: 0.5pt,
    fill: (_, row) => if row == 0 { rgb("#f0f3f4") } else { white },
    table.header([*Cú pháp*], [*Ý nghĩa*]),
    [`= Định lý Pythagoras`], [Dấu `=` giúp tạo tiêu đề cấp 1. Chúng ta thêm các dấu `=` nữa để vào cấp sâu hơn: `==` là mục lớn, `===` là mục con.],
    [`Trong một tam giác...`], [Văn bản thông thường. Đoạn văn mới bắt đầu sau một dòng trống.],
    [`$ a^2 + b^2 = c^2 $`], [Công thức Toán (độc lập, căn giữa). Dấu `$` cần có *khoảng trắng* hai bên. `a^2` là mã khi gõ, còn $a^2$ là kết quả hiển thị.],
  ),
  caption: [Giải thích từng cú pháp trong ví dụ đầu tiên],
)

=== Biên dịch lần đầu

Lưu nội dung trên vào file `hello.typ`, mở terminal trong thư mục chứa file và chạy:

#code-block[
```bash
typst compile hello.typ
# → Tạo ra file hello.pdf cùng thư mục
```
]

Nếu dùng VS Code với Tinymist, bạn không cần chạy lệnh thủ công — preview cập nhật
tự động mỗi khi lưu file (`Cmd+S` / `Ctrl+S`).

=== Chế độ xem trực tiếp (Watch Mode)

Khi làm việc lâu dài, hãy dùng chế độ *watch* thay vì `compile` thủ công mỗi lần:

#code-block[
```bash
typst watch hello.typ
# → Typst theo dõi file, tự động biên dịch lại mỗi khi bạn lưu
# → Nhấn Ctrl+C để thoát
```
]

Kết hợp với trình xem PDF hỗ trợ auto-refresh (Skim trên macOS, SumatraPDF trên Windows), bạn thấy kết quả gần như ngay lập tức sau mỗi lần gõ phím.

=== Ví dụ đầy đủ: Phương trình bậc hai

Cùng thử một ví dụ phức tạp hơn để thấy sức mạnh của Typst trong việc trình bày văn bản Toán. Hãy gõ đoạn code dưới đây và biên dịch:

#code-preview(
  ```typst
= Công thức nghiệm phương trình bậc hai

Phương trình bậc hai tổng quát có dạng:

$ a x^2 + b x + c = 0, quad a != 0 $

trong đó $a$, $b$, $c$ là các hệ số thực.

*Công thức nghiệm (Viet):*

$ x_(1,2) = frac(-b ± sqrt(b^2 - 4 a c), 2 a) $

Biểu thức $Delta = b^2 - 4 a c$ gọi là *biệt thức*.

- Nếu $Delta > 0$: hai nghiệm thực phân biệt
- Nếu $Delta = 0$: một nghiệm kép $x = -b/(2a)$
- Nếu $Delta < 0$: vô nghiệm trên $RR$
  ```,
  [
    *1  Công thức nghiệm phương trình bậc hai*
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.3em)

    Phương trình bậc hai tổng quát có dạng:
    $ a x^2 + b x + c = 0, quad a != 0 $
    trong đó $a$, $b$, $c$ là các hệ số thực.

    *Công thức nghiệm (Viet):*
    $ x_(1,2) = frac(-b plus.minus sqrt(b^2 - 4 a c), 2 a) $

    Biểu thức $Delta = b^2 - 4 a c$ gọi là *biệt thức*.

    - Nếu $Delta > 0$: hai nghiệm thực phân biệt
    - Nếu $Delta = 0$: một nghiệm kép $x = -b/(2a)$
    - Nếu $Delta < 0$: vô nghiệm trên $RR$
  ]
)

#ghi-nho[
  Nhìn vào ví dụ trên, bạn thấy sự khác biệt rõ ràng giữa *công thức inline* (như
  $a$, $b$, $c$ nằm trong dòng văn bản) và *công thức block* (như công thức nghiệm
  nằm trên dòng riêng, căn giữa). Quy tắc:
  - Inline: `$biểu thức$` (dấu `$` liền với nội dung)
  - Block: `$ biểu thức $` (có khoảng trắng trước và sau nội dung)
]

=== Bài tập thực hành

*Bài 1.* Tạo file `gioi-thieu.typ` với nội dung giới thiệu bản thân: họ tên, trường/lớp, chuyên ngành. Yêu cầu: dùng ít nhất 2 cấp tiêu đề, có 1 danh sách, có 1 công thức Toán.

*Bài 2.* Gõ lại ví dụ "Phương trình bậc hai" ở trên và biên dịch. Thử thay đổi dấu hiệu `±` bằng cách gõ `plus.minus` (tên trong Typst), sau đó biên dịch lại và kiểm tra xem có gì thay đổi không.

*Bài 3.* Cố ý tạo một lỗi nhỏ trong file Typst (ví dụ: quên đóng dấu `$`, hoặc viết `sqr(x)` thay vì `sqrt(x)`). Quan sát thông báo lỗi mà Typst hiển thị. Bạn có đọc hiểu được thông báo lỗi không?

*Bài 4.* Vào `typst.app`, đăng ký tài khoản và viết lại nội dung Bài 2 trên editor trực tuyến. So sánh trải nghiệm làm việc trên web với CLI.

#pagebreak()
