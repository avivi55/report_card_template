\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{agh_report_card}[AGH Report Card Template(english)]


\newcommand{\subject}{}

\RequirePackage{xcolor}
\definecolor{java}{HTML}{ec2025}
\definecolor{arch}{HTML}{face7a}
\definecolor{network}{HTML}{81ecec}
\definecolor{oop}{HTML}{7bbbfb}
\definecolor{os}{HTML}{0984e3}
\definecolor{web}{HTML}{b2bec3}

\DeclareOption{java}    {\renewcommand{\subject}{java}}
\DeclareOption{arch}    {\renewcommand{\subject}{arch}}
\DeclareOption{network} {\renewcommand{\subject}{network}}
\DeclareOption{oop}     {\renewcommand{\subject}{oop}}
\DeclareOption{os}      {\renewcommand{\subject}{os}}
\DeclareOption{web}     {\renewcommand{\subject}{web}}

\ProcessOptions\relax

\LoadClass[a4paper,titlepage,openany]{report}

\colorlet{themecolor}{\subject}

\RequirePackage{ifthen}
\newcommand{\@subject}{%
    \ifthenelse{\equal{\subject}{java}}{%
        Java Programming
    }{%
    \ifthenelse{\equal{\subject}{arch}}{%
        Computer Architecture
    }{%
    \ifthenelse{\equal{\subject}{network}}{%
        Networks \& Protocols
    }{%
    \ifthenelse{\equal{\subject}{oop}}{%
        Object-oriented Analysis \& Design with UML
    }{%
    \ifthenelse{\equal{\subject}{os}}{%
        Operating Systems
    }{%
    \ifthenelse{\equal{\subject}{web}}{%
        Advanced Web Programming
    }{}}}}}}
}

\RequirePackage{graphicx} % images

\RequirePackage{amssymb} % extra math symbols
\RequirePackage{mathtools} % amsmath enhancement
\RequirePackage{amsmath} % base for math output

\RequirePackage[boxruled,vlined]{algorithm2e} % for algorithms

\usepackage[T1]{fontenc} % more fonts (does not work with \RequirePackage)
\RequirePackage{arev}

\RequirePackage[tmargin=2.5cm, bmargin=2.5cm]{geometry} % custom margins ...

\RequirePackage{gensymb} % additional symbols


\RequirePackage{listings} % code blocks

\definecolor{comment}{HTML}{6a9956}
\definecolor{sidenumbers}{HTML}{6e7681}
\definecolor{strings}{HTML}{a31515}
\definecolor{backcolour}{HTML}{f3f3f3}
\definecolor{numbers}{HTML}{098658}
\definecolor{keywords}{HTML}{0600ff}
\definecolor{ids}{HTML}{000000}

\lstdefinestyle{codestyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{comment},
    keywordstyle=\color{keywords},
    numberstyle=\tiny\color{sidenumbers},
    stringstyle=\color{strings},
    identifierstyle=\color{ids},
    %
    basicstyle=\ttfamily\footnotesize,
    %
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    %
    numbers=left,                    
    numbersep=5pt,                  
    %           
    showstringspaces=false,
}

\lstset{style=codestyle}


% custom parameters
\providecommand{\subtitle}[1]{\providecommand{\@subtitle}{#1}}

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \begin{center}
            {\huge \bf Akademia G{\'o}rniczo-Hutnicza}\\[1cm]
            %
            \includegraphics[scale=0.5]{logo-agh.jpg}\\[4cm]
            %
            {\Large \bf \@subject}\\[2mm]
            %
            {\color{themecolor} \rule{\linewidth}{0.1cm}}\\[5mm]
            %
            {\Huge \@title}\\[3mm]
            {\LARGE \@subtitle}\\[3.5mm]
            %
            {\color{themecolor} \rule{\linewidth}{0.1cm}}\\
            %
            \vfill
            %
            {\Large \@author}
        \end{center}
    \end{titlepage}
}


\definecolor{green}{RGB}{56, 140, 70}

\definecolor{theorembg}{HTML}{F2F2F9}
\definecolor{theoremfr}{HTML}{00007B}

\definecolor{lenmabg}{HTML}{FFFAF8}
\definecolor{lenmafr}{HTML}{983b0f}

\definecolor{propbg}{HTML}{f2fbfc}
\definecolor{propfr}{HTML}{191971}

\definecolor{examplebg}{HTML}{F2FBF8}
\definecolor{examplefr}{HTML}{88D6D1}
\definecolor{exampleti}{HTML}{2A7F7F}

\definecolor{definitbg}{HTML}{E5E5FF}
\definecolor{definitfr}{HTML}{3F3FA3}

\definecolor{notesgreen}{RGB}{0,162,0}

\definecolor{exercisebg}{HTML}{F2FBF8}
\definecolor{exercisefg}{HTML}{88D6D1}

\RequirePackage[most,many,breakable]{tcolorbox} % nice boxes

\newtcolorbox{green_emph}{%
	enhanced,
	breakable,
	colback = green!10,
	frame hidden,
	boxrule = 0sp,
	borderline west = {3pt}{0pt}{green},
	sharp corners,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, green!85!black}
}


\newtcolorbox{blue_emph}{%
	enhanced,
	breakable,
	colback = theorembg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {3pt}{0pt}{theoremfr},
	sharp corners,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, theoremfr}
}

\newtcolorbox{red_emph}{%
	enhanced,
	breakable,
	colback = lenmabg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {3pt}{0pt}{lenmafr},
	sharp corners,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, lenmafr}
}

\newtcolorbox{lblue_emph}{%
	enhanced,
	breakable,
	frame hidden,
	boxrule = 0sp,
	borderline west = {3pt}{0pt}{exercisefg},
	sharp corners,
	description font = \mdseries,
	separator sign none,
	colback = exercisebg,
	segmentation style={solid, exercisefg}
}

\newcommand{\bluebox}[1]{\begin{blue_emph}#1\end{blue_emph}}
\newcommand{\lbluebox}[1]{\begin{lblue_emph}#1\end{lblue_emph}}
\newcommand{\greenbox}[1]{\begin{green_emph}#1\end{green_emph}}
\newcommand{\redbox}[1]{\begin{red_emph}#1\end{red_emph}}

\newcounter{question_counter}
\setcounter{question_counter}{1}

\newtcolorbox{_question}[1]{%
    enhanced,
    breakable,
    %
	title = #1,
    sharp corners,
    boxrule = 0px,
    colframe = themecolor!80!black,
    colback = themecolor!15!white,
}
\newcommand{\question}[3][\arabic{question_counter}]{%
    \begin{_question}{#1 - #2}#3\end{_question}
    \setcounter{question_counter}{#1+1}
}

\RequirePackage{tikz-uml} % UML design

\RequirePackage{multicol} % for dividing certain elements in two

\RequirePackage{hyperref} % text reference

\definecolor{doc}{RGB}{0,60,110}
\hypersetup{
	pdftitle={Report},
	colorlinks=true, linkcolor=doc!90,
	bookmarksnumbered=true,
	bookmarksopen=true
}
