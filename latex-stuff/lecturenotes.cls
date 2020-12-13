\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[Lecture notes custom document class]

\DeclareOption{english}{%
    \def\notes@lang{english}
    \def\notes@babel{\notes@lang}
    \PassOptionsToPackage{\CurrentOption}{exmath}
}

\DeclareOption{spanish}{%
    \def\notes@lang{spanish}
    % The document will just blow up when inserting '->' in a tikzpicture environment if
    % we don't pass the 'es-noquoting' and 'es-noshorthands' arguments to babel in spanish
    \def\notes@babel{spanish, es-noquoting, es-noshorthands, es-tabla}
    \PassOptionsToPackage{\CurrentOption}{exmath}
}

\DeclareOption{lastpageref}{\def\notes@pagenumbering{lastpageref}}
\DeclareOption{nolastpageref}{\def\notes@pagenumbering{currentpage}}

\DeclareOption{bibliography}{\def\notes@biblio{true}}
\DeclareOption{nobibliography}{\def\notes@biblio{false}}

\DeclareOption{githublink}{\def\notes@github{true}}
\DeclareOption{nogithublink}{\def\notes@github{false}}

\DeclareOption{oldnums}{\def\notes@useoldnums{true}}
\DeclareOption{stdnums}{\def\notes@useoldnums{false}}

\DeclareOption{oldnums}{\def\notes@useoldnums{true}}
\DeclareOption{stdnums}{\def\notes@useoldnums{false}}

