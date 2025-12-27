
// 字体
#let font = (
  main: "IBM Plex Serif",
  mono: "IBM Plex Mono",
  cjk: "Noto Serif CJK SC",
)

// 图标
#let icon(path, fill: rgb("#000000")) = box(
  // baseline: 0.125em,
  height: 0.7em,
  width: 1.25em,
  align(
    center + horizon,
    image(bytes(read(path).replace("path d", "path fill=\"" + fill.to-hex() + "\" d")), height: 1em),
  ),
)

#let fa-angle-right = icon("../public/icons/fa-angle-right.svg")

// 主体
#let resume(
  size: 10pt,
  theme-color: rgb("#26267d"),
  margin: (
    top: 1.5cm,
    bottom: 2cm,
    left: 2cm,
    right: 2cm,
  ),
  photograph: "",
  photograph-width: 0em,
  gutter-width: 0em,
  header-center: false,
  header,
  introduction,
  body,
) = {
  // 页边距设定
  set page(paper: "a4", numbering: none, margin: margin)

  // 基础字体设定
  set text(font: (font.main, font.cjk), size: size, lang: "en")

  // 标题及小标题样式
  show heading: set text(theme-color, 1.1em)

  // 二级标题下加一条横线
  show heading.where(level: 2): it => stack(
    v(0.3em),
    it,
    v(0.6em),
    line(length: 100%, stroke: 0.05em + theme-color),
    v(0.1em),
  )

  // 更改 bullet list 的图标
  // set list(indent: 1em, body-indent: 0.8em, marker: faAngleRight)
  // 上面的语句无法精确控制图标位置, 因此改用了下列方法重写 list
  show list: it => stack(
    spacing: 0.4em,
    ..it.children.map(item => {
      grid(
        columns: (2em, 1fr),
        gutter: 0em,
        box({
          h(0.75em)
          fa-angle-right
        }),
        pad(top: 0.15em, item.body),
      )
    }),
  )

  // 链接颜色
  show link: set text(fill: theme-color)

  // 主体设定
  set par(justify: true, spacing: 1em)

  // 首部与照片

  if header-center {
    assert(photograph == "", message: "can not centerize the name with the photo")
    align(alignment.center, header)
    introduction
  } else {
    grid(
      columns: (auto, 1fr, photograph-width),
      gutter: (gutter-width, 0em),
      [#header #introduction],
      if photograph != "" {
        image(photograph, width: photograph-width)
      },
    )
  }

  body
}


// 带竖线的侧边栏
#let sidebar(side, content, with-line: true, side-width: 12%) = layout(size => {
  let side-size = measure(width: size.width, height: size.height, side)
  let content-size = measure(width: size.width * (100% - side-width), height: size.height, content)
  let height = calc.max(side-size.height, content-size.height) + 0.5em
  grid(
    columns: (side-width, 0%, 1fr),
    gutter: 0.75em,
    {
      set align(right)
      v(0.25em)
      side
      v(0.25em)
    },
    if with-line { line(end: (0em, height), stroke: 0.05em) },
    {
      v(0.25em)
      content
      v(0.25em)
    },
  )
})

// 个人信息
#let info(
  color: black,
  ..infos,
) = {
  set text(font: (font.mono, font.cjk), fill: color)
  set par(justify: false)
  infos
    .pos()
    .map(dir => {
      box({
        if "icon" in dir {
          if type(dir.icon) == str {
            icon(dir.icon)
          } else {
            dir.icon
          }
        }
        h(0.15em)
        if "link" in dir {
          link(dir.link, dir.content)
        } else {
          dir.content
        }
      })
    })
    .join(h(0.5em) + "·" + h(0.5em))
  v(0.5em)
}


// 日期： 颜色变灰
#let date(body) = text(
  fill: rgb(128, 128, 128),
  size: 0.9em,
  body,
)


// 技术: 字体变细
#let tech(body) = block({
  set text(weight: "extralight")
  body
})

// 项目
#let item(
  title,
  desc,
  endnote,
) = {
  v(0.25em)
  grid(
    columns: (30%, 1fr, auto),
    gutter: 0em,

    title, desc, endnote,
  )
}

#let item1(
  title,
  desc,
  endnote,
) = {
  v(0.25em)
  grid(
    columns: (52%, 3fr, auto),
    gutter: 3em,
    align: center + horizon,
    title, desc, endnote,
  )
}


// 主题颜色
#let theme-color = rgb("#26267d")
#let icon = icon.with(fill: theme-color)

// 设置图标, 来源: https://fontawesome.com/icons/
#let fa-award = icon("../public/icons/fa-award.svg")
#let fa-building-columns = icon("../public/icons/fa-building-columns.svg")
#let fa-code = icon("../public/icons/fa-code.svg")
#let fa-envelope = icon("../public/icons/fa-envelope.svg")
#let fa-github = icon("../public/icons/fa-github.svg")
#let fa-graduation-cap = icon("../public/icons/fa-graduation-cap.svg")
#let fa-linux = icon("../public/icons/fa-linux.svg")
#let fa-phone = icon("../public/icons/fa-phone.svg")
#let fa-windows = icon("../public/icons/fa-windows.svg")
#let fa-wrench = icon("../public/icons/fa-wrench.svg")
#let fa-work = icon("../public/icons/fa-work.svg")
#let iconfont-objective = icon("../public/icons/iconfont-Objective.svg")
#let iconfont-iflytek = icon("../public/icons/spark.svg")
#let iconfont-huawei = icon("../public/icons/iconfont-huawei.svg")

