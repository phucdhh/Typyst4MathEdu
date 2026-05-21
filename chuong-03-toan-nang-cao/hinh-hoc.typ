#import "../assets/style.typ": *
#import "@preview/cetz:0.3.4": canvas, draw

== Hình học và đồ họa với cetz

Một tài liệu Toán học chuyên nghiệp không thể thiếu hình vẽ. Hình minh hoạ giúp học sinh
hình dung khái niệm trừu tượng, làm rõ quan hệ hình học và làm đẹp trang sách.
Trong Typst, gói `cetz` (viết tắt của _CErtified TyZ_) là công cụ vẽ hình vector
mạnh mẽ nhất — tương đương với TikZ trong LaTeX nhưng cú pháp đơn giản và nhất quán hơn nhiều.

=== Giới thiệu cetz

`cetz` cho phép vẽ điểm, đoạn thẳng, đường tròn, cung, hình chữ nhật, đường cong
Bezier, và gán nhãn cho mọi đối tượng. Kết quả là hình vector hoàn hảo trong file PDF.

#code-block[
```typst
// Cài đặt: thêm vào đầu file
#import "@preview/cetz:0.3.4": canvas, draw
```
]

Mọi hình vẽ được đặt trong khối `canvas`. Canvas hoạt động như một hệ tọa độ Descartes
với gốc ở góc dưới bên trái (mặc định).

=== Canvas — Hệ tọa độ

#code-block[
```typst
#canvas({
  // Tọa độ (x, y): x tăng sang phải, y tăng lên trên
  // Gốc (0, 0) ở góc dưới bên trái
  // Các lệnh vẽ đặt ở đây...
})
```
]

=== Các lệnh vẽ cơ bản trong cetz

*Vẽ điểm và gán nhãn:*

#code-block[
```typst
#canvas({
  draw.circle((0, 0), radius: 0.05, fill: black, name: "A")
  draw.circle((4, 0), radius: 0.05, fill: black, name: "B")
  draw.circle((0, 3), radius: 0.05, fill: black, name: "C")

  draw.content("A", $A$, anchor: "north-east")
  draw.content("B", $B$, anchor: "north-west")
  draw.content("C", $C$, anchor: "south-east")
})
```
]

*Vẽ đoạn thẳng và tam giác:*

#code-block[
```typst
#canvas({
  import draw: *
  line((0, 0), (4, 0))    // cạnh đáy
  line((0, 0), (0, 3))    // cạnh đứng
  line((4, 0), (0, 3))    // cạnh huyền
  
  // Đánh dấu góc vuông
  rect((0, 0), (0.3, 0.3), stroke: black)
})
```
]

#figure(
  canvas(length: 0.7cm, {
    import draw: *
    line((0, 0), (4, 0))
    line((0, 0), (0, 3))
    line((4, 0), (0, 3))
    line((0, 0.35), (0.35, 0.35))
    line((0.35, 0), (0.35, 0.35))
    content((0, 0), $A$, anchor: "north-east")
    content((4, 0), $B$, anchor: "north-west")
    content((0, 3), $C$, anchor: "south-east")
    content((2, -0.3), $4$)
    content((-0.3, 1.5), $3$)
  }),
  caption: [Tam giác vuông $A B C$ với ký hiệu góc vuông tại $A$],
)

*Vẽ đường tròn và cung:*

#code-block[
```typst
#canvas({
  import draw: *
  // Đường tròn tâm O bán kính 2
  circle((0, 0), radius: 2, stroke: blue)
  
  // Tô màu hình tròn
  circle((4, 0), radius: 1, fill: rgb("#eafaf1"), stroke: green)
  
  // Vẽ cung từ 0° đến 90°
  arc((0, 0), start: 0deg, stop: 90deg, radius: 1.5)
})
```
]

#ghi-nho[
  Khi vẽ hình phức tạp, hãy chia nhỏ thành các phần và test từng phần.
  Dùng `draw.content((x, y), [nhãn])` để thêm chú thích vào hình.
  Xem thêm tài liệu đầy đủ của cetz tại `typst.app/universe/package/cetz`.
]

=== Ví dụ: Tam giác vuông và đường tròn ngoại tiếp

