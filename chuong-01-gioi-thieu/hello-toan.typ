#import "../assets/style.typ": *

== Tài liệu Typst đầu tiên — Hello Toán!

=== Cấu trúc tối thiểu

Một file Typst không yêu cầu phần mở đầu phức tạp như LaTeX (`\documentclass`,
`\begin{document}`, ...). Bạn chỉ cần một file với phần mở rộng `.typ` và
bắt đầu viết nội dung ngay lập tức.

#code-block[
```typst
= Định lý Pythagoras

Trong một tam giác vuông, bình phương cạnh huyền
bằng tổng bình phương hai cạnh góc vuông:

$ a^2 + b^2 = c^2 $
```
]

=== Phân tích từng dòng lệnh

Hãy cùng phân tích chi tiết từng dòng trong ví dụ trên:

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  table.header[*Dòng*], table.header[*Ý nghĩa*],
  [`= Định lý Pythagoras`], [`=` tạo tiêu đề cấp 1. Số dấu `=` quyết định cấp tiêu đề:
  `==` cho cấp 2, `===` cho cấp 3, và cứ thế đến `======` cho cấp 6.],
  [`Trong một tam giác vuông...`], [Văn bản thông thường. Đoạn văn mới bắt đầu
  sau một dòng trống. Typst tự động sắp chữ và căn lề.],
  [`$ a^2 + b^2 = c^2 $`], [Công thức Toán *block* (độc lập, căn giữa).
  Dấu `$` có khoảng trắng hai bên nội dung. `a^2` nghĩa là $a$ mũ $2$.],
)

=== Biên dịch lần đầu

Lưu nội dung trên vào file `hello.typ`, mở terminal và chạy:

#code-block[
```bash
# Biên dịch thành PDF
typst compile hello.typ
```
]

Sau lệnh này, bạn sẽ thấy file `hello.pdf` xuất hiện trong cùng thư mục.
Mở file PDF bằng trình xem PDF bất kỳ để kiểm tra kết quả.

=== Chế độ xem trực tiếp (Watch Mode)

Thay vì biên dịch thủ công mỗi lần sửa, bạn nên dùng chế độ *watch*:

#code-block[
```bash
typst watch hello.typ
```
]

Typst sẽ theo dõi file và tự động biên dịch lại mỗi khi bạn lưu. Kết hợp với
VS Code Preview hoặc một trình xem PDF hỗ trợ auto-refresh (như Skim trên macOS),
bạn có thể thấy kết quả *ngay lập tức* sau mỗi lần gõ phím.

=== Ví dụ đầy đủ: Phương trình bậc hai

Cùng thử một ví dụ phức tạp hơn để thấy sức mạnh của Typst:

#code-block[
```typst
= Công thức nghiệm phương trình bậc hai

Phương trình bậc hai tổng quát có dạng:

$ a x^2 + b x + c = 0, quad a != 0 $

trong đó $a$, $b$, $c$ là các hệ số thực.

*Công thức nghiệm:*

$ x_(1,2) = frac(-b ± sqrt(b^2 - 4 a c), 2 a) $

Biểu thức $Delta = b^2 - 4ac$ được gọi là *biệt thức*
(discriminant).

- Nếu $Delta > 0$: hai nghiệm thực phân biệt
- Nếu $Delta = 0$: một nghiệm kép
- Nếu $Delta < 0$: vô nghiệm trên tập số thực
```
]

=== Kết quả đầu ra

Khi biên dịch đoạn code trên, bạn sẽ thấy Typst tự động:
- Định dạng tiêu đề với cỡ chữ phù hợp
- Căn giữa công thức và đánh số (nếu được cấu hình)
- Tạo danh sách có dấu đầu dòng
- Sắp chữ đẹp các phân số và căn thức

=== Bài tập thực hành

*Bài 1.* Tạo file `gioi-thieu.typ` với nội dung giới thiệu bản thân:
họ tên, trường/lớp, chuyên ngành, sở thích. Yêu cầu:
- Dùng ít nhất 2 cấp tiêu đề
- Có 1 danh sách (không thứ tự hoặc có thứ tự)
- Có 1 công thức Toán liên quan đến ngành học của bạn
- Biên dịch và kiểm tra kết quả

*Bài 2.* Sao chép ví dụ "Phương trình bậc hai" ở trên, chạy thử.
Sau đó sửa lại để trình bày công thức nghiệm của phương trình bậc ba
$ a x^3 + b x^2 + c x + d = 0 $ (bạn có thể tra cứu công thức trên Wikipedia
nếu chưa nhớ).

*Bài 3.* So sánh thời gian biên dịch giữa `typst compile` và `typst watch`.
Ghi lại thời gian cho mỗi lần sửa file.

*Bài 4.* Vào typst.app, đăng ký tài khoản và viết lại nội dung Bài 2
trên editor trực tuyến. Xuất file PDF và so sánh kết quả với bản CLI.
Bạn có nhận xét gì về sự khác biệt?

*Bài 5.* Cố ý tạo một lỗi trong file Typst (ví dụ: quên đóng ngoặc, viết sai
ký hiệu). Quan sát thông báo lỗi của Typst. Bạn có hiểu được lỗi không?
Typst gợi ý sửa như thế nào?

#pagebreak()
