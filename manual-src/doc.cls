\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{doc}[Palaiologos' document preamble]
\ProcessOptions\relax

\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}

\def\@baseclass{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}}
\PassOptionsToClass{a4paper,twoside,openright,11pt}{\@baseclass}
\ProcessOptions

\LoadClass{\@baseclass}

\textwidth\paperwidth
\advance\textwidth -55mm
\oddsidemargin-1in
\advance\oddsidemargin 30mm
\evensidemargin-1in
\advance\evensidemargin 25mm
\topmargin -1in
\advance\topmargin 2cm
\setlength\textheight{48\baselineskip}
\addtolength\textheight{\topskip}
\marginparwidth15mm

\newcounter{nAuthors}
\setcounter{nAuthors}{0}
\def\docAuthor#1{\def\@docName{#1}\stepcounter{nAuthors}}
\def\docAuthorii#1{\def\@docNameii{#1}\stepcounter{nAuthors}}
\def\docAuthoriii#1{\def\@docNameiii{#1}\stepcounter{nAuthors}}

\docAuthor{}{}
\docAuthorii{}{}
\docAuthoriii{}{}
\setcounter{nAuthors}{0}

\newcommand{\docDispAuthor}[1]{\begin{minipage}{0.45\textwidth}\centering{\Large\bfseries #1}\\[2mm]\ \end{minipage}\ }

\renewcommand\maketitle{
  \begin{titlepage}
	\let\footnotesize\small
	\let\footnoterule\relax
	\let \footnote \thanks
	\begin{center}
	  {\LARGE\textbf{}}
	  \vspace{1cm plus .5fill} 
	{
		\setlength{\parindent}{0em}
		\centering
			\ifx\@docName\empty\else\docDispAuthor{\@docName}\fi
			\ifx\@docNameii\empty\else\docDispAuthor{\@docNameii}\fi
			\ifx\@docNameiii\empty\else\docDispAuthor{\@docNameiii}\fi
	}
		
	  \vspace{8mm plus .5fill}
	  {\Huge\textbf{\@title}\par}
	  \vspace{8mm plus .1fill}
	  {\large\bf \MakeUppercase{\@docDesc} \par}
	  \vspace{2cm plus 1.5fill}
	  \vspace{1cm plus 1fill}
	  {\large \@date\par}
	\end{center}
	\@thanks
  \end{titlepage}
  
  \setcounter{footnote}{0}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\def\docDesc#1{\gdef\@docDesc{#1}}
\def\@docDesc{???\ClassError{doc}{Missing description.}\@ehc}

\renewenvironment{abstract}{
  \titlepage
  \null\nobreak\vfil
  \@beginparpenalty\@lowpenalty
  \begin{center}
	\bfseries\large Abstract
	\@endparpenalty\@M
  \end{center}}
{\nobreak\vfil\null\endtitlepage\cleardoublepage}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
\renewcommand*\l@chapter[2]{
  \ifnum \c@tocdepth >\m@ne
	\addpenalty{-\@highpenalty}
	\vskip 1.0em \@plus\p@
	\setlength\@tempdima{1.5em}
	\begingroup
	  \parindent \z@ \rightskip \@pnumwidth
	  \parfillskip -\@pnumwidth
	  \leavevmode \bfseries
	  \advance\leftskip\@tempdima
	  \hskip -\leftskip
	  #1\nobreak\mdseries
	  \leaders\hbox{$\m@th
		\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
		mu$}\hfill
	  \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	  \penalty\@highpenalty
	\endgroup
  \fi}

\endinput
