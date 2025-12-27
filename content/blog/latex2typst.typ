#import "/content/blog.typ": *
#import "/src/3rd_party/mathyml/lib.typ" as mathyml
#import mathyml.prelude: *

#show: main.with(
  title: "Equivalent Typst Function Names of LaTeX Commands",
  desc: "从 LaTeX 命令到 Typst 函数的等价名称",
  date: "2025-12-27",
  tags: (
    "programming",
    "typst",
    "latex",
  ),
  author: "Jianrui Lyu(tolvjr@163.com)",
  show-outline: true,
)


#let num_pages = 5
#for page in range(1, num_pages + 1) {
  image("assets/Latex2typst.pdf", width: 100%, page: page)
}

