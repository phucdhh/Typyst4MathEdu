# 📐 Soạn văn bản Toán bằng Typyst — Hướng dẫn thực hành

> *Soạn thảo công thức, trình bày bài toán và xuất bản tài liệu Toán chuyên nghiệp với Typst*
---

#### Tác giả chính: Nguyễn Đăng Minh Phúc

## Giới thiệu

**Soạn văn bản Toán bằng Typst** là cuốn sách hướng dẫn thực hành dành cho **sinh viên và giáo viên Toán** muốn sử dụng [Typst](https://typst.app) — hệ thống soạn thảo tài liệu thế hệ mới — để tạo ra các tài liệu Toán học đẹp, chuyên nghiệp và dễ bảo trì.

Bản thân cuốn sách này cũng được viết hoàn toàn bằng Typst, vừa là tài liệu học tập, vừa là ví dụ minh họa trực tiếp cho những gì Typst có thể làm được.

---

## ✨ Tại sao Typst?

| Tiêu chí | Typst | LaTeX | Word |
|---|---|---|---|
| Cú pháp | ✅ Đơn giản, dễ đọc | ⚠️ Phức tạp, nhiều lệnh | ✅ Kéo thả |
| Tốc độ biên dịch | ✅ Tức thì (incremental) | ❌ Chậm | ✅ Tức thì |
| Công thức Toán | ✅ Tuyệt vời | ✅ Tiêu chuẩn vàng | ⚠️ Hạn chế |
| Lập trình / tự động hóa | ✅ Có ngôn ngữ scripting | ⚠️ Macro phức tạp | ❌ Macro VBA |
| Mã nguồn mở | ✅ | ✅ | ❌ |
| Đường cong học tập | ✅ Thoải mái | ❌ Dốc | ✅ Thoải mái |

---

## 📚 Cấu trúc sách

```
typst-toan-hoc/
├── README.md                  ← Bạn đang ở đây
├── book.typ                   ← File biên dịch chính
├── typst.toml                 ← Cấu hình dự án
│
├── chuong-01-gioi-thieu/
│   ├── index.typ
│   ├── cai-dat.typ            ← Cài đặt Typst CLI & Typst app
│   └── hello-toan.typ         ← Tài liệu đầu tiên
│
├── chuong-02-co-ban/
│   ├── index.typ
│   ├── van-ban-dinh-dang.typ  ← Văn bản, in đậm, nghiêng, danh sách
│   ├── cong-thuc-noi-tuyen.typ ← Công thức trong dòng: $a^2 + b^2 = c^2$
│   └── cong-thuc-khoi.typ     ← Công thức độc lập, đánh số
│
├── chuong-03-toan-nang-cao/
│   ├── index.typ
│   ├── dai-so.typ             ← Ma trận, hệ phương trình, tổng sigma
│   ├── giai-tich.typ          ← Giới hạn, đạo hàm, tích phân
│   ├── hinh-hoc.typ           ← Vẽ hình với cetz / fletcher
│   └── xac-suat-thong-ke.typ  ← Bảng phân phối, biểu đồ
│
├── chuong-04-trinh-bay/
│   ├── index.typ
│   ├── bai-tap.typ            ← Template bài tập tự luyện
│   ├── de-thi.typ             ← Template đề kiểm tra, đề thi
│   ├── bai-giai.typ           ← Trình bày lời giải chuẩn
│   └── slide-giang-day.typ    ← Slide bài giảng với Polylux
│
├── chuong-05-tu-dong-hoa/
│   ├── index.typ
│   ├── bien-ham.typ           ← Dùng hàm để tái sử dụng cấu trúc
│   ├── du-lieu-ngoai.typ      ← Nhập dữ liệu từ CSV / JSON
│   └── sinh-de-tu-dong.typ    ← Sinh câu hỏi trắc nghiệm tự động
│
├── chuong-06-xuat-ban/
│   ├── index.typ
│   ├── pdf-in-an.typ          ← Xuất PDF chuẩn in ấn
│   ├── chia-se-truc-tuyen.typ ← Đăng lên Typst Universe
│   └── git-cong-tac.typ       ← Cộng tác bằng Git
│
├── phu-luc/
│   ├── cac-ky-hieu-toan.typ   ← Bảng tra ký hiệu Toán thường gặp
│   ├── template-san-co.typ    ← Tổng hợp template có thể dùng ngay
│   └── tai-nguyen-tham-khao.typ
│
└── assets/
    ├── cover.typ              ← Trang bìa
    ├── style.typ              ← Định nghĩa style toàn cục
    └── figures/               ← Hình vẽ, ảnh minh họa
```

---

## 🚀 Bắt đầu nhanh

### 1. Cài đặt Typst

```bash
# macOS (Homebrew)
brew install typst

# Windows (winget)
winget install --id Typst.Typst

# Linux (cargo)
cargo install typst-cli

# Hoặc dùng trực tuyến: https://typst.app
```

### 2. Clone dự án

```bash
git clone https://github.com/phucdhh/Typst4MathEdu.git
cd Typst4MathEdu
```

### 3. Biên dịch sách

```bash
# Biên dịch một lần
typst compile book.typ

# Chế độ xem trực tiếp (auto-reload)
typst watch book.typ
```

### 4. Ví dụ nhanh — Công thức Toán đầu tiên

```typst
= Định lý Pythagoras

Trong tam giác vuông, bình phương cạnh huyền bằng tổng
bình phương hai cạnh góc vuông:

$ a^2 + b^2 = c^2 $

*Ví dụ:* Với $a = 3$, $b = 4$ thì $c = sqrt(9 + 16) = 5$.
```

---

## 🎯 Đối tượng độc giả

- **Sinh viên Toán / Sư phạm Toán** — muốn soạn báo cáo, khóa luận, bài tập lớn
- **Giáo viên Toán THCS / THPT** — cần tạo đề thi, bài tập, tài liệu ôn tập
- **Giảng viên Đại học** — soạn bài giảng, slide, giáo trình
- **Người chuyển từ LaTeX** — muốn trải nghiệm công cụ hiện đại hơn

---

## 📦 Các gói Typst được dùng trong sách

| Gói | Mục đích |
|---|---|
| [`cetz`](https://github.com/cetz-package/cetz) | Vẽ hình hình học, đồ thị hàm số |
| [`fletcher`](https://github.com/Jollywatt/typst-fletcher) | Vẽ sơ đồ mũi tên, lược đồ |
| [`polylux`](https://github.com/andreasKroepelin/polylux) | Tạo slide bài giảng |
| [`pinit`](https://github.com/OrangeX4/pinit) | Chú thích từng phần công thức |
| [`showybox`](https://github.com/Pablo-Gonzalez-Calderon/showybox-package) | Hộp định lý, ví dụ, chú ý |
| [`equate`](https://github.com/typical-mathuser/equate) | Đánh số công thức linh hoạt |

---

## 🤝 Đóng góp

Mọi đóng góp đều được chào đón! Bạn có thể:

- 🐛 Báo lỗi qua [Issues](https://github.com/phucdhh/Typyst4MathEdu/issues)
- 💡 Đề xuất nội dung mới qua [Discussions](https://github.com/phucdhh/Typyst4MathEdu/discussions)
- 📝 Gửi Pull Request để sửa lỗi hoặc bổ sung ví dụ

Vui lòng đọc [`CONTRIBUTING.md`](./CONTRIBUTING.md) trước khi gửi PR.

---

## 📄 Giấy phép

- **Mã nguồn Typst (`.typ`)**: [MIT License](./LICENSE-CODE)
- **Nội dung sách**: [CC BY-SA 4.0](./LICENSE-CONTENT) — bạn được tự do chia sẻ và chỉnh sửa với điều kiện ghi nguồn và giữ cùng giấy phép.

---

## 💬 Liên hệ & Cộng đồng

- 📧 Email: `ndmphuc@hueuni.edu.vn`
- 🇻🇳 Nhóm Typst Việt Nam: *(sắp ra mắt)*

---

<p align="center">
  <em>Được viết bằng ❤️ và Typst · Dành cho cộng đồng Toán học Việt Nam</em>
</p>
