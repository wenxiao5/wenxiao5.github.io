% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2024/03/24 v4.5 ElegantBook document class]

% Basic packages
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% Basic options
\DeclareStringOption[blue]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}

% Color options
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

% Language options
\DeclareVoidOption{en}{\ekv{lang=en}}

% Mode options
\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}
\DeclareBoolOption[false]{usesamecnt}

% Device options
\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

% Citation options
\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

% Math options
\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

% Margin options
\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}

% TOC options
\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

% Theorem counter options
\DeclareStringOption[chapter]{thmcnt}
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

% Title style options
\DeclareStringOption[hang]{titlestyle}[hang]
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}

% Default options
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
\LoadClass[11.5pt, a4paper, oneside]{book}

% Essential packages
\RequirePackage{setspace}
\RequirePackage{csquotes}
\RequirePackage{hyperref}

% Hyperref settings
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

% Check hyperref version
\newif\ifELEGANT@Hy@later
\@ifpackagelater{hyperref}{2022/05/16}
  {\ELEGANT@Hy@latertrue}
  {\ELEGANT@Hy@laterfalse}

% Page geometry
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    left=25mm, right=25mm,
    top=25mm, bottom=25mm,
    headsep=10mm,
    footskip=15mm,
  }
  \ifdefstring{\ELEGANT@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm,right=7cm}}{\relax}}{
    \relax}

\ifdefstring{\ELEGANT@device}{pad}{
  \geometry{
    paperwidth=7.5in, 
    paperheight=10in,
    margin=16mm,
    headheight=2.17cm,
    footskip=4mm
  }}{\relax}

% Font settings
\RequirePackage{indentfirst,comment}
\ifdefstring{\ELEGANT@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\setcounter{tocdepth}{1}
\renewcommand{\baselinestretch}{1.2}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{iftex}

\ifpdftex
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.92]{helvet}
\else
  \RequirePackage[no-math]{fontspec}
  \setmainfont{TeXGyreTermesX}[
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Extension = .otf,
    Scale = 1.05]
    
  \setsansfont{texgyreheros}[
    UprightFont = *-regular,
    BoldFont = *-bold,
    ItalicFont = *-italic,
    BoldItalicFont = *-bolditalic,
    Extension = .otf,
    Scale = 0.95]
\fi

% Math settings
\RequirePackage{anyfontsize}
\ifdefstring{\ELEGANT@math}{newtx}{
  \RequirePackage{newtxtext}
  \RequirePackage{newtxmath}
  \let\Bbbk\relax
  \RequirePackage{esint}
  \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
  \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
  \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
}{\relax}

% Color settings
\RequirePackage[table]{xcolor}
\ifdefstring{\ELEGANT@color}{green}{
  \definecolor{structurecolor}{RGB}{0,120,2}%
  \definecolor{main}{RGB}{0,120,2}%
  \definecolor{second}{RGB}{230,90,7}%
  \definecolor{third}{RGB}{0,160,152}%
}{
\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{structurecolor}{RGB}{31,186,190}%
  \definecolor{main}{RGB}{59,180,5}%
  \definecolor{second}{RGB}{175,153,8}%
  \definecolor{third}{RGB}{244,105,102}%
}{
\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{structurecolor}{RGB}{60,113,183}
  \definecolor{main}{RGB}{0,166,82}%
  \definecolor{second}{RGB}{255,134,24}%
  \definecolor{third}{RGB}{0,174,247}%
}{
\ifdefstring{\ELEGANT@color}{gray}{
  \definecolor{structurecolor}{RGB}{150,150,150}
  \definecolor{main}{RGB}{150,150,150}%
  \definecolor{second}{RGB}{150,150,150}%
  \definecolor{third}{RGB}{150,150,150}%
}{
\ifdefstring{\ELEGANT@color}{black}{
  \definecolor{structurecolor}{RGB}{0,0,0}
  \definecolor{main}{RGB}{0,0,0}%
  \definecolor{second}{RGB}{0,0,0}%
  \definecolor{third}{RGB}{0,0,0}%
}{\relax}}}}}

% Predefined colors
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{bule}{RGB}{18,29,57}
\colorlet{coverlinecolor}{second}

% Title style
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

% Email command
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% Title commands
\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}

\RequirePackage{mwe}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

