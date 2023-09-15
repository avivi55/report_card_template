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


\newcommand{\themecolor}{\color{\subject}}

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
    }{%
    }}}}}}
}

\RequirePackage{graphicx} % images

\RequirePackage{amssymb} % extra math symbols
\RequirePackage{mathtools} % amsmath enhancement
\RequirePackage{amsmath} % base for math output

\RequirePackage[boxruled,vlined]{algorithm2e} % for algorithms

\usepackage[T1]{fontenc} % more fonts (does not work with \RequirePackage)
\RequirePackage{arev}

\RequirePackage[most,many,breakable]{tcolorbox} % nice boxes

\RequirePackage[tmargin=2.5cm, bmargin=2.5cm]{geometry} % custom margins ...

\RequirePackage{hyperref} % text reference

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
\providecommand{\labnumber}[1]{\providecommand{\@labnumber}{#1}}

\renewcommand{\maketitle}{%
    \begin{titlepage}
        \begin{center}
            {\huge \bf Akademia G{\'o}rniczo-Hutnicza}
            \\[1cm]
            \includegraphics[scale=0.5]{tex/logo-agh.jpg}
            \\[4cm]
            {\Large \bf \@subject}\\[2mm]
            {\themecolor \rule{\linewidth}{0.1cm}}\\[5mm]
            {\Huge Lab Report n°\@labnumber}\\[3mm]
            {\LARGE \@title}\\[3.5mm]
            {\themecolor \rule{\linewidth}{0.1cm}}

            \vfill

            {\Large \@author}
        \end{center}
    \end{titlepage}
}