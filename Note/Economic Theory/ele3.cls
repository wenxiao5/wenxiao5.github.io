%%%%%%%%%%%%%%%%%%%%%%
%% elegantbook.cls
%% 优化版本只包含英文和normal device设置
%%%%%%%%%%%%%%%%%%%%%%

% 设置LaTeX2e文档格式
\NeedsTeXFormat{LaTeX2e}

% 提供文档类及其版本信息
\ProvidesClass{elegantbook}[2022/08/15 v4.4 ElegantBook document class]

% 引入选项处理所需的宏包
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

% 初始化选项配置
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% 默认颜色为蓝色
\DeclareStringOption[blue]{color}

% 语言选项只保留英文
\DeclareStringOption[en]{lang}

% 模式选择，默认是fancy
\DeclareStringOption[fancy]{mode}

% 设备设置只使用normal
\RequirePackage{geometry}
\geometry{
  a4paper,
  top=25.4mm, bottom=25.4mm,
  left=20mm, right=20mm,
  headheight=2.17cm,
  headsep=4mm,
  footskip=12mm
}

% 加载文档类并定义一些默认的类选项
\LoadClass[a4paper,oneside]{book}

% 字体和编码设置
\RequirePackage{setspace}
\RequirePackage{csquotes}
\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={ElegantBook},
  colorlinks,
  linkcolor=blue,
  citecolor=blue,
  urlcolor=blue,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}

% 字体设置
\RequirePackage{iftex}
\ifpdftex
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.90]{helvet}
\else
  \RequirePackage[no-math]{fontspec}
  \setmainfont{TeXGyreTermesX}[
    UprightFont = *-Regular ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic ,
    Extension = .otf ,
    Scale = 1.0]
  \setsansfont{texgyreheros}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 0.9]
\fi

% 定义邮件链接命令
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% 默认选项处理（保留考试题目类型选项）
\DeclareStringOption[chapter]{thmcnt}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

% 加载数学和图形相关宏包
\RequirePackage{amsmath,amssymb,mathrsfs,amsfonts}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}

% 标题样式和页眉页脚设置
\RequirePackage{fancyhdr}
\fancyhf{}
\fancyfoot[c]{\small\thepage}
\fancyhead[R]{\rightmark}

% 加载颜色宏包用于格式设定 
\RequirePackage[table]{xcolor}
\definecolor{structurecolor}{RGB}{60,113,183}
\definecolor{main}{RGB}{0,166,82}
\definecolor{second}{RGB}{255,134,24}
\definecolor{third}{RGB}{0,174,247}

% 定义标题风格
\DeclareStringOption[hang]{titlestyle}[hang]
\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\bfseries\color{structurecolor} \thechapter}{1pt}{
  \LARGE\bfseries\color{structurecolor}\filcenter}[5pt]
\titleformat{\section}[hang]{\bfseries}{
  \Large\bfseries\color{structurecolor}\thesection\enspace}{1pt}{%
  \color{structurecolor}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}

% 设置章节标题间距
\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}

% 定义环节环境和风格
\RequirePackage{tcolorbox}
\tcbset{
  common/.style={
    lower separated=false,
    coltitle=white,
    colback=gray!4,
    boxrule=0.1pt,
    fonttitle=\bfseries,
    enhanced,
    breakable,
    top=8pt,
    before skip=8pt,
    separator sign={.},
  },
  defstyle/.style={
    common,
    colframe=main!80,
    colback=main!4,
    colbacktitle=main,
    frame style={left color=main},
    overlay={
      \draw[main!80, line width=2.5pt] (frame.north west) -- (frame.south west);
    },
  },
  thmstyle/.style={
    common,
    colframe=second!80,
    colback=second!4,
    colbacktitle=second,
    frame style={left color=second},
    overlay={
      \draw[second!80, line width=2.5pt] (frame.north west) -- (frame.south west);
    },
  }
}

% 定义新定理环境
\NewDocumentCommand \elegantnewtheorem { m m m g O{} }{
  \expandafter\def\csname #1name\endcsname{#2}
  \DeclareTColorBox[#1]{#1}{ g o }{
    common,#3,
    IfValueT={##1}{title={#2~\thetcbcounter ##1}}
  }
}

% 定义常见文献环境 
\elegantnewtheorem{theorem}{Theorem}{thmstyle}
\elegantnewtheorem{definition}{Definition}{defstyle}
\elegantnewtheorem{corollary}{Corollary}{thmstyle}
\elegantnewtheorem{lemma}{Lemma}{thmstyle}

% 页面设置
\hypersetup{pageanchor=false}
\pagenumbering{Alph}
\begin{titlepage}
  \newgeometry{margin = 0in}
  \parindent=0pt
  \includegraphics[width=\linewidth]{example-image} % 去掉封面设置
  \setlength{\fboxsep}{0pt}
  \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
  \vfill
  \hspace{2em}
  \parbox{0.8\textwidth}{
    \bfseries\Huge\@title
  }
  \vfill
  \vspace{-1cm}
  \setstretch{2.5}
  \hspace{2.5em}
  \begin{minipage}[c]{0.67\linewidth}
    {\color{darkgray}\normalsize
    \begin{tabular}{l}
      \ifx\@author\empty\else\textbf{Author: }\@author\\ \fi
      \ifx\@date\empty\else\textbf{Date: }\@date \\ \fi
    \end{tabular}}
  \end{minipage}
  \vfill
\end{titlepage}
\restoregeometry

% 设置章节目录格式
\RequirePackage{tocloft}
\cftsetindents{chapter}{0em}{3em}
\cftsetindents{section}{3em}{3em}
\cftsetindents{subsection}{6em}{3em}

% 设置目录标题样式
\renewcommand\cftchapterfont{\Large\bfseries}
\renewcommand\cftsectionfont{\large\bfseries}
\renewcommand\cftchapterpagefont{\Large\bfseries}
\renewcommand\cftsectionpagefont{\large\bfseries}

% 定制抽象环境
\newenvironment{eabstract}{%
  \cleardoublepage
  \begin{center}
    \bfseries\LARGE Abstract
  \end{center}
  \vspace{1.5em}
  \begin{quote}
}{%
  \end{quote}
  \cleardoublepage
}

% 定制附录样式
\newcommand{\elegantappendix}{%
  \appendix
  \titleformat{\chapter}%
    [display]%
    {\bfseries\LARGE}%
    {Appendix \thechapter}{10pt}{\LARGE\bfseries}
  \titlespacing*{\chapter}
    {0pt}{0pt}{20pt}
}

% 在页脚添加版权信息
\newcommand\copyrightnotice{
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
    \footnotesize
    \textcopyright\ \@date\ by \@author.\\
    All Rights Reserved.
  \end{center}
  \vfill
}

% 默认字体大小等信息
\def\ELEGANT@defaultfontsize{12pt}
\RequirePackage[\ELEGANT@defaultfontsize]{extsizes}

% 主函数入口，开始文档
\newcommand{\elegantstart}{
  \mainmatter
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

% 结束函数
\newcommand{\elegantend}{
  \backmatter
  \pagestyle{plain}
  \listoffigures
  \listoftables
  \printindex
}

% 启动并初始化
\LoadClassWithOptions{article}
\InitializeELEGANTOptions