#code-block[
```typst
#canvas({
  import draw: *
  // Tam giác vuông ABC, A ở gốc
  line((0, 0), (4, 0))   // AB
  line((0, 0), (0, 3))   // AC
  line((4, 0), (0, 3))   // BC
  // Góc vuông tại A
  line((0.4, 0), (0.4, 0.4))
  line((0, 0.4), (0.4, 0.4))
  // Nhãn
  content((0, 0), $A$, anchor: "north-east")
  content((4, 0), $B$, anchor: "north-west")
  content((0, 3), $C$, anchor: "south-east")
  // Đường tròn ngoại tiếp: tâm là trung điểm BC
  circle((2, 1.5), radius: 2.5, stroke: blue)
})
```
]

#figure(
  canvas(length: 0.7cm, {
    import draw: *
    line((0, 0), (4, 0))
    line((0, 0), (0, 3))
    line((4, 0), (0, 3))
    line((0, 0.4), (0.4, 0.4))
    line((0.4, 0), (0.4, 0.4))
    content((0, 0), $A$, anchor: "north-east")
    content((4, 0), $B$, anchor: "north-west")
    content((0, 3), $C$, anchor: "south-east")
    circle((2, 1.5), radius: 2.5, stroke: blue)
    circle((2, 1.5), radius: 0.06, fill: blue)
    content((2.15, 1.5), $O$, anchor: "west")
  }),
  caption: [Tam giác vuông $A B C$ và đường tròn ngoại tiếp — tâm $O$ là trung điểm $B C$],
)

=== Bài tập (Hình học với cetz)

*Bài 1.* Vẽ tam giác đều $"ABC"$ cạnh $a = 4$. Đánh dấu đường trung tuyến
từ đỉnh $A$ xuống cạnh $"BC"$.

*Bài 2.* Vẽ đồ thị $y = x^2$ và $y = sqrt(x)$ trên cùng hệ trục.
Tô màu vùng nằm giữa hai đồ thị.

*Bài 3.* Vẽ sơ đồ khối (dùng `fletcher`) mô tả thuật toán
giải phương trình bậc hai.

#pagebreak()


#code-block[
```typst
#canvas({
  draw.rect((0, 0), (3, 2))                 // hình chữ nhật rỗng
  draw.rect((-1, -1), (1, 1), fill: gray)   // hình chữ nhật tô màu
})
```
]

==== Vẽ cung tròn và đường cong

#code-block[
```typst
#canvas({
  // Cung tròn
  draw.arc((0, 0), start: 0deg, stop: 90deg, radius: 2)

  // Đường cong Bezier
  draw.bezier((0, 0), (1, 2), (2, 0), (3, 1))
})
```
]

=== Ví dụ hoàn chỉnh: Tam giác vuông với ký hiệu góc vuông

Bài toán: Vẽ tam giác $"ABC"$ vuông tại $A$ với $"AB" = 4$, $"AC" = 3$.

#code-block[
```typst
#canvas({
  // Tọa độ các đỉnh
  let A = draw.point((0, 0), name: "A")
  let B = draw.point((4, 0), name: "B")
  let C = draw.point((0, 3), name: "C")

  // Vẽ các cạnh
  draw.line(A, B)
  draw.line(A, C)
  draw.line(B, C)

  // Ký hiệu góc vuông tại A
  draw.line((0.5, 0), (0.5, 0.5))
  draw.line((0, 0.5), (0.5, 0.5))

  // Gán nhãn
  draw.content(A, $A$, anchor: "north-east")
  draw.content(B, $B$, anchor: "north-west")
  draw.content(C, $C$, anchor: "south-east")

  // Ghi chú độ dài cạnh
  draw.content((2, -0.4), $4$, anchor: "north")
  draw.content((-0.4, 1.5), $3$, anchor: "east")
})
```
]

=== Vẽ đồ thị hàm số

cetz có thể vẽ đồ thị hàm số bằng cách nối các điểm rời rạc:

#code-block[
```typst
#canvas({
  // Vẽ trục tọa độ
  draw.line((-3, 0), (3, 0))   // trục x
  draw.line((0, -1), (0, 5))   // trục y

  // Vẽ đồ thị y = x^2 (parabol)
  let f(x) = x * x
  for x in range(-2.5, 2.6, 0.1) {
    draw.line((x, f(x)), (x + 0.1, f(x + 0.1)))
  }
})
```
]

