#import "../assets/style.typ": *
== Hình học và đồ họa với cetz

=== Cài đặt gói cetz

#code-block[
```typst
#import "@preview/cetz:0.3.2": canvas, draw
```
]

cetz là gói vẽ hình vector cho Typst, tương tự TikZ trong LaTeX.

=== Canvas

Mọi hình vẽ đều nằm trong khối `canvas`:

#code-block[
```typst
#canvas({
  // Các lệnh vẽ ở đây
})
```
]

=== Các lệnh vẽ cơ bản

==== Điểm

#code-block[
```typst
#canvas({
  draw.point((0, 0), name: "A")
  draw.point((3, 0), name: "B")
  draw.point((1, 2), name: "C")
})
```
]

==== Đoạn thẳng

#code-block[
```typst
#canvas({
  draw.line((0, 0), (3, 0))
  draw.line((0, 0), (1, 2))
  draw.line((3, 0), (1, 2))
})
```
]

==== Đường tròn

#code-block[
```typst
#canvas({
  draw.circle((0, 0), radius: 2)
  draw.circle((2, 1), radius: 1, stroke: blue)
})
```
]

==== Hình chữ nhật

#code-block[
```typst
#canvas({
  draw.rect((0, 0), (3, 2))
  draw.rect((-1, -1), (1, 1), fill: gray)
})
```
]

=== Ví dụ: Tam giác vuông

#code-block[
```typst
#canvas({
  draw.line((0, 0), (4, 0))   // cạnh đáy
  draw.line((0, 0), (0, 3))   // cạnh cao
  draw.line((4, 0), (0, 3))   // cạnh huyền
  // Ký hiệu góc vuông
  draw.line((0, 0), (0.5, 0))
  draw.line((0, 0), (0, 0.5))
  draw.line((0.5, 0), (0, 0.5))
})
```
]

=== Nhãn và chú thích

Dùng `content` để thêm nhãn cho các điểm:

#code-block[
```typst
#canvas({
  let A = draw.point((0, 0), name: "A")
  let B = draw.point((4, 0), name: "B")
  let C = draw.point((0, 3), name: "C")
  draw.line(A, B)
  draw.line(A, C)
  draw.line(B, C)
  draw.content(A, $A$, anchor: "north-east")
  draw.content(B, $B$, anchor: "north-west")
  draw.content(C, $C$, anchor: "south")
})
```
]

=== Vẽ đồ thị hàm số

cetz có thể vẽ đồ thị hàm số:

#code-block[
```typst
#canvas({
  import draw: *

  // Vẽ trục tọa độ
  line((-3, 0), (3, 0))
  line((0, -2), (0, 5))

  // Vẽ đồ thị hàm y = x^2
  let f(x) = x * x
  for x in range(-2.8, 2.8, 0.1) {
    line((x, f(x)), (x + 0.1, f(x + 0.1)))
  }
})
```
]

=== Vẽ sơ đồ với fletcher

#code-block[
```typst
#import "@preview/fletcher:0.5.7": *

#canvas({
  node((0, 0), [$f(x)$])
  node((3, 0), [$g(x)$])
  edge((0, 0), (3, 0), label: $h$, "arrow")
})
```
]

fletcher hữu ích để vẽ sơ đồ khối, lược đồ thuật toán, đồ thị hàm hợp.

=== Bài tập thực hành

*Bài 1.* Vẽ tam giác ABC vuông tại A với AB = 4, AC = 3. Ghi chú độ dài các cạnh.

*Bài 2.* Vẽ đường tròn ngoại tiếp tam giác ABC (tâm O, bán kính R). Đánh dấu tâm O.

*Bài 3.* Vẽ đồ thị hàm $y = sin x$ và $y = cos x$ trên cùng hệ trục tọa độ, trong khoảng $[-2pi, 2pi]$.

*Bài 4.* Vẽ hình minh họa định lý Ceva: tam giác ABC với các đường đồng quy AD, BE, CF.

*Bài 5.* Dùng fletcher vẽ sơ đồ khối giải phương trình bậc hai $a x^2 + b x + c = 0$.
