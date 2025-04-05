%%%%%%%%%%%%%%%%%%%%%%
%% ElegantBook Class %%
%% Modified for English Only %%
%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2023/10/01 v5.0 ElegantBook document class]

%% Basic Class Setup
\LoadClass[a4paper,oneside]{book}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\DeclareStringOption[blue]{color}
\DeclareStringOption[normal]{device}
\ProcessKeyvalOptions*\relax

%% Geometry & Layout
\RequirePackage{geometry}
\geometry{
  a4paper,
  top=25.4mm, bottom=25.4mm,
  left=20mm, right=20mm,
  headheight=14pt,
  footskip=12mm
}

%% Core Packages
\RequirePackage{hyperref}
\hypersetup{
  bookmarksnumbered=true,
  colorlinks=true,
  linkcolor=blue,
  citecolor=blue,
  urlcolor=blue,
  pdftitle={Game Theory},
  pdfauthor={Wenxiao Yang}
}

%% Font Configuration
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{amsmath,amssymb}

%% Theorem Environments
\RequirePackage{tcolorbox}
\tcbuselibrary{skins, breakable}

%% Color Definitions
\RequirePackage{xcolor}
\definecolor{structurecolor}{RGB}{40,58,129}
\definecolor{main}{RGB}{40,58,129}
\definecolor{second}{RGB}{230,90,7}
\definecolor{third}{RGB}{0,160,152}
\definecolor{winered}{rgb}{0.5,0,0}

%% Theorem Style
\newtcolorbox{theorem}[1][]{
  colback=main!5,
  colframe=main!80,
  fonttitle=\bfseries,
  title=#1,
  breakable
}

\newtcolorbox{definition}[1][]{
  colback=second!5,
  colframe=second!80,
  fonttitle=\bfseries,
  title=#1,
  breakable
}

\newtcolorbox{proof}[1][]{
  colback=green!5,
  colframe=green!50!black,
  fonttitle=\bfseries,
  title=Proof,
  breakable
}

%% Custom Commands
\newcommand{\argmax}{\operatornamewithlimits{argmax}}
\newcommand{\argmin}{\operatornamewithlimits{argmin}}
\newcommand{\col}{\operatorname{col}}
\newcommand{\bioinfo}[2]{\gdef\@bioinfo{#1: #2}}

%% Title Page Configuration
\newcommand\cover[1]{\gdef\@cover{#1}}
\renewcommand\maketitle{
  \begin{titlepage}
    \centering
    \ifdef{\@cover}{\includegraphics[width=\textwidth]{\@cover}}{}
    \vspace*{2cm}
    {\Huge\bfseries \@title\par}
    \vspace{1cm}
    {\Large \@author\par}
    \vspace{0.5cm}
    {\large \@institute\par}
    \vfill
    {\large \@date\par}
  \end{titlepage}
}

%% Chapter Formatting
\titleformat{\chapter}[display]
  {\normalfont\Huge\bfseries\color{structurecolor}}
  {\chaptertitlename\ \thechapter}
  {20pt}
  {\Huge}

%% Section Formatting
\titleformat{\section}
  {\normalfont\Large\bfseries\color{structurecolor}}
  {\thesection}
  {1em}{}

%% TOC Depth
\setcounter{tocdepth}{2}

%% Bibliography Style
\RequirePackage[backend=biber, style=apa]{biblatex}
\endinput