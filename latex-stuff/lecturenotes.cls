% This file defines the `lecturenotes` class used as a template
% for taking lecture notes. If you are not familiar with custom
% LaTeX document classes these are great resources to begin with:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2020/11/12 Lecture notes class]

\def\@coursename{}
\newcommand{\coursename}[1]{\def\@coursename{#1}}

\def\@courseshort{}
\newcommand{\courseshort}[1]{\def\@courseshort{#1}}

\def\@coursegroup{}
\newcommand{\coursegroup}[1]{\def\@coursegroup{#1}}

\def\@date{}
\renewcommand{\date}[1]{\def\@date{#1}}

\def\@degree{}
\newcommand{\degree}[1]{\def\@degree{#1}}

\def\@author{}
\renewcommand{\author}[1]{\def\@author{#1}}

\def\@organization{}
\newcommand{\organization}[1]{\def\@organization{#1}}

%\def\@biblio{}
%\newcommand{\biblio}[1]{\def\@biblio{#1}}

\newif\if@usebibliography
\newif\if@showlastpage
\newif\if@showgithublink

\newif\if@showorganizationheader

\newif\if@langen
\newif\if@langes

\def\@of{}

\author{Rix Silverith}

\DeclareOption{en}{%
    \@langentrue
    \@langesfalse
    \def\@of{of}
    \def\@degree{Bachelor in Computer Science and Engineering}
    \PassOptionsToPackage{\CurrentOption}{exmath}
    \PassOptionsToClass{\CurrentOption}{custombase}
}

\DeclareOption{es}{%
    \@langenfalse
    \@langestrue
    %\renewcommand{\chaptername}{Tema}
    \def\@of{de}
    \def\@degree{Grado en Ciencias computacionales}
    %\addto\captionsspanish{\renewcommand{\chaptername}{Tema}}
    \PassOptionsToPackage{\CurrentOption}{exmath}
    \PassOptionsToClass{\CurrentOption}{custombase}
}

\DeclareOption{showlastpage}{\@showlastpagetrue}
\DeclareOption{nolastpage}{\@showlastpagefalse}

\DeclareOption{showgithublink}{\@showgithublinktrue}
\DeclareOption{nogithublink}{\@showgithublinkfalse}

\DeclareOption{showorgheader}{\@showorganizationheadertrue}

\DeclareOption{bibnumbers}{\PassOptionsToPackage{numbers}{natbib}}

\DeclareOption{bibliography}{\@usebibliographytrue}
\DeclareOption{nobibliography}{\@usebibliographyfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{custombase}}

\ExecuteOptions{en, noshowlastpage, showgithublink}
\ProcessOptions\relax

\LoadClass{custombase}



%\RequirePackage{natbib}
%\RequirePackage[nottoc]{tocbibind}
%\RequirePackage{comment}
%\RequirePackage[backend=bibtex, style=alphabetic, sorting=ynt]{biblatex}
%\let\biblio\addbibresource

\counterwithin{table}{chapter}
\counterwithin{figure}{chapter}

\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}{\normalfont\normalize\bfseries}{\thesubparagraph}{1em}{}

\hide{
\if@usebibliography
\AtEndDocument{%
    \newpage
    %\addcontentsline{toc}{section}{Bibliography}
    \bibliography{\@biblio}
    \bibliographystyle{apalike}
}
\fi
}

\renewcommand{\thepage}{\arabic{page}}

\fancypagestyle{noheaders}{%
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead{}
    %\fancyfoot{}
    %\fancyfoot[c]{\thepage}

    \if@showlastpage
        \fancyfoot[C]{\thepage\ \@of\ \pageref{LastPage}}
    \else
        \fancyfoot[C]{\thepage}
    \fi
}


\fancypagestyle{withheaders}{%
    \fancyhead[R]{\nouppercase\rightmark}
    \fancyhead[L]{\nouppercase\@coursename}
    %\fancyfoot[C]{\thepage}

    \if@showlastpage
        \fancyfoot[C]{\thepage\ \@of\ \pageref{LastPage}}
    \else
        \fancyfoot[C]{\thepage}
    \fi
}

\fancyhf{}
%\PrerenderUnicode{ÁáÉéÍíÓóÚúÑñ} % Para que salgan las tildes y demás mierdas en el título.
\renewcommand{\chaptermark}[1]{\markright{#1}{}}
\fancypagestyle{plain}{%
    \if@showorganizationheader
        \lhead{\small \itshape \@coursename\, -\, \@date\, -\, \@organization}
    \else
	   \lhead{\small \itshape \@coursename\, -\, \@date}
    \fi

	\rhead{\small \nouppercase\rightmark}
	\cfoot{\thepage\ \@of\ \pageref{LastPage}}
}




%\pagestyle{withheaders}

% Print the full title page, including titles, relevant
% information about the document, a brief abstract if given
% and the corresponding logos
\newcommand{\lntitlepage}{%
    %\graphicspath{{.}}
    \begin{titlepage}
    \begin{center}
        \thispagestyle{empty}
        \vspace*{2cm}
        \if@langen
            \Huge\textbf{\@coursename \, (\@courseshort \, \@coursegroup) \\ course notes}\vskip0.5cm
        \else
            \Huge\textbf{\@coursename\,(\@courseshort\,\@coursegroup)}\vskip0.5cm
        \fi
        \Large \@degree\vskip0.5cm
        \large \@date\vskip0.5cm
        \large \@author\vskip1.5cm

        \if@showgithublink
            \href{https://github.com/rixsilverith/lecture-notes/courses/}{Source code on GitHub}
        \fi

        \begin{figure}[ht]
            \centering\includegraphics[width=.5\textwidth]{assets/uam.png}
    	\end{figure}
        \vskip5cm
    \end{center}
    \end{titlepage}

    \noindent\textit{This work is licensed under Creative Commons Attributive Share Alike 4.0.}
    \vskip0.5cm
    \begin{figure}[ht]
        \centering\includegraphics[width=.15\textwidth]{assets/cc.png}
    \end{figure}
}

\newcommand{\topic}[2]{%
    \newpage
    %\vspace*{1.5cm}
    %\thispagestyle{noheaders}
    \section[#2]{#1}
}
