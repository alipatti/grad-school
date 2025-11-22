\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grfp}

% adhering to 2025 instructions from
% https://www.nsf.gov/funding/opportunities/grfp-nsf-graduate-research-fellowship-program/nsf25-547/solicitation

\LoadClass[11pt]{article}

\RequirePackage{geometry}
\geometry{letterpaper}
\geometry{margin=1in}
\pagenumbering{gobble} % no page numbers
\linespread{1.0} % single-spaced

% decrease spacing around math
\AtBeginDocument{
	\setlength{\abovedisplayskip}{2pt}
	\setlength{\belowdisplayskip}{2pt}
	\setlength{\abovedisplayshortskip}{2pt}
	\setlength{\belowdisplayshortskip}{2pt}
}

% put subscripts next to summations and not on top of/below
\everydisplay{\textstyle}

% remove spacing around lists
\RequirePackage{enumitem}
\setlist{nosep}

% citations
\RequirePackage[
	style=numeric,
	backend=biber,
	giveninits=true,
	url=false,
	doi=false,
	isbn=false,
	eprint=false,
	% style=chicago-authordate,
  maxbibnames=99,
]{biblatex}

\renewcommand*{\subtitlepunct}{\addcolon\space} % add colon instead of period before subtitles
\AtEveryBibitem{\clearfield{subtitle}} % hide subtitles to make bib smaller
\AtEveryBibitem{\clearfield{url}} % omit URLs
% \AtBeginBibliography{\small} % small font in bib

% two-column bib
\RequirePackage{multicol}
\let\oldprintbibliography\printbibliography
\renewcommand{\printbibliography}{
	\section{References}
	% \vspace{-1em}
	% \begin{multicols}{2}
		% \footnotesize
		\oldprintbibliography[heading=none]
	% \end{multicols}
}

% links to citations
\RequirePackage{hyperref}
\hypersetup{hidelinks}

% redefine section headers
\RequirePackage[compact]{titlesec}
\titleformat{\section}{\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}[runin]{\itshape}{\thesubsection}{1em}{}[.]
\setcounter{secnumdepth}{0} % no numbers
\titlespacing*{\section}{0pt}{3pt}{1.5pt}

% add header for different statements for drafting
\RequirePackage{fancyhdr}
\renewcommand{\part}[1]{
	\newpage
	\renewcommand{\headrulewidth}{0pt}
	\thispagestyle{fancy}
	\fancyhead{}
	\chead{\scshape #1}
}