\DeclareOption{showauxlabels}{\def\notes@showauxlabels{true}}
\DeclareOption{noauxlabels}{\def\notes@showauxlabels{false}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{english, lastpageref, bibliography, githublink, stdnums}
\ProcessOptions\relax

\LoadClass[a4paper, 11pt]{report}

\def\notes@colorlinks{blue!60!black}
\newcommand{\colorlinks}[1]{\def\notes@colorlinks{#1}}

\renewcommand{\rmdefault}{ppl}
\renewcommand{\sfdefault}{fla}
\renewcommand{\ttdefault}{lmtt}
\renewcommand*{\familydefault}{\rmdefault}

\RequirePackage[utf8]{inputenc} % Document enconding
\RequirePackage[T1]{fontenc} % Font encoding
\RequirePackage[margin=1.5in]{geometry} % Margins
\RequirePackage[\notes@babel]{babel} % Multilingual support
\RequirePackage{titling} % Title, date, author, etc. references
\RequirePackage{titlesec} % Section title formatting
\RequirePackage{fancyhdr} % Nice, fancy headers
\RequirePackage{lastpage} % Reference last page in the document
\RequirePackage[titles]{tocloft} % Tables of content
\RequirePackage{graphicx} % Insert images
\RequirePackage{wrapfig} % Floating images
\RequirePackage{pdfpages} % Insert PDF documents
\RequirePackage{booktabs} % Better tables
\RequirePackage{multirow} % Multiple rows in tables
\RequirePackage{enumitem} % Change stuff in items within enumerate or itemize
\RequirePackage{subcaption} % Subcaption support
\RequirePackage[format=plain, labelfont=bf, textfont=it]{caption} % Custom caption styles
\RequirePackage[colorlinks=true, allcolors=\notes@colorlinks]{hyperref} % Links around the document
\RequirePackage{blindtext} % Next level lorem ipsum
\RequirePackage{ifthen} % If-then-else conditions
\RequirePackage{listings} % Write code listings
\RequirePackage{exmath} % Theorems, proofs, math macros and more
\RequirePackage{natbib} % Bibliography
\RequirePackage[nottoc]{tocbibind} % Append bibliography to table of contents

%\ifthenelse{\equal{\notes@lang}{english}}{\addto\captionsenglish{\renewcommand{\chaptername}{Topic}}{}%
%\ifthenelse{\equal{\notes@lang}{spanish}}{\addto\captionsspanish{\renewcommand{\chaptername}{Tema}}{}%

% English support
\ifthenelse{\equal{\notes@lang}{english}}{%
    %\addto\captionsenglish{\renewcommand{\chaptername}{Topic}
    \def\@of{of}
}{}

% Spanish support
\ifthenelse{\equal{\notes@lang}{spanish}}{%
    %\addto\captionsspanish{\renewcommand{\chaptername}{Tema}
    \def\@of{de}
}{}


\pretolerance=7000
\tolerance=500
\emergencystretch=3pt

\setcounter{secnumdepth}{3}
\counterwithin{table}{chapter}
\counterwithin{figure}{chapter}

\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\parskip}{2mm}
\setlength{\headheight}{15pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\baselinestretch}{1}
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\thepage}{\arabic{page}}

\let\oldstylenums\oldstyle

\setlist{leftmargin=1cm}

\newcommand{\hide}[1]{}
\newcommand{\hr}{\noindent\rule[0.5ex]{\linewidth}{0.5pt}}
\newcommand{\smiley}{\ensuremath{\ddot\smile}}

\def\notes@course{Course}
\newcommand{\course}[1]{\def\notes@course{#1}}

\def\notes@short{Short}
\newcommand{\short}[1]{\def\notes@short{#1}}

\def\notes@group{119}
\newcommand{\group}[1]{\def\notes@group{#1}}

\def\notes@degree{Bachelor in Computer Science and Engineering}
\newcommand{\degree}[1]{\def\notes@degree{#1}}

\def\notes@author{Rix Silverith}
\renewcommand{\author}[1]{\def\notes@author{#1}}

\def\notes@date{20/21 B1 S1}
\renewcommand{\date}[1]{\def\notes@date{#1}}

\def\notes@bibliodb{bibliography}
\renewcommand{\biblio}[1]{\def\notes@bibliodb{#1}}

\titleformat{\chapter}[display]{\Huge\bfseries}{\chaptertitlename\ \thechapter}{10pt}{\Huge}
\titlespacing*{\chapter}{0pt}{-50pt}{15pt}

\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{*3}{*1}

\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}{\normalfont\normalize\bfseries}{\thesubparagraph}{1em}{}

\fancypagestyle{noheaders}{%
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead{}
    \ifthenelse{\equal{\notes@pagenumbering}{lastpageref}}
        {\cfoot{\thepage\ \@of\ \pageref{LastPage}}}
        {\cfoot{\thepage}}
}

\fancyhf{}
\fancypagestyle{plain}{%
	\lhead{\small \itshape \notes@course\, -\, \notes@date}
	\rhead{\small \nouppercase\leftmark}
    \ifthenelse{\equal{\notes@pagenumbering}{lastpageref}}
        {\cfoot{\thepage\ \@of\ \pageref{LastPage}}}
        {\cfoot{\thepage}}
}

\AtBeginDocument{%
\pagestyle{plain}
\notes@titlepage
\clearpage
\thispagestyle{noheaders}
\tableofcontents
\newpage
}

\hide{
\AtEndDocument{%
\ifthenelse{\equal{\notes@biblio}{true}}{%
    \nocite{*}
    \bibliography{\notes@bibliodb}
    \thispagestyle{noheaders}
}{}}}

% Print the full title page, including titles, relevant
% information about the document, a brief abstract if given
% and the corresponding logos
\newcommand{\notes@titlepage}{%
    %\graphicspath{{.}}
    \begin{titlepage}
    \begin{center}
        \thispagestyle{empty}
        \vspace*{2cm}
        \ifthenelse{\equal{\notes@lang}{english}}{%
            \Huge\textbf{\notes@course \, (\notes@short \, \notes@group) \\ course notes}\vskip0.5cm
        }{%
            \Huge\textbf{\notes@course\,(\notes@short\,\notes@group)}\vskip0.5cm
        }
        \Large \notes@degree\vskip0.5cm
        \large \notes@date\vskip0.5cm
        \large \notes@author\vskip1.5cm

        \ifthenelse{\equal{\notes@github}{true}}{%
            \href{https://github.com/rixsilverith/lecture-notes/courses/}{Source code on GitHub}
        }

        \begin{figure}[ht]
            \centering\includegraphics[width=.55\textwidth]{assets/uam.png}
    	\end{figure}
        \vskip5cm
    \end{center}
    \end{titlepage}

    \noindent\textit{This work is licensed under Creative Commons Attributive Share Alike 4.0.}
    \vskip0.5cm
    \begin{figure}[ht]
        \centering\includegraphics[width=.2\textwidth]{assets/cc.png}
    \end{figure}
}
