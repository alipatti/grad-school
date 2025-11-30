\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grad-statement}


% declare options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=option,
	prefix=option@
}

\DeclareBoolOption[true]{header}
\DeclareBoolOption[false]{runin}
\DeclareBoolOption[false]{compact}

\LoadClass[11pt]{article}

% margins
\RequirePackage{geometry}
\geometry{letterpaper, margin=1in}

% redefine section headers
\RequirePackage[compact]{titlesec}
\setcounter{secnumdepth}{0} % no numbers

% run-in sections
\ifoption@runin
	\titleformat{\section}[runin]{\bfseries}{\thesection}{1em}{}[.]
\else
	\titleformat{\section}{\bfseries}{\thesection}{1em}{}
\fi

\ifoption@compact
	\linespread{1}

	% decrease spacing around math
	\AtBeginDocument{
		\setlength{\abovedisplayskip}{2pt}
		\setlength{\belowdisplayskip}{2pt}
		\setlength{\abovedisplayshortskip}{2pt}
		\setlength{\belowdisplayshortskip}{2pt}
	}
\else
	\linespread{1.5}
\fi

\ifoption@header
	\RequirePackage{fancyhdr}
	\pagestyle{fancy}

	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\setlength{\headheight}{14pt}

	\makeatletter
	\rhead{\textsc{\@author\ \thepage}}
	\lhead{\textsc{\@title}}
	\makeatother

\fi

% links to citations
\RequirePackage{hyperref}
\hypersetup{hidelinks}

% citations
\RequirePackage[
	backend=biber,
	giveninits=true,
	uniquename=init,
	doi=false,
	url=false,
	isbn=false,
	style=authoryear-ibid,
	maxbibnames=99,
]{biblatex}

\renewcommand*{\subtitlepunct}{\addcolon\space} % add colon instead of period before subtitles
\AtEveryBibitem{\clearfield{subtitle}} % hide subtitles to make bib smaller
% \AtBeginBibliography{\footnotesize} % small font in bib

% two-column bib
\RequirePackage{multicol}
\let\oldprintbibliography\printbibliography
\renewcommand{\printbibliography}{
	\section{References}

	% \ifoption@runin
	% 	{$ $}
	% \fi

	% \vspace{-1em}
	%
	% \begin{multicols}{2}
		\oldprintbibliography[heading=none]
	% \end{multicols}
}

\AtBeginDocument{}

