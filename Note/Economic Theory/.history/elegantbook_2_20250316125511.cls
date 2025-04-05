%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
%% Revised by Wenxiao Yang: 2024/09/24
%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2022/08/15 v4.4 ElegantBook document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[blue]{color}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}

% ----- backward compatibility -----
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{cm}{\ekv{math=cm}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}
\DeclareVoidOption{onecol}{\ekv{toc=onecol}}

\ProcessKeyvalOptions*\relax
\LoadClass[a4paper,oneside]{book}

\RequirePackage{setspace}
\RequirePackage{csquotes}
\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  colorlinks,
  linkcolor=winered,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}

% Device settings
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
}{\relax}

% Font settings
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{fontspec}
\setmainfont{TeXGyreTermes}[
  Extension = .otf,
  UprightFont = *-regular,
  BoldFont = *-bold,
  ItalicFont = *-italic
]
\RequirePackage[scaled=.90]{helvet}

% Colors
\RequirePackage[table]{xcolor}
\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{structurecolor}{RGB}{60,113,183}
  \definecolor{main}{RGB}{0,166,82}
  \definecolor{second}{RGB}{255,134,24}
  \definecolor{third}{RGB}{0,174,247}
}{\relax}

% Title Style
\RequirePackage[center,pagestyles]{titlesec}
\titleformat{\chapter}[hang]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{structurecolor}\thechapter\;}}{1pt}{
  \LARGE\bfseries\color{structurecolor}\filcenter}[]

% Theorem-like environments
\RequirePackage{amsthm}
\newtheoremstyle{thmstyle}{3pt}{3pt}{\itshape}{-3pt}{
  \bfseries\color{second}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\theoremstyle{thmstyle}
\newtheorem{theorem}{Theorem}[chapter]

% Page style
\RequirePackage{fancyhdr}
\fancyhf{}
\fancyfoot[c]{\color{structurecolor}\small\thepage}
\fancyhead[R]{\color{structurecolor}\rightmark}
\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\pagestyle{fancy}

% Table of contents
\renewcommand\tableofcontents{%
  \chapter*{\contentsname
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \@starttoc{toc}}

% Graphics
\RequirePackage{graphicx}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

% Math
\RequirePackage{amsmath,amssymb,amsfonts}

% Listings
\RequirePackage{listings}
\lstset{
  basicstyle=\ttfamily,
  breaklines=true,
  frame=single,
  numbers=none,
  keywordstyle=\color{winered},
  commentstyle=\color{gray}
}
