\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[Document class for writing lecture notes and handouts]

% Language of the document [english, spanish]
%     - english (default).
%     - spanish.
\DeclareOption{english}{%
    \def\notes@lang{english}
    \def\notes@babel{\notes@lang}
    \PassOptionsToPackage{\CurrentOption}{exmath}}

\DeclareOption{spanish}{%
    \def\notes@lang{spanish}
    % The document will just blow up when inserting '->' in a tikzpicture
    % environment if we don't pass the 'es-noquoting' and 'es-noshorthands'
    % arguments to babel in spanish.
    \def\notes@babel{spanish, es-noquoting, es-noshorthands, es-tabla}
    \PassOptionsToPackage{\CurrentOption}{exmath}}

% Appearance of the document titlepage [titlepagefull, titlepagecompact,
% notitlepage]
%     - titlefullpage (default): the titlepage covers the whole first page of the
%            document. Enabling this option includes also the logo of the university,
%            which can be set using the \logo macro (see below).
%     - titlepagecompact: more compact, not fullpage, titlepage, with the title of
%            the document, author and date.
%     - notitlepage: no titlepage at all.
\DeclareOption{titlepagefull}{\def\notes@titlepagestyle{fullpage}}
\DeclareOption{titlepagecompact}{\def\notes@titlepagestyle{compact}}
\DeclareOption{notitlepage}{\def\notes@titlepagestyle{notitlepage}}

% Page number formatting [lastpageref, currentpageref, nopagenumber]
%     - lastpageref (default): print the number of both the current and the last
%            page of the document at the bottom of the page.
%     - nolastpageref: print only the number of the current page at the bottom of
%            the page.
%     - nopagenumber: don't print any page number.
\DeclareOption{lastpageref}{\def\notes@pagenumbering{lastpageref}}
\DeclareOption{nolastpageref}{\def\notes@pagenumbering{currentpage}}
\DeclareOption{nopagenumber}{\def\notes@pagenumbering{nopagenumber}}

% Bibliography [bibliography, nobibliography]
%     - bibliography (default): print the corresponding bibliography at the end
%            of the document.
%     - nobibliography: don't print bibliography.
\DeclareOption{bibliography}{\def\notes@biblio{true}}
\DeclareOption{nobibliography}{\def\notes@biblio{false}}

% GitHub link to source code [githublink, nogithublink]
%     - githublink (default): display a link to the source code of the document
%            on GitHub on the titlepage.
%     - nogithublink: hide the link to the source code.
\DeclareOption{githublink}{\def\notes@github{true}}
\DeclareOption{nogithublink}{\def\notes@github{false}}

% Number styles [oldnums, stdnums]
%     - oldnums: use old number styles.
%     - stdnums (default): use normal number styles.
\DeclareOption{oldnums}{\def\notes@useoldnums{true}}
\DeclareOption{stdnums}{\def\notes@useoldnums{false}}

% Auxiliar labels for theorems, figures, etc. [auxlabels, noauxlabels]
%     - auxlabels: show auxiliar labels for theorems, figures, etc. using the
%            showlabels package.
%     - noauxlabels (default): don't show auxiliar labels.
\DeclareOption{auxlabels}{\def\notes@showauxlabels{true}}
\DeclareOption{noauxlabels}{\def\notes@showauxlabels{false}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{english, lastpageref, bibliography, githublink, stdnums, noauxlabels}
\ProcessOptions\relax

\LoadClass[a4paper, 11pt]{report}

\def\notes@colorlinks{blue!60!black}
\newcommand{\colorlinks}[1]{\def\notes@colorlinks{#1}}

% Use the Palatino font family
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
\setlist{leftmargin=1cm}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\baselinestretch}{1}
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\thepage}{\arabic{page}}

\let\oldstylenums\oldstyle

\newcommand{\hide}[1]{}
\newcommand{\hr}{\noindent\rule[0.5ex]{\linewidth}{0.5pt}}
\newcommand{\smiley}{\ensuremath{\ddot\smile}}

\def\notes@course{}
\newcommand{\course}[1]{\def\notes@course{#1}}

\def\notes@short{}
\newcommand{\short}[1]{\def\notes@short{#1}}

\def\notes@group{}
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

\ifthenelse{\equal{\notes@lang}{english}}{\def\@of{of}}{}
\ifthenelse{\equal{\notes@lang}{spanish}}{\def\@of{de}}{}

\fancypagestyle{noheaders}{%
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead{}
    \ifthenelse{\equal{\notes@pagenumbering}{lastpageref}}
        {\cfoot{\thepage\ \@of\ \pageref{LastPage}}}
        {\cfoot{\thepage}}}

\fancyhf{}
\fancypagestyle{plain}{%
	\lhead{\small \itshape \notes@course\, -\, \notes@date}
	\rhead{\small \nouppercase\leftmark}
    \ifthenelse{\equal{\notes@pagenumbering}{lastpageref}}
        {\cfoot{\thepage\ \@of\ \pageref{LastPage}}}
        {\cfoot{\thepage}}}

\renewcommand{\tableofcontents}{%
  \chapter*{\contentsname}
  \thispagestyle{noheaders}
  \@starttoc{toc}\vskip 7ex%
}

\AtBeginDocument{%
\pagestyle{plain}
\notes@titlepage
\thispagestyle{noheaders}
\clearpage
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
\begin{titlepage}
\begin{center}
    \thispagestyle{empty}
    \vspace*{2cm}
    \ifthenelse{\equal{\notes@lang}{english}}
        {\Huge\textbf{\notes@course \, (\notes@short \, \notes@group) \\ course notes}\vskip0.5cm}
        {\Huge\textbf{\notes@course\,(\notes@short\,\notes@group)}\vskip0.5cm}

    \Large\notes@degree\vskip0.5cm
    \large\notes@date\vskip0.5cm
    \large\notes@author\vskip1.5cm

    \ifthenelse{\equal{\notes@github}{true}}{%
        \href{https://github.com/rixsilverith/lecture-notes/courses/}{Source code on GitHub}}

    \begin{figure}[ht]
        \centering\includegraphics[width=.55\textwidth]{assets/uam.png}
    \end{figure}
    \vskip5cm
\end{center}
\end{titlepage}

\vspace*{\fill}
\begin{figure}[ht]
    \centering\includegraphics[width=.2\textwidth]{assets/cc.png}
\end{figure}
\vskip0.5cm
\noindent\textrm{These notes are licensed under \href{https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode}{Creative Commons Attribution - No Commercial - Share Alike 4.0}. They can be freely used and distributed as long as the original author is credited, they aren't used for commercial purposes and derived work is shared under this same license.}}