% Question environment
\newcommand{\question}[1]{{\par\itshape #1}\\[0.2ex]}

% List settings
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

% Caption settings
\RequirePackage[labelfont={bf,color=structurecolor}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% Document settings
\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin,stable]{footmisc}
  \setlength{\footnotesep}{11.5pt}
}

% Graphics and math packages
\RequirePackage{graphicx}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}
\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}

% Chapter settings
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}

% English language settings
\setlength\parindent{2em}
\newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
\newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
\renewcommand{\chaptername}{Chapter}
\renewcommand{\partname}{\color{structurecolor} Part}
\newcommand{\authorname}{\textbf{Notes by: }}
\newcommand{\institutename}{\textbf{Institute: }}
\newcommand{\datename}{\textbf{Date: }}
\newcommand{\versionname}{\textbf{Version: }}
\newcommand{\notename}{Note}
\newcommand{\proofname}{Proof}
\newcommand{\problemname}{Problem}
\newcommand{\definitionname}{Definition}
\newcommand{\theoremname}{Theorem}
\newcommand{\axiomname}{Axiom}
\newcommand{\postulatename}{Postulate}
\newcommand{\lemmaname}{Lemma}
\newcommand{\propositionname}{Proposition}
\newcommand{\corollaryname}{Corollary}
\newcommand{\examplename}{Example}
\newcommand{\exercisename}{Exercise}
\newcommand{\remarkname}{Remark}
\newcommand{\assumptionname}{Assumption}
\newcommand{\conclusionname}{Conclusion}
\newcommand{\solutionname}{Solution}
\newcommand{\propertyname}{Property}
\newcommand{\introductionname}{Introduction}
\renewcommand{\appendixname}{Appendix}
\newcommand{\ebibname}{Bibliography}
\newcommand{\updatename}{Updates:}
\newcommand{\historyname}{Version History}

% Graphics path
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

% TikZ settings
\RequirePackage{tikz}
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
  \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}

% List styles
\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structurecolor,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structurecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structurecolor,draw=none] circle (2pt);}

