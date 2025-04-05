%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
%% Revised by Wenxiao Yang: 2024/09/24
%
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2025/03/16 ElegantBook document class Revised by Wenxiao Yang]

%% Core Options
\RequirePackage{kvoptions}
\DeclareStringOption[blue]{color}
\DeclareStringOption[normal]{mode}
\DeclareStringOption[numeric-comp]{citestyle}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper,oneside]{book}

%% Essential Packages
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{amsmath,amsthm}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{graphicx}

%% Geometry Setup
\geometry{
  a4paper,
  top=1in, bottom=1.2in,
  left=1in, right=1in,
  headheight=14pt
}

%% Color Scheme
\definecolor{structurecolor}{RGB}{0,120,2} % Main theme color
\definecolor{main}{RGB}{0,120,2}
\definecolor{second}{RGB}{230,90,7}
\definecolor{third}{RGB}{0,174,247}
\definecolor{winered}{RGB}{183,18,52}

%% Hyperref Configuration
\hypersetup{
  bookmarksnumbered=true,
  colorlinks=true,
  linkcolor=blue,
  citecolor=blue,
  urlcolor=blue,
  pdftitle={ElegantBook EN},
  pdfauthor={ElegantLaTeX}
}

%% Header/Footer Style
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\small\color{structurecolor}\thepage}
\fancyhead[R]{\color{structurecolor}\rightmark}
\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\renewcommand{\headrulewidth}{0.8pt}

%% Theorem Environments
\newtheoremstyle{elegant}
  {3pt}{3pt}{\itshape}{}
  {\bfseries\color{structurecolor}}{}{0.5em}{}
  
\theoremstyle{elegant}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{definition}[theorem]{Definition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{example}[theorem]{Example}
\newtheorem{remark}[theorem]{Remark}

%% Chapter Formatting
\titleformat{\chapter}[display]
  {\normalfont\Huge\bfseries\color{structurecolor}}
  {\filright\MakeUppercase{\chaptertitlename}\ \thechapter}
  {20pt}
  {\Huge\filright}

%% List Styling
\setlist{itemsep=0pt,topsep=4pt}
\setlist[enumerate]{label=(\alph*)}
\setlist[itemize]{label=\textcolor{structurecolor}{\textbullet}}

%% Code Listing
\RequirePackage{listings}
\lstset{
  basicstyle=\ttfamily\small,
  breaklines=true,
  columns=flexible,
  frame=single,
  rulecolor=\color{structurecolor!60},
  backgroundcolor=\color{structurecolor!5}
}

%% Title Page Elements
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}

%% Document Structure
\renewcommand{\maketitle}{
  \begin{titlepage}
    \begin{center}
      \vspace*{2cm}
      {\Huge\bfseries\color{structurecolor} \@title}
      
      \vspace{1cm}
      {\Large\@subtitle}
      
      \vspace{3cm}
      \begin{tabular}[t]{c}
        \@author \\[1ex]
        \@institute
      \end{tabular}
      
      \vfill
      \@date \\
      Version \@version
    \end{center}
  \end{titlepage}
}

%% Bibliography
\AtEndOfClass{
  \RequirePackage[style=\ELEGANT@citestyle]{biblatex}
  \defbibheading{bibliography}[\refname]{
    \chapter*{#1}
    \markboth{#1}{#1}
  }
}

\endinput