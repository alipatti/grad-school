\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grad-statement}

\LoadClass[11pt]{article}

% \RequirePackage{parskip}

\RequirePackage{geometry}
\geometry{letterpaper}
\geometry{margin=1in}
\linespread{1.5} % single-spaced

% decrease spacing around math
\AtBeginDocument{
	\setlength{\abovedisplayskip}{2pt}
	\setlength{\belowdisplayskip}{2pt}
	\setlength{\abovedisplayshortskip}{2pt}
	\setlength{\belowdisplayshortskip}{2pt}
}

% remove spacing around lists
\RequirePackage{enumitem}


% links to citations
\RequirePackage{hyperref}
\hypersetup{hidelinks}

% citations
\RequirePackage[
	backend=biber,
	giveninits=true,
	% uniquename=init,
	doi=false,
	url=false,
	isbn=false,
	style=authoryear-comp,
	maxbibnames=99,
]{biblatex}

\renewcommand*{\subtitlepunct}{\addcolon\space} % add colon instead of period before subtitles
\AtEveryBibitem{\clearfield{subtitle}} % hide subtitles to make bib smaller
\AtBeginBibliography{\footnotesize} % small font in bib

% two-column bib
\RequirePackage{multicol}
\let\oldprintbibliography\printbibliography
\renewcommand{\printbibliography}{
	\singlespacing
	\section{References} {$ $}

	\vspace{-1em}


	\begin{multicols}{2}
		\oldprintbibliography[heading=none]
	\end{multicols}
}

% redefine section headers
\RequirePackage[compact]{titlesec}
\titleformat{\section}[runin]{\bfseries}{\thesection}{1em}{}[.]
\titleformat{\subsection}[runin]{\itshape}{\thesubsection}{1em}{}[.]
\setcounter{secnumdepth}{0} % no numbers

\RequirePackage{xspace}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\makeatletter
\rhead{\textsc{\@author\ \thepage}}
\lhead{\textsc{\@title}}
\makeatother