\setlist[enumerate,1]{label=\color{structurecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{structurecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{structurecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

% Theorem environments
\RequirePackage{apptools}
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage[many]{tcolorbox}

\newcommand{\ELEGANT@tmp@tl}{}
\ifELEGANT@usesamecnt
  \newcounter{ELEGANT@samecnt}
  \counterwithin{ELEGANT@samecnt}{\ELEGANT@thmcnt}
  \tcbset{
    new/usesamecnt/.style = {use counter = ELEGANT@samecnt}
  }
\else
  \tcbset{
    new/usesamecnt/.style = {}
  }
\fi

% Font settings
\RequirePackage{fontspec}
\ifdefstring{\ELEGANT@mode}{fancy}{
  \tcbset{
    common/.style={
      lower separated=false,
      coltitle=black,
      colback=gray!2,
      boxrule=0.5pt,
      fonttitle=\bfseries\fontspec{Charter},
      enhanced,
      breakable,
      top=8pt,
      before skip=8pt,
      attach boxed title to top left={
        yshift=-0.08in,
        xshift=0.1in
      },
      boxed title style={
        boxrule=0pt,
        colframe=white,
        arc=2pt,
        outer arc=2pt},
      separator sign={.},
    },
    defstyle/.style={
      common,
      fontupper=\fontspec{Palatino},
      colframe=main!40,
      colback=main!5,
      colbacktitle=main!20,
    },
    thmstyle/.style={
      common,
      fontupper=\fontspec{Palatino},
      colframe=second!40,
      colback=second!5,
      colbacktitle=second!20,
    },
    assumptionstyle/.style={
      common,
      fontupper=\fontspec{Palatino},
      colframe=assumptioncolor!40,
      colback=assumptioncolor!5,
      colbacktitle=assumptioncolor!20,
    },
    prostyle/.style={
      common,
      fontupper=\fontspec{Palatino},
      colframe=third!40,
      colback=third!5,
      colbacktitle=third!20,
    },
    examplestyle/.style={
      common,
      colframe=violet!40,
      colback=violet!5,
      colbacktitle=violet!20,
    },
    ELEGANT@title/.code n args={2}{
      \ifblank{#2}
        {\tcbset{title={\csname #1name\endcsname~\thetcbcounter}}}
        {\tcbset{title={\csname #1name\endcsname~\thetcbcounter\ (#2)}}}
    },
    ELEGANT@label/.code n args={2}{
      \ifblank{#2}
        {}{\tcbset{label={#1:#2}}}
    }
  }

  \NewDocumentCommand \ELEGANT@newtheorem { m m m O{} }{
    \ifcsundef{#1name}{%
      \ClassError{elegantbook}{%
        \ #1name undefined, \MessageBreak
        Please check in language setting
      }{}
    }{\relax}
    \expandafter\ifblank\expandafter{#4}{
      \tcbset{
        new/usecnt/.style={}
      }
    }{
      \tcbset{
        new/usecnt/.style= {use counter from = #4}
      }
    }
    \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt,usesamecnt,usecnt]{#1}{ g o t\label g }{
      common,#3,
      IfValueTF={##1}
        {ELEGANT@title={#1}{##1}}
        {
          IfValueTF={##2}
          {ELEGANT@title={#1}{##2}}
          {ELEGANT@title={#1}{}}
        },
      IfValueT={##4}
        {
          IfBooleanTF={##3}
            {label={##4}}
            {ELEGANT@label={#2}{##4}}
        }
    }
    \DeclareTColorBox{#1*}{ g o }{
      common,#3,
      IfValueTF={##1}
        {ELEGANT@title={#1}{##1}}
        {
          IfValueTF={##2}
          {ELEGANT@title={#1}{##2}}
          {ELEGANT@title={#1}{}}
        },
    }
  }

  \ELEGANT@newtheorem{theorem}{thm}{thmstyle}
  \ELEGANT@newtheorem{definition}{def}{defstyle}
  \ELEGANT@newtheorem{postulate}{pos}{thmstyle}
  \ELEGANT@newtheorem{axiom}{axi}{thmstyle}
  \ELEGANT@newtheorem{corollary}{cor}{thmstyle}
  \ELEGANT@newtheorem{lemma}{lem}{thmstyle}
  \ELEGANT@newtheorem{assumption}{asm}{assumptionstyle}
  \ELEGANT@newtheorem{proposition}{pro}{prostyle}
}{\relax}

% Simple mode settings
\ifdefstring{\ELEGANT@mode}{simple}{
  \let\openbox\relax
  \RequirePackage{amsthm}
  \let\proof\relax
  \let\endproof\relax

  \newtheoremstyle{defstyle}{5pt}{5pt}{\itshape}{0pt}{
    \bfseries\color{main}}{}{1em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{thmstyle}{5pt}{5pt}{\itshape}{0pt}{
    \bfseries\color{second}}{}{1em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{prostyle}{5pt}{5pt}{\itshape}{0pt}{
    \bfseries\color{third}}{}{1em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{assumptionstyle}{5pt}{5pt}{\itshape}{0pt}{
    \bfseries\color{assumptioncolor}}{}{1em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}

  \NewDocumentCommand \ELEGANT@newtheorem { m m O{} } {
    \theoremstyle{#2}
    \ifELEGANT@usesamecnt
      \newtheorem{#1}[ELEGANT@samecnt]{\csname #1name\endcsname}
    \else 
      \ifblank{#3}{
        \newtheorem{#1}{\csname #1name\endcsname}[\ELEGANT@thmcnt]
      }{
        \newtheorem{#1}[#3]{\csname #1name\endcsname}
      }
    \fi
    \newtheorem*{#1*}{\csname #1name\endcsname}
  }

  \ELEGANT@newtheorem{theorem}{thmstyle}
  \ELEGANT@newtheorem{definition}{defstyle}
  \ELEGANT@newtheorem{postulate}{thmstyle}
  \ELEGANT@newtheorem{axiom}{thmstyle}
  \ELEGANT@newtheorem{corollary}{thmstyle}
  \ELEGANT@newtheorem{lemma}{thmstyle}
  \ELEGANT@newtheorem{proposition}{prostyle}
  \ELEGANT@newtheorem{assumption}{assumptionstyle}
}{\relax}

% Counters
\newcounter{example}[chapter]
\setcounter{example}{0}
\renewcommand{\theexample}{\thechapter.\arabic{example}}

\newcounter{exer}[chapter]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thechapter.\arabic{exer}}

\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}

% Environments
\newenvironment{example}[1][]{
  \refstepcounter{example}
  \begin{tcolorbox}[examplestyle, title={\examplename~\theexample #1}]
}{
  \end{tcolorbox}
}{
  \par\ignorespacesafterend}

\newenvironment{exercise}[1][]{
  \refstepcounter{exer}
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\HandPencilLeft\quad}
    \textbf{\color{main}{\exercisename} \theexer #1 }\rmfamily}{
    \par\ignorespacesafterend}

\newenvironment{problem}[1][]{
  \refstepcounter{prob}
  \par\noindent\textbf{\color{main}{\problemname} \theprob #1 }\rmfamily}{
  \par\ignorespacesafterend}

\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend\quad}
    \textbf{\color{second}\notename} \itshape}{\par}

\newenvironment{proof}{
  \begin{tcolorbox}[
    enhanced,
    colback=white,
    colframe=gray!50,
    title={\proofname},
    breakable,
    top=2pt, bottom=2pt,
    before skip=8pt, after skip=8pt,
    boxrule=0.5pt,
    sharp corners
  ]
}{
  \end{tcolorbox}
}

\newenvironment{solution}{\par\noindent\textbf{\color{main}\solutionname} \itshape}{\par}
\newenvironment{remark}{\noindent\textbf{\color{second}\remarkname}}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{\color{third}\conclusionname} \itshape}{\par}
\newenvironment{property}{\par\noindent\textbf{\color{third}\propertyname} \itshape}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{third} #1} \itshape}{\par}

% Multicolumn settings
\RequirePackage{multicol}
\tcbset{
  introductionsty/.style={
    enhanced,
    breakable,
    colback=structurecolor!10,
    colframe=structurecolor,
    fonttitle=\bfseries,
    colbacktitle=structurecolor,
    fontupper=\itshape,
    attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
    boxrule=0pt,
    toprule=0.5pt,
    bottomrule=0.5pt,
    top=8pt,
    before skip=8pt,
    sharp corners
  },
}

\newenvironment{introduction}[1][\introductionname]{
  \begin{tcolorbox}[introductionsty,title={#1}]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
      \end{itemize}
    \end{multicols}
  \end{tcolorbox}}

% Decoration settings
\RequirePackage{adforn}

\newenvironment{problemset}[1][\xchaptertitle~\exercisename]{
  \vspace*{10pt}
  \begin{center}
    \phantomsection\addcontentsline{toc}{section}{\texorpdfstring{\xchaptertitle~\exercisename}{\exercisename}}
    \markright{#1}
    \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~#1~\adftripleflourishright}
  \end{center}
  \begin{enumerate}}{
  \end{enumerate}}

% Header and footer settings
\RequirePackage{fancyhdr}
\fancyhf{}
\fancyfoot[c]{\color{structurecolor}\small\thepage}
\if@twoside
  \fancyhead[EL]{\color{structurecolor}\normalfont\leftmark}
  \fancyhead[OR]{\color{structurecolor}\normalfont\rightmark}
\else
  \fancyhead[R]{\color{structurecolor}\normalfont\rightmark}
\fi

\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{1pt}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}

% Title page settings
\renewcommand*{\maketitle}{%
\hypersetup{pageanchor=false}
\pagenumbering{Alph}
\begin{titlepage}
  \newgeometry{margin=0in}
  \parindent=0pt
  \ifdefstring{\ELEGANT@device}{normal}{
    \ifcsname @cover\endcsname
      \includegraphics[width=\linewidth]{\@cover}
    \else
      \includegraphics[width=\linewidth]{example-image}
    \fi
  }{\relax}
  \ifdefstring{\ELEGANT@device}{pad}{
    \ifcsname @cover\endcsname
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{\@cover}
    \else
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{example-image}
    \fi
  }{\relax}
  \setlength{\fboxsep}{0pt}
  \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
  \vfill
  \vskip-2ex
  \hspace{2em}
  \parbox{0.8\textwidth}{
    \bfseries\Huge
      \ifcsname @title\endcsname \@title \fi
    \par}
  \vfill
  \vspace{-1.0cm}
  \setstretch{2.5}
  \hspace{2.5em}
  \begin{minipage}[c]{0.67\linewidth}
    {\color{darkgray}\bfseries\Large
      \ifcsname @subtitle\endcsname\@subtitle\\[2ex]\fi}
    \color{gray}\normalsize
    {\renewcommand{\arraystretch}{0.618}
    \begin{tabular}{@{}l@{}}
      \ifx\@author\empty\else\authorname\normalfont\@author\\ \fi
      \ifcsname @institute\endcsname \institutename \normalfont\@institute\\ \fi
      \ifx\@date\empty\else\datename\normalfont\@date \\ \fi
      \ifcsname @version\endcsname \normalfont\versionname\@version\\ \fi
      \ifcsname @bioinfo\endcsname \normalfont\@bioinfo\\ \fi
    \end{tabular}}
  \end{minipage}
  \begin{minipage}[c]{0.27\linewidth}
  \begin{tikzpicture}[remember picture,overlay]
    \begin{pgfonlayer}{background}
      \node[opacity=0.8,
            anchor=south east,
            outer sep=0pt,
            inner sep=0pt] at ($(current page.south east) +(-0.8in,1.5in)$) {
              \ifcsname @logo\endcsname\includegraphics[width=4.2cm]{\@logo}\fi};
    \end{pgfonlayer}
  \end{tikzpicture}
  \end{minipage}
  \vfill
  \begin{center}
    \setstretch{1.3}
    \parbox[t]{0.7\textwidth}{\centering \itshape 
      \ifcsname @extrainfo\endcsname\@extrainfo\fi}
  \end{center}
  \vfill
\end{titlepage}
\restoregeometry
\thispagestyle{empty}}

% Code settings
\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\definecolor{assumptioncolor}{RGB}{5, 19, 125}

\lstset{language=[LaTeX]TeX,
  texcsstyle=*\color{winered},
  numbers=none,
  mathescape=false,
  breaklines=true,
  keywordstyle=\color{winered},
  commentstyle=\color{gray},
  emph={elegantpaper,fontenc,fontspec,xeCJK,citestyle,FiraMono,xunicode,figure,fig,image,img,table,itemize,enumerate,ctex,microtype,description,times,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,ctex,listings,base,math,scheme,toc,esint,chinesefont,amsmath,bibstyle,natbib,pgfornament,addbibresource,printbibliography},
  emphstyle={\color{frenchplum}},
  morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,section,hypersetup,mainmatter,frontmatter,tableofcontents,elegantpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,heiti,fangsong,setCJKfamilyfont,textbf,elegantnewtheorem,thmcnt,colorlet,usesamecnt},
  frame=single,
  tabsize=2,
  rulecolor=\color{structurecolor},
  framerule=0.2pt,
  columns=flexible,
}

% Math settings
\newcommand\bmmax{0}
\RequirePackage{bm}

% Update history settings
\newcommand{\dateinfoline}[2]{
  \noindent\makebox[0pt][r]{%
  \makebox[-3em][r]{%
    \small
    \textbf{\textcolor{structurecolor}{#1}}}\;\;}%
  {\itshape\updatename\ignorespaces#2}}

\newcommand{\datechange}[2]{%
  \noindent{\makebox[\textwidth][r]{\color{structurecolor}\rule{1.15\textwidth}{.4pt}}}
  \dateinfoline{#1}{#2}
  \addcontentsline{dates}{section}{#1 -- #2}}

\newcommand{\listofchanges}{%
  \begingroup
    \renewcommand{\contentsname}{\historyname}
    \let\old@starttoc\@starttoc
    \def\@starttoc##1{
      \old@starttoc{dates}}
    \tableofcontents%
  \endgroup}

\newenvironment{change}{
  \begin{enumerate}[label=\small\protect\circled{\arabic*}]}{
  \end{enumerate}}

% Table of contents settings
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
    \hypersetup{linkcolor=winered}}

% Page settings
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}%
\thispagestyle{empty}%
\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% Appendix settings
\RequirePackage{calc}
\RequirePackage[titles]{tocloft}

\renewcommand{\cftchappresnum}{\chaptername\space}
\renewcommand{\cftchapaftersnum}{\space}
\setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~9}}}
\g@addto@macro\appendix{%
  \addtocontents{toc}{%
    \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
    \protect\renewcommand{\protect\cftchapaftersnum}{}%
    \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~999}}}
  }%
}

% Restore default font
\renewcommand\ttdefault{lmtt}