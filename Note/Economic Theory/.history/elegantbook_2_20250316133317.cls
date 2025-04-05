%%%%%%%%%%%%%%%%%%%%%%
%% Start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%% This work may be distributed and/or modified freely
%% Available at https://github.com/ElegantLaTeX/ElegantBook
%% Revised by Wenxiao Yang: 2024/09/24
%%%%%%%%%%%%%%%%%%%%%%

% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2022/08/15 v4.4 ElegantBook document class]

% Required packages and options
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[blue]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}

% Backward compatibility
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}
\DeclareBoolOption[false]{usesamecnt}

\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}

\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

\DeclareStringOption[chapter]{thmcnt}
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}

% Default Options
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper,oneside]{book}

% Required packages
\RequirePackage{setspace}
\RequirePackage{csquotes}
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage{indentfirst,comment}
\RequirePackage{graphicx}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}
\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}
\RequirePackage{titlesec}
\RequirePackage{appendix}
\RequirePackage{tcolorbox}
\RequirePackage{listings}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage{anyfontsize}
\RequirePackage{enumitem}
\RequirePackage{mwe}
\RequirePackage{adforn}
\RequirePackage{apptools}
\RequirePackage{tocloft}

% Hyperref setup
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={ElegantBook},
  colorlinks,
  linkcolor=winered,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}

% Geometry settings
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
  \ifdefstring{\ELEGANT@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm, right=7cm
    }
  }{\relax}
}{\relax}

\ifdefstring{\ELEGANT@device}{pad}{
  \geometry{
    paperwidth=7.5in, 
    paperheight=10in,
    margin=16mm,
    headheight=2.17cm,
    footskip=4mm
  }
}{\relax}

% Font settings
\ifpdftex
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.90]{helvet}
\else
  \RequirePackage[no-math]{fontspec}
  \setmainfont{TeXGyreTermesX}[
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Extension = .otf,
    Scale = 1.0
  ]
  \setsansfont{texgyreheros}[
    UprightFont = *-regular,
    BoldFont = *-bold,
    ItalicFont = *-italic,
    BoldItalicFont = *-bolditalic,
    Extension = .otf,
    Scale = 0.9
  ]
\fi

% Additional commands
\newcommand{\dollar}{\mbox{\textdollar}}
\newcommand{\email}[1]{\href{mailto:#1}{\nolinkurl{#1}}}
\newcommand{\question}[1]{{\par\citshape #1}\\[0.2ex]}
\newcommand{\figref}[1]{\textbf{Figure}~\ref{#1}}
\newcommand{\tabref}[1]{\textbf{Table}~\ref{#1}}

% Page style
\fancyhf{}
\fancyfoot[c]{\color{structurecolor}\small\thepage}
\if@twoside
  \fancyhead[EL]{\color{structurecolor}\cnormal\leftmark}
  \fancyhead[OR]{\color{structurecolor}\cnormal\rightmark}
\else
  \fancyhead[R]{\color{structurecolor}\cnormal\rightmark}
\fi
\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{1pt}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}

% Table of contents
\renewcommand\tableofcontents{%
  \hypersetup{linktoc=all, linkcolor=black}
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\contentsname
      \@mkboth{%
         \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \ifdefstring{\ELEGANT@toc}{twocol}{
    \setlength{\columnsep}{2em}
    \begin{multicols}{2}%
      \@starttoc{toc}
    \end{multicols}}{
    \@starttoc{toc}}
  \if@restonecol\twocolumn\fi
  \hypersetup{linkcolor=winered}
}

% Additional settings and environments omitted for brevity
