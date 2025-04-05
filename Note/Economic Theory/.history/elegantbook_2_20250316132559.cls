% elegantbook-en.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook-en}[2024/06/25 Optimized English ElegantBook]

%% 核心设置
\LoadClass[a4paper,oneside]{book}
\RequirePackage{geometry}
\geometry{
  a4paper,
  top=25.4mm, bottom=25.4mm,
  left=20mm, right=20mm,
  headheight=2.17cm,
  headsep=4mm,
  footskip=12mm
}

%% 颜色方案（支持用户覆盖）
\RequirePackage[table]{xcolor}
\definecolor{structurecolor}{RGB}{60,113,183}  % 默认主蓝
\definecolor{main}{RGB}{0,166,82}              % 默认主题绿
\definecolor{second}{RGB}{255,134,24}         % 强调橙色
\definecolor{third}{RGB}{0,174,247}           % 高亮蓝
\definecolor{winered}{RGB}{179,27,27}         % 标志红

%% 字体设置
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{fontspec}
\setmainfont{TeXGyreTermesX}[
  Extension = .otf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic]

%% 超链接设置
\RequirePackage[bookmarksnumbered]{hyperref}
\hypersetup{
  colorlinks,
  linkcolor=structurecolor,
  citecolor=second,
  urlcolor=third
}

%% 定理环境增强
\RequirePackage[many]{tcolorbox}
\tcbset{
  theoremstyle/.style={
    enhanced,
    colback=white,
    boxrule=0.8pt,
    colframe=structurecolor,
    arc=2mm,
    fonttitle=\bfseries\sffamily,
    separator sign={.},
    before title={\rule[-1.2ex]{2pt}{4.5ex}\quad}
  }
}

\NewDocumentCommand{\elegantnewtheorem}{m m m g}{%
  \IfValueTF{#4}
    {\tcbset{new/usecnt/.style={use counter from=#4}}}
    {\tcbset{new/usecnt/.style={}}}%
  \DeclareTColorBox[auto counter,number within=section]{#1}{ g o }{
    theoremstyle,#3,
    IfValueTF={##1}{title={#2~\thetcbcounter\ (##1)}}{title={#2~\thetcbcounter}},
    IfValueT={##2}{label={#2:##2}},
    new/usecnt
  }
}

\elegantnewtheorem{theorem}{Theorem}{}
\elegantnewtheorem{definition}{Definition}{}
\elegantnewtheorem{example}{Example}{}
\elegantnewtheorem{proof}{Proof}{prostyle}{Proof}
\elegantnewtheorem{claim}{Claim}{prostyle}{Claim}

%% 页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\small\color{structurecolor}\nouppercase\rightmark}
\fancyfoot[C]{\small\color{structurecolor}\thepage}
\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}

%% 章节样式
\RequirePackage{titlesec}
\titleformat{\chapter}[display]
{\bfseries\Huge\color{structurecolor}}
{\filright\MakeUppercase{\chaptertitlename}\ \thechapter}
{20pt}
{\filleft}[\vspace{1ex}{\titlerule[1.5pt]}]

%% 列表环境
\RequirePackage{enumitem}
\setlist{itemsep=0pt, topsep=4pt}
\setlist[enumerate]{label=\color{structurecolor}\arabic*.}
\setlist[itemize]{label=\color{structurecolor}\textbullet}

%% 代码列表
\RequirePackage{listings}
\lstset{
  basicstyle=\ttfamily\small,
  keywordstyle=\color{winered},
  commentstyle=\color{main},
  numbers=none,
  frame=single,
  rulecolor=\color{structurecolor!30}
}

%% 封面系统
\RequirePackage{tikz}
\newcommand{\cover}[1]{\gdef\@cover{#1}}
\newcommand{\maketitlepage}{%
  \begin{titlepage}
  \begin{tikzpicture}[remember picture,overlay]
    \ifdefined\@cover
      \node[anchor=north west,inner sep=0pt] at (current page.north west)
        {\includegraphics[width=\paperwidth]{\@cover}};
    \else
      \node[anchor=north west, 
            xshift=2cm, 
            yshift=-2cm] 
            at (current page.north west) 
            {\Huge\bfseries\color{structurecolor}\@title};
    \fi
    
    \node[anchor=south east,
          xshift=-2cm,
          yshift=2cm] 
          at (current page.south east) 
          {\parbox{0.6\textwidth}{\raggedleft
              \large\color{structurecolor!80}
              \@author\\[1ex]
              \@date}};
  \end{tikzpicture}
  \end{titlepage}
}

%% 元数据命令
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}

%% 数学运算符
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator{\col}{col}

%% 文档初始化
\AtBeginDocument{
  \linespread{1.6}
  \setlength{\parindent}{0pt}
  \setlength{\footskip}{20pt}
}

\endinput