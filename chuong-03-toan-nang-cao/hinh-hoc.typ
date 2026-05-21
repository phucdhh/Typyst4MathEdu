#import "../assets/style.typ": *

== Hình học và đồ họa với cetz

=== Giới thiệu cetz

`cetz` là gói vẽ hình vector mạnh mẽ dành cho Typst, tương tự như *TikZ/PGF*
trong LaTeX nhưng có cú pháp đơn giản hơn nhiều. Gói này được phát triển
bởi cộng đồng Typst và đã trở thành lựa chọn hàng đầu cho vẽ hình Toán học.

Cài đặt:

#code-block[
```typst
#import "@preview/cetz:0.3.2": canvas, draw
```
]

Mọi hình vẽ đều được đặt trong khối `canvas`. Canvas hoạt động như một
hệ tọa độ Descartes với gốc ở góc dưới bên trái (mặc định).

=== Canvas — Hệ tọa độ

#code-block[
```typst
#canvas({
  // Tọa độ (x, y)
  // Gốc: (0, 0) — góc dưới bên trái
  // Các lệnh vẽ ở đây...
})
```
]

=== Các lệnh vẽ cơ bản trong cetz

==== Vẽ điểm và gán nhãn

#code-block[
```typst
#canvas({
  let A = draw.point((0, 0), name: "A")
  let B = draw.point((4, 0), name: "B")
  let C = draw.point((0, 3), name: "C")

  draw.content(A, $A$, anchor: "north-west")
  draw.content(B, $B$, anchor: "north-east")
  draw.content(C, $C$, anchor: "south")
})
```
]

==== Vẽ đoạn thẳng

#code-block[
```typst
#canvas({
  draw.line((0, 0), (4, 0))   // trục hoành
  draw.line((0, 0), (0, 3))   // trục tung
  draw.line((4, 0), (0, 3))   // cạnh huyền

  // Đường thẳng với style
  draw.line(
    (-1, 0), (5, 0),
    stroke: (paint: red, thickness: 1pt)
  )
})
```
]

==== Vẽ đường tròn

#code-block[
```typst
#canvas({
  // Đường tròn tâm (0,0) bán kính 2
  draw.circle((0, 0), radius: 2)

  // Đường tròn tô màu
  draw.circle((3, 0), radius: 1, fill: gray, stroke: blue)
})
```
]

==== Vẽ hình chữ nhật

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

Bài toán: Vẽ tam giác $ABC$ vuông tại $A$ với $AB = 4$, $AC = 3$.

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

*Bài 1.* Vẽ tam giác $ABC$ vuông tại $A$ với $AB = 4$, $AC = 3$.
Tính và ghi chú độ dài cạnh huyền $BC$. Vẽ đường tròn ngoại tiếp tam giác.

*Bài 2.* Vẽ đồ thị hàm $y = x^2$ và $y = sqrt(x)$ trên cùng hệ trục tọa độ.
Tô màu khác nhau cho mỗi đồ thị. Thêm lưới tọa độ và nhãn trục.

*Bài 3.* Vẽ hình minh họa Định lý Ceva: tam giác $ABC$ với các đường
đồng quy $AD$, $BE$, $CF$. Đánh dấu điểm đồng quy.

*Bài 4.* Dùng fletcher vẽ sơ đồ khối giải phương trình bậc hai:
Input → Tính $Delta$ → Kiểm tra $Delta$ → Output (nghiệm).

*Bài 5.* Vẽ hình minh họa bài toán: "Cho hình chóp $S.ABCD$ có đáy
$ABCD$ là hình vuông cạnh $a$, $SA$ vuông góc với đáy". Vẽ rõ nét khuất,
tô màu mặt đáy.

#pagebreak()
