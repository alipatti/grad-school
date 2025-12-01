\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grad-statement}

% declare options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=option,
	prefix=option@
}

\DeclareBoolOption[true]{header}
\DeclareBoolOption[false]{berkeley}

\ProcessKeyvalOptions*

\LoadClass[11pt]{article}

% margins
\RequirePackage{geometry}
\geometry{letterpaper, margin=1in}

% redefine section headers
\RequirePackage[compact]{titlesec}
\setcounter{secnumdepth}{0} % no numbers

% spacing
\usepackage{setspace} % makes footnotes single-spaced regardless of doc spacing
\linespread{1.5}

% run-in sections
\titleformat{\section}{\bfseries}{\thesection}{1em}{}

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

\ifoption@berkeley
	\titleformat{\section}[runin]{\bfseries}{\thesection}{1em}{}[.]
	\linespread{2}
	\geometry{margin=.8in}
	\AtBeginBibliography{
		\linespread{1}
		\footnotesize
	}
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

\RequirePackage{xstring}