=== Ví dụ: Đồ thị hàm sin và cos

#code-block[
```typst
#canvas({
  // Trục
  draw.line((-4, 0), (4, 0))
  draw.line((0, -1.5), (0, 1.5))

  // y = sin x
  for x in range(-3, 3, 0.05) {
    draw.line(
      (x, calc.sin(x)),
      (x + 0.05, calc.sin(x + 0.05)),
      stroke: blue,
    )
  }

  // y = cos x
  for x in range(-3, 3, 0.05) {
    draw.line(
      (x, calc.cos(x)),
      (x + 0.05, calc.cos(x + 0.05)),
      stroke: red,
    )
  }
})
```
]

#figure(
  canvas(length: 1cm, {
    import draw: *
    // Trục tọa độ
    line((-3.5, 0), (3.5, 0))
    line((0, -1.5), (0, 1.6))
    content((3.7, 0.15), $x$)
    content((0.15, 1.7), $y$)
    // Vẽ y = sin x
    let dx = 6.28 / 60
    for i in range(60) {
      let x = -3.14 + i * dx
      line((x, calc.sin(x)), (x + dx, calc.sin(x + dx)), stroke: blue)
    }
    // Vẽ y = cos x
    for i in range(60) {
      let x = -3.14 + i * dx
      line((x, calc.cos(x)), (x + dx, calc.cos(x + dx)), stroke: red)
    }
    // Chú thích
    line((0.5, 1.35), (1.0, 1.35), stroke: blue)
    content((1.05, 1.35), [#text(fill: blue)[$y = sin x$]], anchor: "west")
    line((0.5, 1.0), (1.0, 1.0), stroke: red)
    content((1.05, 1.0), [#text(fill: red)[$y = cos x$]], anchor: "west")
  }),
  caption: [Đồ thị $y = sin x$ (xanh) và $y = cos x$ (đỏ) trên đoạn $[-pi, pi]$],
)

=== Vẽ sơ đồ với fletcher

Gói `fletcher` chuyên dùng để vẽ sơ đồ khối, lược đồ, đồ thị mũi tên:

#code-block[
```typst
#import "@preview/fletcher:0.5.7": *

#canvas({
  let f = node((0, 0), [$f$])
  let g = node((3, 0), [$g$])
  let h = node((6, 0), [$h$])

  edge(f, g, label: $arrow(f)$)
  edge(g, h, label: $arrow(g)$)
})
```
]

=== Bảng tọa độ các điểm đặc biệt trong tam giác

| Điểm | Vị trí | Giao điểm của |
|------|--------|--------------|
| Trọng tâm $G$ | $G = frac(A + B + C, 3)$ | Ba đường trung tuyến |
| Trực tâm $H$ | Giao điểm ba đường cao | Ba đường cao |
| Tâm ngoại tiếp $O$ | Cách đều ba đỉnh | Ba đường trung trực |
| Tâm nội tiếp $I$ | Cách đều ba cạnh | Ba đường phân giác |

=== Bài tập thực hành (Hình học)

*Bài 1.* Vẽ tam giác $"ABC"$ vuông tại $A$ với $"AB" = 4$, $"AC" = 3$.
Tính và ghi chú độ dài cạnh huyền $"BC"$. Vẽ đường tròn ngoại tiếp tam giác.

*Bài 2.* Vẽ đồ thị hàm $y = x^2$ và $y = sqrt(x)$ trên cùng hệ trục tọa độ.
Tô màu khác nhau cho mỗi đồ thị. Thêm lưới tọa độ và nhãn trục.

*Bài 3.* Vẽ hình minh họa Định lý Ceva: tam giác $"ABC"$ với các đường
đồng quy $"AD"$, $"BE"$, $"CF"$. Đánh dấu điểm đồng quy.

*Bài 4.* Dùng fletcher vẽ sơ đồ khối giải phương trình bậc hai:
Input → Tính $Delta$ → Kiểm tra $Delta$ → Output (nghiệm).

*Bài 5.* Vẽ hình minh họa bài toán: "Cho hình chóp $"S.ABCD"$ có đáy
$"ABCD"$ là hình vuông cạnh $a$, $"SA"$ vuông góc với đáy". Vẽ rõ nét khuất,
tô màu mặt đáy.

#pagebreak()
