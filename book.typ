#import "assets/style.typ": *

#include "assets/cover.typ"

#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm))

#pagebreak()

#align(center, text(size: 20pt, weight: "bold", fill: primary-color)[Mục lục])
#v(1em)
#show outline.entry.where(level: 1): it => {
  v(0.4em, weak: true)
  text(fill: primary-color, weight: "bold")[#it]
}
#outline(
  title: none,
  indent: auto,
)

#pagebreak()

#heading(level: 1, numbering: none)[Lời nói đầu]

Toán học là ngôn ngữ khả dĩ mô tả được vũ trụ. Từ những phương trình mô tả quỹ đạo hành tinh của Kepler,
đến các khai triển chuỗi vô hạn của Euler, đến những bất đẳng thức tinh tế trong lý thuyết số —
tất cả đều cần được viết ra, được trình bày, được truyền đạt. Và để làm điều đó, người làm Toán
cần một công cụ soạn thảo xứng tầm.

Trong nhiều thập kỷ, LaTeX đã là tiêu chuẩn không thể thay thế cho cộng đồng khoa học và giáo dục.
Những ai đã từng dùng LaTeX đều biết cảm giác khi nhìn vào file PDF: công thức sắc nét, bố cục
hoàn hảo, typography đẹp đến từng chi tiết. Nhưng cũng không ai không biết cảm giác bỏ ra nửa buổi
chỉ để gỡ một lỗi biên dịch, hoặc phải cài đặt cả TeX Live với hàng chục gigabyte chỉ để viết
một tài liệu ngắn.

*Typst* ra đời để thay đổi điều đó.

Được phát triển từ năm 2019 bởi nhóm nghiên cứu tại ETH Zürich và công bố rộng rãi từ năm 2023,
Typst giữ lại tất cả những điều tốt nhất của LaTeX — khả năng soạn thảo công thức Toán học
chuẩn mực, kiểm soát hoàn toàn bố cục trang in — trong khi loại bỏ hầu hết những phức tạp không
cần thiết. Typst biên dịch tức thì, cú pháp dễ đọc, dễ học, và chỉ cần một file thực thi ~40MB
để chạy trên mọi hệ điều hành.

Cuốn sách này được viết dành cho *sinh viên, giáo viên và người yêu Toán* — những người
muốn tận dụng sức mạnh của Typst để tạo ra tài liệu Toán học đẹp, chuyên nghiệp và dễ bảo trì.
Bạn không cần biết gì về Typst, về LaTeX, hay về lập trình trước khi đọc cuốn sách này. Chúng tôi
sẽ đưa bạn từ bước đầu tiên — cài đặt phần mềm, viết dòng code Typst đầu tiên — đến những kỹ thuật
nâng cao như tự động hóa đề thi, tạo slide bài giảng, và xuất bản tài liệu chuyên nghiệp.

Một điểm đặc biệt của cuốn sách: mỗi đoạn code đều đi kèm *kết quả biên dịch* hiển thị ngay bên
dưới. Bạn không chỉ đọc code trừu tượng — bạn thấy ngay code đó tạo ra kết quả gì, và có thể
copy-paste để thử ngay trên máy tính của mình.

Chúng tôi tin rằng học qua ví dụ thực hành là cách hiệu quả nhất. Vì vậy mỗi chương đều có
bài tập từ đơn giản đến nâng cao, giúp bạn củng cố kiến thức vừa học và phát triển kỹ năng
soạn thảo Toán học bằng Typst một cách tự nhiên.

Chúc bạn đọc vui và sớm tạo ra những tài liệu Toán học thật đẹp!

#v(1.5em)
#align(right)[
  _Tác giả_ \
  Nguyễn Đăng Minh Phúc
]

== Cách đọc sách hiệu quả

- Đọc theo thứ tự từ Chương 1 đến Chương 6 nếu bạn là người mới bắt đầu.
- Nếu đã biết Typst cơ bản, bạn có thể nhảy thẳng đến Chương 3 hoặc Chương 5.
- Mỗi chương đều có bài tập thực hành — hãy làm chúng ngay trên máy tính của bạn.
- Các ví dụ code đều đi kèm kết quả biên dịch để bạn dễ hình dung.

== Quy ước trong sách

- *In đậm*: thuật ngữ quan trọng, khái niệm mới lần đầu xuất hiện.
- _In nghiêng_: thuật ngữ tiếng Anh được giữ nguyên bản.
- `Code inline`: tên lệnh, hàm, hoặc cú pháp Typst.
- Hộp màu xanh đậm (*Ghi nhớ*): những điểm cốt lõi cần ghi nhớ.
- Hộp màu cam (*Ví dụ*): minh hoạ thực tế từng khái niệm.
- Hộp màu đỏ (*Chú ý*): cảnh báo lỗi thường gặp và cách tránh.
- Hộp *Code Typst / Kết quả biên dịch*: luôn đi theo cặp để bạn thấy rõ input và output.

#pagebreak()

#heading(level: 1, numbering: none)[Giới thiệu tổng quan]

Đây là cuốn sách thực hành về Typst dành riêng cho bối cảnh giảng dạy và học Toán tại Việt Nam.
Cuốn sách được tổ chức thành 6 chương chính và 3 phụ lục, đi từ cơ bản đến nâng cao:

*Chương 1 — Giới thiệu Typst:* Tại sao nên dùng Typst? So sánh với LaTeX và Microsoft Word.
Cài đặt môi trường làm việc trên Windows, macOS và Linux. Viết tài liệu đầu tiên trong 5 phút.

*Chương 2 — Cú pháp cơ bản:* Văn bản, định dạng chữ, tiêu đề, danh sách. Công thức Toán
inline và block. Bảng biểu và hình ảnh. Thiết lập bố cục trang.

*Chương 3 — Toán học nâng cao:* Ma trận, định thức, hệ phương trình (Đại số tuyến tính).
Giới hạn, đạo hàm, tích phân (Giải tích). Hình học tọa độ và vector. Xác suất và Thống kê.

*Chương 4 — Trình bày tài liệu giáo dục:* Soạn đề thi, phiếu bài tập có lời giải chi tiết.
Trình bày bài giảng và slide với Typst. Định dạng chuyên nghiệp cho tài liệu giảng dạy.

*Chương 5 — Tự động hóa với Typst:* Hàm và biến trong Typst scripting. Đọc dữ liệu từ file
CSV/JSON. Sinh đề thi tự động từ ngân hàng câu hỏi. Lập trình Typst nâng cao.

*Chương 6 — Xuất bản và Cộng tác:* Xuất PDF chất lượng in ấn. Chia sẻ tài liệu trực tuyến.
Làm việc nhóm với Git. Đóng gói và chia sẻ template Typst.

*Phụ lục A — Bảng ký hiệu Toán học:* Tra cứu nhanh tất cả ký hiệu từ sơ cấp đến đại học.

*Phụ lục B — Template sẵn dùng:* Các template đề thi, giáo án, slide để dùng ngay.

*Phụ lục C — Tài nguyên tham khảo:* Sách, website, cộng đồng Typst tiếng Việt và quốc tế.

#v(1em)
#ghi-nho[
  Tất cả ví dụ trong sách đều được kiểm tra với *Typst phiên bản 0.13+*.
  Nếu bạn dùng phiên bản cũ hơn, một số lệnh có thể có cú pháp khác.
  Hãy kiểm tra phiên bản bằng lệnh `typst --version` trong terminal.
]

#pagebreak()

// Reset heading counter về 0 để Chương 1 bắt đầu từ "1"
#counter(heading).update(0)

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
