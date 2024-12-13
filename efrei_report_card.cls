% A hard coded class for a lab report document class for EFREI Paris school.

% This program is free software. It comes without any warranty, to
%   the extent permitted by applicable law. You can redistribute it
%   and/or modify it under the terms of the Do What The Fuck You Want
%   To Public License, Version 2, as published by Sam Hocevar. See
%   http://www.wtfpl.net/ for more details.

\NeedsTeXFormat{LaTeX2e}

\ExplSyntaxOn

\ProvidesExplClass
{efrei_report_card}
{14-12-2024}
{2.0.5}
{EFREI~Report~Card~Template(French)}

\RequirePackage{l3keys2e}
\RequirePackage{xcolor}

\keys_define:nn { report }
{
    title .tl_set:N = \g_report_title_tl,
    title .value_required:n = true,

    subtitle .tl_set:N = \g_report_subtitle_tl,

    nick .tl_set:N = \g_course_nick_tl,
    nick .initial:n = no_nick,

    name .tl_set:N = \g_course_name_tl,
    name .initial:n = Name,

    color .tl_set:N = \g_course_color_tl,
    color .initial:n = 000f00,

    largebox .bool_set:N = \g_use_large_document_bool,
    largebox .initial:n = false,
}

\ProcessKeysOptions{report}

\prop_const_from_keyval:Nn \l_courses_color_prop {
    sys_tr_color    = 8E402A,
    sys_tr_name    = {Systèmes~Temps~Réel},

    signal_color    = ec2025,
    signal_name    = {Traitement~numérique~du~signal},

    com_num_color   = 922B3E,
    com_num_name   = {Communication~numérique},

    logiciel_color  = 7bbbfb,
    logiciel_name  = {Logiciel~Embarqué},

    robotique_color = 0984e3,
    robotique_name = {Indroduction~à~la~robotique},
}

\bool_new:N \g_is_nick_in_list_bool
\bool_set_false:N \g_is_nick_in_list_bool

% Check if the provided nick is in the predefine list
\prop_map_inline:Nn \l_courses_color_prop {
    \tl_set_eq:NN \l_tmpa_tl \g_course_nick_tl
    \tl_put_right:Nn \l_tmpa_tl {_color}

    \tl_set:Nn \l_tmpb_tl {#1}

    \str_if_eq:NNT \l_tmpb_tl \l_tmpa_tl
    {
        \prop_map_break:n {
            \bool_set_true:N \g_is_nick_in_list_bool
        }
    }
}

% Sets the variables accordingly
\bool_if:NT \g_is_nick_in_list_bool {
    \tl_set_eq:NN \l_tmpa_tl \g_course_nick_tl
    \tl_put_right:Nn \l_tmpa_tl {_color}

    \prop_get:NoN \l_courses_color_prop \l_tmpa_tl \g_course_color_tl

    \tl_set_eq:NN \l_tmpa_tl \g_course_nick_tl
    \tl_put_right:Nn \l_tmpa_tl {_name}

    \prop_get:NoN \l_courses_color_prop \l_tmpa_tl \g_course_name_tl
}

\definecolor{themecolor}{HTML}{\tl_use:N \g_course_color_tl}

\ExplSyntaxOff

\LoadClass[a4paper,titlepage,openany]{report}


\RequirePackage{graphicx} % images

\RequirePackage{amssymb} % extra math symbols
\RequirePackage{mathtools} % amsmath enhancement
\RequirePackage{amsmath} % base for math output

\RequirePackage[boxruled,vlined]{algorithm2e} % for algorithms

\usepackage[T1]{fontenc} % more fonts (does not work with \RequirePackage)
\RequirePackage{arev}

\RequirePackage[tmargin=2.5cm, bmargin=2.5cm]{geometry} % custom margins ...

\RequirePackage{gensymb} % additional symbols

\RequirePackage{array, boldline}

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
    %
    numbers=left,
    numbersep=5pt,
    %
    captionpos=b,
    %
    showstringspaces=false,
}

\lstset{style=codestyle}

\ExplSyntaxOn
\renewcommand{\maketitle}{%
    \begin{titlepage}
        \begin{center}
            \includegraphics[scale=0.5]{logo_efrei.png}

            \vfill

            {\Large \bf \tl_use:N \g_course_name_tl}\\\vspace{2mm}

            {\color{themecolor} \rule{\linewidth}{0.1cm}}\\\vspace{5mm}

            {\Huge \tl_use:N \g_report_title_tl}\\\vspace{3mm}

            \tl_if_empty:NTF \g_report_subtitle_tl {} {
                {\LARGE \tl_use:N \g_report_subtitle_tl}\\\vspace{3.5mm}
            }

            {\color{themecolor} \rule{\linewidth}{0.1cm}}\\

            \vfill

            {\Large \@author}
        \end{center}
    \end{titlepage}
}
\ExplSyntaxOff


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
\addcontentsline{toc}{section}{#1 #2}%
\subsection*{#1 --- #2}
\setcounter{exercise_counter}{#1+1}
\setcounter{question_counter}{1}
}

\ExplSyntaxOn
\bool_if:nT \g_use_large_document_bool
{
    \geometry{
        a4paper,
        left=15mm,
        right=15mm,
    }
}
\ExplSyntaxOff

\newtcolorbox{_question}[1]{%
    enhanced,
    breakable,
    title = #1,
    boxrule = 0px,
    colframe = themecolor!80!black,
    colback = themecolor!15!white,
}

\newtcolorbox{_quote}{%
    enhanced,
    breakable,
    frame hidden,
    boxrule = 0sp,
    borderline west = {4pt}{0pt}{white!50!black},
    description font = \mdseries,
    separator sign none,
    colback = black!10!white,
    segmentation style={solid, gray}
}

\newtcolorbox{_note}{%
    enhanced,
    breakable,
    frame hidden,
    boxrule = 0sp,
    borderline west = {4pt}{0pt}{themecolor!50!black},
    description font = \mdseries,
    separator sign none,
    colback = themecolor!30!white,
    segmentation style={solid, themecolor}
}


\newcommand{\note}[1]{\begin{_note}#1\end{_note}}
\renewcommand{\quote}[1]{\begin{_quote}#1\end{_quote}}


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

        \addcontentsline{toc}{subsection}{\arabic{exercise_counter}.#1 #2}%

        \begin{_question}{\arabic{exercise_counter}.#1\secondParameterVar}%
            #3
        \end{_question}

        \setcounter{question_counter}{#1+1}
        \setcounter{exercise_counter}{\value{exercise_counter}+1}
    }
    \vspace{2mm}
}

\RequirePackage{multicol} % for dividing certain elements in two

\RequirePackage{hyperref}

\RequirePackage{capt-of}

\definecolor{doc}{RGB}{0,60,110}
\hypersetup{
	colorlinks=true, linkcolor=doc!90,
	bookmarksnumbered=true,
	bookmarksopen=true
}

% The style to be applied for the highlighted line:
%\lstdefinestyle{highlight}{basicstyle=\ttfamily\bfseries\color{red}}
\lstdefinestyle{highlight}{backgroundcolor=\color{green!30}}

\renewcommand{\contentsname}{{Table des matières}}

\newcommand{\inlinecode}[1]{\colorbox{lightgray}{\lstinline|#1|}}
\renewcommand{\arraystretch}{1.5}

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}