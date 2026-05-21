# Contributing

Cảm ơn bạn đã quan tâm đến dự án Typst4MathEdu! Dưới đây là hướng dẫn để đóng góp nội dung, sửa lỗi và cải thiện dự án.

## 1. Hướng dẫn chung

- Fork repository và tạo branch riêng để phát triển.
- Đặt tên branch rõ ràng: `fix/<mô-tả>`, `feature/<mô-tả>`, `docs/<mô-tả>`.
- Luôn giữ repository chính `main` sạch sẽ, chỉ merge các PR đã review.

## 2. Nội dung đóng góp

### Mục đích
Dự án tập trung vào:
- Hướng dẫn xây dựng tài liệu Toán bằng Typst.
- Ví dụ thực hành cho sinh viên và giáo viên Toán.
- Template, bài tập và tài liệu giảng dạy.

### Thêm/chỉnh sửa nội dung
- Mỗi chương nên có:
  - Giới thiệu mục tiêu
  - Ví dụ thực tế
  - Bài tập cuối chương
  - Tóm tắt và câu hỏi ôn tập
- Viết bằng tiếng Việt, dùng thuật ngữ Toán học chuẩn.
- Hạn chế sử dụng nhiều chữ in hoa không cần thiết.

## 3. Cú pháp Typst và định dạng

- Giữ các file `.typ` rõ ràng, dễ đọc.
- Mỗi file nên có cấu trúc nội dung rõ ràng và các ghi chú nếu cần.
- Nếu thêm gói mới, cập nhật `typst.toml` và README nếu cần.

## 4. Gửi Pull Request

1. Fork repository.
2. Tạo branch mới từ `main`.
3. Thực hiện thay đổi.
4. Commit với thông điệp rõ ràng.
5. Push lên fork và tạo Pull Request.

### Tiêu chí PR
- Mô tả rõ ràng mục đích PR.
- Liên kết đến issue nếu có.
- Nếu sửa lỗi hoặc thêm nội dung, nêu rõ phần nào được cập nhật.
- Nếu thêm tính năng mới, mô tả cách kiểm tra.

## 5. Kiểm tra trước khi gửi PR

- Kiểm tra lại nội dung chính tả và định dạng.
- Đảm bảo các file `.typ` vẫn biên dịch được nếu có thay đổi cú pháp.
- Không commit file biên dịch hoặc output sinh tự động (`*.pdf`, `_output/`, v.v.).

## 6. Ghi chú về bản quyền

- Mọi nội dung trong repository bị áp dụng giấy phép trong `LICENSE.md`.
- Giữ nguyên ghi chú bản quyền khi tái sử dụng mã nguồn hoặc nội dung.

---

Cảm ơn bạn đã đóng góp! Nếu cần hỗ trợ, hãy mở issue hoặc gửi bình luận trực tiếp trong Pull Request.
