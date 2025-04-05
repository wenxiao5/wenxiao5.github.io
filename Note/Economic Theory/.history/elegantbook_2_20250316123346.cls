% elegantbook.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2023/10/01 Optimized ElegantBook Document Class]

% 核心宏包加载
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}

% 颜色选项
\DeclareStringOption[blue]{color}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}

% 基础配置
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper,oneside]{book}

% 页面布局
\RequirePackage{geometry}
\geometry{
  a4paper,
  top=25.4mm, bottom=25.4mm,
  left=20mm, right=20mm,
  headheight=2.17cm,
  headsep=4mm,
  footskip=12mm
}

% 字体配置
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{amsmath,amsfonts,amssymb}

% 超链接与颜色
\RequirePackage[table]{xcolor}
\definecolor{structurecolor}{RGB}{60,113,183}
\definecolor{main}{RGB}{0,166,82}
\definecolor{second}{RGB}{255,134,24}
\definecolor{third}{RGB}{0,174,247}
\definecolor{winered}{RGB}{153,0,0}

\RequirePackage{hyperref}
\hypersetup{
  bookmarksnumbered=true,
  colorlinks=true,
  linkcolor=winered,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false
}

% 定理环境
\RequirePackage[many]{tcolorbox}
\tcbset{
  theoremstyle/.style={
    enhanced,
    colback=second!5,
    colframe=second!80,
    fonttitle=\bfseries,
    top=8pt,
    before skip=8pt,
    breakable,
    left=5pt
  },
  definitionstyle/.style={
    enhanced,
    colback=main!5,
    colframe=main!80,
    fonttitle=\bfseries,
    top=8pt,
    before skip=8pt,
    breakable,
    left=5pt
  }
}

\newtcbtheorem{theorem}{Theorem}{theoremstyle}{thm}
\newtcbtheorem{definition}{Definition}{definitionstyle}{def}
\newtcbtheorem{proof}{Proof}{theoremstyle}{prf}

% 章节样式
\RequirePackage{titlesec}
\titleformat{\chapter}[display]
  {\normalfont\bfseries\color{structurecolor}}
  {\filcenter\LARGE\bfseries\color{structurecolor}\chaptertitlename\ \thechapter}
  {20pt}{\LARGE\bfseries\filcenter}

% 列表环境
\RequirePackage{enumitem}
\setlist{nolistsep, leftmargin=*}

% 图表标题
\RequirePackage{caption}
\captionsetup{labelfont={bf,color=structurecolor}, margin=10pt}

% 页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}
\fancyfoot[C]{\small\thepage}

% 文档元数据
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\@institute}{}
\newcommand{\institute}[1]{\gdef\@institute{#1}}

% 封面设计
\newcommand{\maketitle}{
  \begin{titlepage}
    \begin{center}
      \vspace*{3cm}
      {\Huge\bfseries \@title}\\[1cm]
      {\Large \@subtitle}\\[2cm]
      {\large \@author}\\[1cm]
      {\itshape \@institute}\\[3cm]
      \vfill
      {\large \@date}
    \end{center}
  \end{titlepage}
}

% 保留核心命令
\newcommand{\question}[1]{\par\textit{#1}\\[0.5ex]}
\newcommand{\figref}[1]{Figure~\ref{#1}}
\newcommand{\tabref}[1]{Table~\ref{#1}}

% 代码列表设置
\RequirePackage{listings}
\lstset{
  basicstyle=\ttfamily\small,
  breaklines=true,
  frame=single,
  rulecolor=\color{structurecolor},
  backgroundcolor=\color{white}
}
