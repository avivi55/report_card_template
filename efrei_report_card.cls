% A hard coded class for a lab report document class for EFREI Paris school.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{efrei_report_card}[EFREI Report Card Template(French)]
\RequirePackage{kvoptions}
\RequirePackage{keyval}
\SetupKeyvalOptions{
    family=efrei,
    prefix=efrei@
}

\newcommand{\setupcourse}{\kvsetkeys{efrei}}

\define@key{efrei}{color}{\newcommand{\efrei@color}{#1}}
\define@key{efrei}{name}{\newcommand{\efrei@name}{#1}}

\DeclareBoolOption{cloud}
\DeclareBoolOption{graphes}
\DeclareBoolOption{reop}
\DeclareBoolOption{signal}
\DeclareBoolOption{cantrans}
\DeclareBoolOption{comnum}
\DeclareBoolOption{circuit}
\DeclareBoolOption{signall}
\DeclareBoolOption{circuitt}
\DeclareBoolOption{bdd}
\DeclareBoolOption{machine}
\DeclareBoolOption{customsubject}

\ProcessKeyvalOptions*

\LoadClass[a4paper,titlepage,openany]{report}

\RequirePackage{xcolor}
\definecolor{themecolor}{HTML}{000000}
\newcommand{\@subject}{Subject Name}

\ifefrei@customsubject

    \AddToHook{begindocument/before}{\definecolor{themecolor}{HTML}{\efrei@color}}
    \renewcommand{\@subject}{\efrei@name}

\fi

\ifefrei@cloud
    \definecolor{themecolor}{HTML}{8E402A}
    \renewcommand{\@subject}{Cloud Computing}
\fi
\ifefrei@graphes
    \definecolor{themecolor}{HTML}{ec2025}
    \renewcommand{\@subject}{Théorie des graphes}
\fi
\ifefrei@reop
    \definecolor{themecolor}{HTML}{face7a}
    \renewcommand{\@subject}{Recherche opérationnelle}
\fi
\ifefrei@signal
    \definecolor{themecolor}{HTML}{81ecec}
    \renewcommand{\@subject}{Théorie du signal 1}
\fi
\ifefrei@cantrans
    \definecolor{themecolor}{HTML}{7bbbfb}
    \renewcommand{\@subject}{Canaux de transmission}
\fi
\ifefrei@comnum
    \definecolor{themecolor}{HTML}{0984e3}
    \renewcommand{\@subject}{Communication numérique}
\fi
\ifefrei@circuit
    \definecolor{themecolor}{HTML}{b2bec3}
    \renewcommand{\@subject}{Concéption de circuit numérique}
\fi
\ifefrei@circuitt
    \definecolor{themecolor}{HTML}{b2bec3}
    \renewcommand{\@subject}{Concéption de circuit numérique 2}
\fi
\ifefrei@signall
    \definecolor{themecolor}{HTML}{81ecec}
    \renewcommand{\@subject}{Théorie du signal 2}
\fi
\ifefrei@bdd
    \definecolor{themecolor}{HTML}{1F3438}
    \renewcommand{\@subject}{Bases de données avancées}
\fi
\ifefrei@machine
    \definecolor{themecolor}{HTML}{7D8471}
    \renewcommand{\@subject}{Introduction à l'apprentissage Machine}
\fi



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
    caption=b,                    
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
            {\huge EFREI Paris }\\[3cm]
            %
            \includegraphics[scale=0.5]{logo_efrei.png}\\[4cm]
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
\tcbuselibrary{listings}

\newcounter{exercise_counter}
\setcounter{exercise_counter}{1}

\newcounter{question_counter}
\setcounter{question_counter}{1}

\newcommand{\exercise}[2][\arabic{exercise_counter}]{%
\subsection*{#1 --- #2}
\setcounter{exercise_counter}{#1+1}
\setcounter{question_counter}{1}
}


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

\newcommand{\secondParameterVar}{}
\newcommand{\question}[3][\arabic{question_counter}]{%
    \ifstrempty{#1}{
        \begin{_question}{#2}#3\end{_question}
    }{
        \setcounter{exercise_counter}{\value{exercise_counter}-1}
        \ifstrempty{#2}{
            \renewcommand{\secondParameterVar}{#2}
        }{
            \renewcommand{\secondParameterVar}{ - #2}
        }
        
        \begin{_question}{\arabic{exercise_counter}.#1\secondParameterVar}%
            #3
        \end{_question}
        
        \setcounter{question_counter}{#1+1}
        \setcounter{exercise_counter}{\value{exercise_counter}+1}
    }
    \vspace{2mm}
}

\newtcolorbox{_note}{%
	enhanced,
	breakable,
	frame hidden,
	boxrule = 0sp,
	borderline west = {4pt}{0pt}{themecolor!50!black},
	sharp corners,
	description font = \mdseries,
	separator sign none,
	colback = themecolor!50!blue!10!white,
	segmentation style={solid, themecolor}
}
\newcommand{\note}[1]{\begin{_note}#1\end{_note}}

\newtcolorbox{_quote}{%
	enhanced,
	breakable,
	frame hidden,
	boxrule = 0sp,
	borderline west = {4pt}{0pt}{white!50!black},
	sharp corners,
	description font = \mdseries,
	separator sign none,
	colback = black!10!white,
	segmentation style={solid, gray}
}
\renewcommand{\quote}[1]{\begin{_quote}#1\end{_quote}}


\RequirePackage{multicol} % for dividing certain elements in two

\RequirePackage{hyperref} % text reference

\definecolor{doc}{RGB}{0,60,110}
\hypersetup{
	colorlinks=true, linkcolor=doc!90,
	bookmarksnumbered=true,
	bookmarksopen=true
}

% The style to be applied for the highlighted line:
%\lstdefinestyle{highlight}{basicstyle=\ttfamily\bfseries\color{red}}
\lstdefinestyle{highlight}{backgroundcolor=\color{green!30}}

% input listing and emphasize a specific line
% \lstinputemph[listings options]{line number}{filename}
\newcommand{\lstinputemph}[3][\empty]{%                                                    
 \lstset{aboveskip=0pt, belowskip=0pt, showlines=true,#1}%
 \ifnumcomp{#2}{=}{0}{\lstinputlisting{#3}}{%
   \ifnumcomp{#2}{=}{1}{}{\lstinputlisting[lastline=\the\numexpr#2-1\relax]{#3}}%            
   \lstinputlisting[firstnumber={#2},firstline={#2},lastline={#2},style=highlight]{#3}
   \lstinputlisting[firstnumber={\the\numexpr#2+1},firstline=\the\numexpr#2+1\relax]{#3}
 }% else
}

\makeatletter
\let\old@lstKV@SwitchCases\lstKV@SwitchCases
\def\lstKV@SwitchCases#1#2#3{}
\makeatother
\usepackage{lstlinebgrd}
\makeatletter
\let\lstKV@SwitchCases\old@lstKV@SwitchCases

\lst@Key{numbers}{none}{%
    \def\lst@PlaceNumber{\lst@linebgrd}%
    \lstKV@SwitchCases{#1}%
    {none:\\%
     left:\def\lst@PlaceNumber{\llap{\normalfont
                \lst@numberstyle{\thelstnumber}\kern\lst@numbersep}\lst@linebgrd}\\%
     right:\def\lst@PlaceNumber{\rlap{\normalfont
                \kern\linewidth \kern\lst@numbersep
                \lst@numberstyle{\thelstnumber}}\lst@linebgrd}%
    }{\PackageError{Listings}{Numbers #1 unknown}\@ehc}}
\makeatother