#let java = icon("../public/icons/java.svg")
#let python = icon("../public/icons/python.svg")

#let javascript = icon("../public/icons/javascript.svg")
#let typescript = icon("../public/icons/typescript.svg")

#let vue = icon("../public/icons/vue.svg")
#let nodejs = icon("../public/icons/nodejs.svg")
#let cplusplus = icon("../public/icons/cplusplus.svg")

#let typst = icon("../public/icons/linux-typst.svg")

=== 📝 Publications

#table(
  columns: (0.8in, 1fr),
  stroke: none,
  column-gutter: 0.2in,
  inset: (x: 0pt, y: 3pt),
  align: (x, y) => (left, left).at(x),

  [*[arXiv]*],
  [#link(
    "https://arxiv.org/abs/2511.14218",
  )[Bridging the Gap Between Bayesian Deep Learning and Ensemble Weather Forecasts]],

  [], [Xinlei Xiong, Wenbo Hu, Shuxun Zhou, Kaifeng Bi, Lingxi Xie, Ying Liu, Richang Hong, Qi Tian],
  [], [_arXiv_, 2025],
  [], [],

  // [*[NeurIPS2020]*], [#link("https://arxiv.org/abs/2006.11239")[Denoising Diffusion Probabilistic Models]],
  // [], [Jonathan Ho, Ajay Jain, Pieter Abbeel],
  // [], [_Neural Information Processing Systems (NeurIPS)_, 2020],
  // [], [],

  // [*[arXiv]*], [#link("https://arxiv.org/abs/1707.06347")[Proximal Policy Optimization Algorithms]],
  // [], [John Schulman, Filip Wolski, Prafulla Dhariwal, Alec Radford, Oleg Klimov],
  // [], [_arXiv_, 2017],
  // [], [],

  // [*[NeurIPS2017]*], [#link("https://arxiv.org/abs/1706.03762")[Attention Is All You Need]],
  // [],
  // [Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Lukasz Kaiser, Illia Polosukhin],

  // [], [_Neural Information Processing Systems (NeurIPS)_, 2017],
  // [], [],
)


== #fa-graduation-cap Educational Background
#sidebar(with-line: true, side-width: 24%)[
  2025.09-2028.06
][
  *合肥工业大学* · *计算机科学与技术* //计算机科学与技术
]
#sidebar(with-line: true, side-width: 24%)[
  2021.09-2025.06
][
  *华北理工大学* · *智能科学与技术* //智能科学与技术
]


// === 🎓 Education
// - _Ph.D. in Computer Science_, State University, City, State #h(1fr) Sep 2005 -- Aug 2010\
// - _B.S. in Computer Science_, Public University, City, State #h(1fr) Sep 1999 -- June 2003 \


// === 🎖️ Awards & Honors
// - Excellence in Machine Learning Research Award #h(1fr) 2014 \
// - Distinguished Graduate Fellowship, Computer Science Department #h(1fr) 2013 \
// - Best Paper Award, International Conference on AI Systems #h(1fr) 2012 \
// - Research Innovation Grant, University Research Council #h(1fr) 2013 \
// - Conference Participation Award #h(1fr) 2012
// - Peer Review Excellence Recognition #h(1fr) 2012
// - Academic Achievement Scholarship #h(1fr) 2009
// - Merit-Based Graduate Scholarship #h(1fr) 2008

== #fa-award Honor and Awards

#item1(
  [ *第九/十/十一届全国大学生统计建模大赛* ],
  [ *省一/省一/国三* ],
  date[2025.10],
)

#item1(
  [ *2023MCM/2024 ICM 美国大学生数学建模竞赛* ],
  [ *Honorable/Meritorious* ],
  date[2024.05],
)

#item1(
  [ *第八/九届高校计算机大赛-团体程序设计天梯赛* ],
  [ *国二/国三* ],
  date[2023.04/2024.04],
)



// === 💼 Professional Experiences

// *TechCorp Research*, Boston, MA #h(1fr) July 2009 -- Dec 2009
//   - _Machine Learning Research Intern_, Developed efficient neural network architectures for computer vision applications
//   - Mentor: Dr. Sarah Johnson

// *DataSystems Inc.*, Austin, TX #h(1fr) May 2008 -- Aug 2008
//   - _Software Engineering Intern_, Built scalable data processing pipelines for recommendation systems
//   - Mentor: Michael Rodriguez

// *AI Innovations Lab*, Portland, OR #h(1fr) Sept 2007 -- April 2008
//   - _Research Assistant_, Implemented graph-based machine learning algorithms for social network analysis
//   - Mentor: Prof. Jennifer Lee

// *CloudTech Solutions*, Denver, CO #h(1fr) May 2007 -- Aug 2007
//   - _Data Science Intern_, Analyzed large-scale datasets and developed predictive models for business applications
//   - Mentor: David Kim








// === 📝 Professional Services

// *Area Chair*: MLCONF 2015, ICLR 2014

// *Program Committee/Reviewer*: COMPCONF 2014; DATACONF 2014; ALGOCONF 2013; SYSCONF 2012, 2013; MLCONF 2012, 2013, 2015; AICONF 2011, 2012, 2013, 2014; TECHCONF 2011, 2013; NetConf 2013; STATSCONF 2013; DMCONF 2012; GRAPHCONF 2013;




