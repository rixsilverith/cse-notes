\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custombase}[2020/11/14 Custom base class for lecture notes, lab reports, etc.]

\def\@fontsizeopt{11pt}
\def\@colorlinks{blue!60!black}
\newcommand{\colorlinks}[1]{\def\@colorlinks{#1}}

\def\@lang{}

\DeclareOption{en}{%
    \def\@lang{english}
    \def\@babel@load{\RequirePackage[english]{babel}}
}

% The document will just blow up when inserting '->' in a tikzpicture environment if
% we don't pass the 'es-noquoting' and 'es-noshorthands' arguments to babel in spanish
\DeclareOption{es}{%
    \def\@lang{spanish}
    \def\@babel@load{\RequirePackage[spanish, es-noquoting, es-noshorthands, es-tabla]{babel}}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{en}
\ProcessOptions\relax

\PassOptionsToClass{\@fontsizeopt}{report}
\LoadClass[a4paper]{report}

\RequirePackage[margin=1.4in]{geometry} % Margins
\RequirePackage[utf8]{inputenc} % Font encoding, language and stuff
\RequirePackage[T1]{fontenc} % More font encoding

\RequirePackage{ifthen} % If-then conditions

\@babel@load % Multilingual support
% https://tex.stackexchange.com/a/30757
\ifthenelse{\equal{\@lang}{spanish}}
    {\addto\captionsspanish{\renewcommand{\chaptername}{Tema}}}
    {\addto\captionsenglish{\renewcommand{\chaptername}{Topic}}}

%\RequirePackage{domitian} % Font
\renewcommand{\rmdefault}{ppl}
\renewcommand{\sfdefault}{fla}
\renewcommand{\ttdefault}{lmtt}
\renewcommand*{\familydefault}{\rmdefault}

\RequirePackage{titling} % Reference \thetitle, \thedate, etc.
\RequirePackage{titlesec} % Section, subsection, ... title formatting
\RequirePackage{fancyhdr} % Nice, fancy headers
\RequirePackage{lastpage} % Reference last page in the document

\RequirePackage{blindtext} % Next level lorem ipsum
\RequirePackage{pdfpages} % Insert PDF files

\RequirePackage{spalign} % Improve typing matrices and more stuff
\RequirePackage{multirow} % Multiple rows in tables
\RequirePackage{graphicx} % Insert images
\RequirePackage{wrapfig} % Floating images

\RequirePackage{subcaption} % Support for subcaptions
\RequirePackage[format=plain, textfont=bf]{caption} % Custom caption styles
\RequirePackage[pdfencoding=auto,psdextra]{hyperref} % Links around the document

\RequirePackage{exmath} % Theorems, proofs, math macros and more
\RequirePackage{listings} % Write code listings

% Tweaks for some words not to be cut off
\pretolerance=7000
\tolerance=500
\emergencystretch=3pt

% Links settings
\urlstyle{same}
\hypersetup{
    colorlinks=true,
    linkcolor=\@colorlinks,
    urlcolor=\@colorlinks,
    citecolor=\@colorlinks
}

% General spacing rules
\setlength{\parskip}{2mm}
\setlength{\headheight}{15pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\baselinestretch}{1.1}

\renewcommand{\labelitemi}{$\bullet$}

\let\oldstylenums\oldstyle

\newcommand{\hide}[1]{}
\newcommand{\hr}{\noindent\rule[0.5ex]{\linewidth}{0.5pt}}
\newcommand{\smiley}{\ensuremath{\ddot\smile}}

% Section, subsection, etc. title formatting
\hide{
\titleformat{\section}{\normalfont\Huge\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\Large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\large\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}{\normalfont\normalize\bfseries}{\thesubparagraph}{1em}{}
}

\newcommand{\img}[4]{
	\begin{figure}[ht]
    \centering
    \includegraphics[width=#4\textwidth]{#1}
    \caption{#2}
    \label{fig:#3}
	\end{figure}
}
