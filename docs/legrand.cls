%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Legrand Orange Book
% Structural Definitions File
% Version 2.0 (9/2/15)
%
% Original author:
% Mathias Legrand (legrand.mathias@gmail.com) with modifications by:
% Vel (vel@latextemplates.com)
% 
% This file has been downloaded from:
% http://www.LaTeXTemplates.com
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{legrand}[2022/10/26 Final Degree Project]
\LoadClass[10pt,oneside]{book}

%-------------------------------------------------------------------------------
%	VARIOUS REQUIRED PACKAGES AND CONFIGURATIONS
%-------------------------------------------------------------------------------

% we specify some colors for later use
\usepackage[table]{xcolor} % Required for specifying colors by name
\definecolor{blueUniovi}{RGB}{0,51,170} % Define the orange color used for highlighting throughout the book
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\usepackage{graphicx} % Required for including pictures
\graphicspath{{figures}} % Specifies the directory where pictures are stored
\usepackage{tikz} % Required for drawing custom shapes
\usepackage[english]{babel} % English language/hyphenation
\usepackage{enumitem} % Customize lists
\setlist{nolistsep} % Reduce spacing between bullet points and numbered lists
\usepackage{booktabs} % Required for nicer horizontal rules in tables

% beautiful quotes at the beginning of each chapter
\RequirePackage{epigraph}
\setlength\epigraphwidth{8cm}
\setlength\epigraphrule{0pt}
\renewcommand{\textflush}{flushepinormal}
\setlength{\beforeepigraphskip}{0cm}

%-------------------------------------------------------------------------------
%	MARGINS, SPACING and PARAGRAPHS
%-------------------------------------------------------------------------------

\RequirePackage{geometry} % Required for adjusting page dimensions and margins
\geometry{
	paper=a4paper, % Paper size, change to letterpaper for US letter size
	top=3cm, % Top margin
	bottom=3cm, % Bottom margin
	left=3cm, % Left margin
	right=3cm, % Right margin
	headheight=14pt, % Header height
	footskip=1.4cm, % Space from the bottom margin to the baseline of the footer
	headsep=10pt, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}

\usepackage[skip=2mm, indent=5mm]{parskip}

% -- we set the line spacing for the tabulars to 1.25 
\usepackage{setspace}
\setlength{\tabcolsep}{1mm}
\renewcommand{\arraystretch}{1.25}

%-------------------------------------------------------------------------------
%	FONTS
%-------------------------------------------------------------------------------

%\usepackage{avant} % Use the Avantgarde font for headings
%\usepackage{times} % Use the Times font for headings
\usepackage{notomath} % Use the Noto font for the whole document

\usepackage{microtype} % Slightly tweak font spacing for aesthetics
\usepackage[utf8]{inputenc} % Required for including letters with accents
\usepackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs

%-------------------------------------------------------------------------------
%	BIBLIOGRAPHY AND INDEX
%-------------------------------------------------------------------------------

\usepackage{csquotes}
\usepackage[
 style=numeric,
 citestyle=numeric,
 sorting=nyt,
 sortcites=true,
 autopunct=true,
 babel=hyphen,
 hyperref=true,
 abbreviate=false,
 backref=true,
 backend=biber]{biblatex}
\addbibresource{thesis_biblio.bib} % BibTeX bibliography file
\defbibheading{bibempty}{}

\usepackage{calc} % For simpler calculation - used for spacing the index letter headings correctly
\usepackage{makeidx} % Required to make an index
\makeindex % Tells LaTeX to create the files required for indexing

%-------------------------------------------------------------------------------
%	MAIN TABLE OF CONTENTS
%-------------------------------------------------------------------------------

\usepackage{titletoc} % Required for manipulating the table of contents

\contentsmargin{0cm} % Removes the default margin

% Part text styling
\titlecontents{part}
    [0cm]
    {\addvspace{20pt}\centering\large\bfseries}
    {}
    {}
    {}

% Chapter text styling
\titlecontents{chapter}
    [1.25cm] % Indentation
    {\addvspace{12pt}\large\sffamily\bfseries} % Spacing and font options for chapters
    {\color{blueUniovi!60}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{blueUniovi}} % Chapter number
    {\color{blueUniovi}}  
    {\color{blueUniovi!60}\normalsize\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number

% Section text styling
\titlecontents{section}
    [1.25cm] % Indentation
    {\addvspace{3pt}\sffamily\bfseries} % Spacing and font options for sections
    {\contentslabel[\thecontentslabel]{1.25cm}} % Section number
    {}
    {\hfill\color{black}\thecontentspage} % Page number
    []

% Subsection text styling
\titlecontents{subsection}
    [1.25cm] % Indentation
    {\addvspace{1pt}\sffamily\small} % Spacing and font options for subsections
    {\contentslabel[\thecontentslabel]{1.25cm}} % Subsection number
    {}
    {\ \titlerule*[.5pc]{.}\;\thecontentspage} % Page number
    []

% List of figures
\titlecontents{figure}
    [0em]
    {\sffamily}
    {\thecontentslabel\hspace*{1em}}
    {}
    {\ \titlerule*[.5pc]{.}\;\thecontentspage}
    []

% List of tables
\titlecontents{table}
    [0em]
    {\sffamily}
    {\thecontentslabel\hspace*{1em}}
    {}
    {\ \titlerule*[.5pc]{.}\;\thecontentspage}
    []

%-------------------------------------------------------------------------------
%	MINI TABLE OF CONTENTS IN PART HEADS
%-------------------------------------------------------------------------------

% Chapter text styling
\titlecontents{lchapter}
    [0em] % Indenting
    {\addvspace{15pt}\large\sffamily\bfseries} % Spacing and font options for chapters
    {\color{blueUniovi}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{blueUniovi}} % Chapter number
    {}  
    {\color{blueUniovi}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number

% Section text styling
\titlecontents{lsection}
    [0em] % Indenting
    {\sffamily\small} % Spacing and font options for sections
    {\contentslabel[\thecontentslabel]{1.25cm}} % Section number
    {}
    {}

% Subsection text styling
\titlecontents{lsubsection}
    [.5em] % Indentation
    {\normalfont\footnotesize\sffamily} % Font settings
    {}
    {}
    {}

%-------------------------------------------------------------------------------
%	PAGE HEADERS
%-------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for header and footer configuration

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\chaptername\ \thechapter.\ #1}{}} % Chapter text font settings
\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection\hspace{5pt}#1}{}} % Section text font settings
\fancyhf{} \fancyhead[LE,RO]{\sffamily\normalsize\thepage} % Font setting for the page number in the header
\fancyhead[LO]{\rightmark} % Print the nearest section name on the left side of odd pages
\fancyhead[RE]{\leftmark} % Print the current chapter name on the right side of even pages
\renewcommand{\headrulewidth}{0.5pt} % Width of the rule under the header
\addtolength{\headheight}{2.5pt} % Increase the spacing around the header slightly
\renewcommand{\footrulewidth}{0pt} % Removes the rule in the footer
\fancypagestyle{plain}{\fancyhead{}\renewcommand{\headrulewidth}{0pt}} % Style for when a plain pagestyle is specified

% Removes the header from odd empty pages at the end of chapters
%\makeatletter
%\renewcommand{\cleardoublepage}{
%\clearpage\ifodd\c@page\else
%\hbox{}
%\vspace*{\fill}
%\thispagestyle{empty}
%\newpage
%\fi}

%-------------------------------------------------------------------------------
%	THEOREM STYLES
%-------------------------------------------------------------------------------

\let\openbox\undefined
\usepackage{amsmath,amsthm} % For math equations, theorems, symbols, etc

\newcommand{\intoo}[2]{\mathopen{]}#1\,;#2\mathclose{[}}
\newcommand{\ud}{\mathop{\mathrm{{}d}}\mathopen{}}
\newcommand{\intff}[2]{\mathopen{[}#1\,;#2\mathclose{]}}
\newtheorem{notation}{Notation}[chapter]

% Boxed/framed environments
\newtheoremstyle{bluenumbox}% % Theorem style name
    {0pt}% Space above
    {0pt}% Space below
    {\normalfont}% % Body font
    {}% Indent amount
    {\small\bf\sffamily\color{blueUniovi}}% % Theorem head font
    {\;}% Punctuation after theorem head
    {0.25em}% Space after theorem head
    {\small\sffamily\color{blueUniovi}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
    \thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}---\nobreakspace#3.}} % Optional theorem note
    \renewcommand{\qedsymbol}{$\blacksquare$}% Optional qed square

\newtheoremstyle{blacknumex}% Theorem style name
    {5pt}% Space above
    {5pt}% Space below
    {\normalfont}% Body font
    {} % Indent amount
    {\small\bf\sffamily}% Theorem head font
    {\;}% Punctuation after theorem head
    {0.25em}% Space after theorem head
    {\small\sffamily{\tiny\ensuremath{\blacksquare}}\nobreakspace\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
    \thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}% Optional theorem note

\newtheoremstyle{blacknumbox} % Theorem style name
    {0pt}% Space above
    {0pt}% Space below
    {\normalfont}% Body font
    {}% Indent amount
    {\small\bf\sffamily}% Theorem head font
    {\;}% Punctuation after theorem head
    {0.25em}% Space after theorem head
    {\small\sffamily\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
    \thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}% Optional theorem note

% Non-boxed/non-framed environments
\newtheoremstyle{bluenum}% % Theorem style name
    {5pt}% Space above
    {5pt}% Space below
    {\normalfont}% % Body font
    {}% Indent amount
    {\small\bf\sffamily\color{blueUniovi}}% % Theorem head font
    {\;}% Punctuation after theorem head
    {0.25em}% Space after theorem head
    {\small\sffamily\color{blueUniovi}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
    \thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}---\nobreakspace#3.}} % Optional theorem note
    \renewcommand{\qedsymbol}{$\blacksquare$}% Optional qed square

\makeatother

% Defines the theorem text style for each type of theorem to one of the three styles above
\newcounter{dummy} 
\numberwithin{dummy}{section}
\theoremstyle{bluenumbox}
\newtheorem{theoremeT}[dummy]{Theorem}
\newtheorem{problem}{Problem}[chapter]
\newtheorem{exerciseT}{Exercise}[chapter]
\theoremstyle{blacknumex}
\newtheorem{exampleT}{Example}[chapter]
\theoremstyle{blacknumbox}
\newtheorem{vocabulary}{Vocabulary}[chapter]
\newtheorem{definitionT}{Definition}[section]
\newtheorem{corollaryT}[dummy]{Corollary}
\theoremstyle{bluenum}
\newtheorem{proposition}[dummy]{Proposition}

%-------------------------------------------------------------------------------
%	DEFINITION OF COLORED BOXES
%-------------------------------------------------------------------------------

\RequirePackage[framemethod=default]{mdframed} % Required for creating the theorem, definition, exercise and corollary boxes

% Theorem box
\newmdenv[skipabove=7pt,
    skipbelow=7pt,
    backgroundcolor=black!5,
    linecolor=blueUniovi,
    innerleftmargin=5pt,
    innerrightmargin=5pt,
    innertopmargin=5pt,
    leftmargin=0cm,
    rightmargin=0cm,
    innerbottommargin=5pt]{tBox}

% Exercise box	  
\newmdenv[skipabove=7pt,
    skipbelow=7pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    backgroundcolor=ocre!10,
    linecolor=blueUniovi,
    innerleftmargin=5pt,
    innerrightmargin=5pt,
    innertopmargin=5pt,
    innerbottommargin=5pt,
    leftmargin=0cm,
    rightmargin=0cm,
    linewidth=4pt]{eBox}	

% Definition box
\newmdenv[skipabove=1em,
    skipbelow=0pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=blueUniovi,
    innerleftmargin=5pt,
    innerrightmargin=5pt,
    innertopmargin=0pt,
    leftmargin=0cm,
    rightmargin=0cm,
    linewidth=4pt,
    innerbottommargin=0pt]{dBox}
    
% Corollary box
\newmdenv[skipabove=7pt,
    skipbelow=7pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=gray,
    backgroundcolor=black!5,
    innerleftmargin=5pt,
    innerrightmargin=5pt,
    innertopmargin=5pt,
    leftmargin=0cm,
    rightmargin=0cm,
    linewidth=4pt,
    innerbottommargin=5pt]{cBox}

% Creates an environment for each type of theorem and assigns it a theorem text style from the "Theorem Styles" section above and a colored box from above
\newenvironment{theorem}{\begin{tBox}\begin{theoremeT}}{\end{theoremeT}\end{tBox}}
\newenvironment{exercise}{\begin{eBox}\begin{exerciseT}}{\hfill{\color{blueUniovi}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}				  
\newenvironment{definition}{\begin{dBox}\begin{definitionT}}{\end{definitionT}\end{dBox}}	
\newenvironment{example}{\begin{exampleT}}{\hfill{\tiny\ensuremath{\blacksquare}}\end{exampleT}}		
\newenvironment{corollary}{\begin{cBox}\begin{corollaryT}}{\end{corollaryT}\end{cBox}}	

%-------------------------------------------------------------------------------
%	REMARK ENVIRONMENT
%-------------------------------------------------------------------------------

\newenvironment{remark}{\par\vspace{10pt}\small % Vertical white space above the remark and smaller font size
\begin{list}{}{
\leftmargin=35pt % Indentation on the left
\rightmargin=25pt}\item\ignorespaces % Indentation on the right
\makebox[-2.5pt]{\begin{tikzpicture}[overlay]
\node[draw=blueUniovi!60,line width=1pt,circle,fill=blueUniovi!25,font=\sffamily\bfseries,inner sep=2pt,outer sep=0pt] at (-15pt,0pt){\textcolor{blueUniovi}{R}};\end{tikzpicture}} % Orange R in a circle
\advance\baselineskip -1pt}{\end{list}\vskip5pt} % Tighter line spacing and white space after remark

%-------------------------------------------------------------------------------
%	SECTION NUMBERING IN THE MARGIN
%-------------------------------------------------------------------------------

\makeatletter
\renewcommand{\@seccntformat}[1]{\llap{\textcolor{blueUniovi}{\csname the#1\endcsname}\hspace{1em}}}                    
\renewcommand{\section}{\@startsection{section}{1}{\z@}
{-4ex \@plus -1ex \@minus -.4ex}
{1ex \@plus.2ex }
{\normalfont\large\sffamily\bfseries}}
\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}
{-3ex \@plus -0.1ex \@minus -.4ex}
{0.5ex \@plus.2ex }
{\normalfont\sffamily\bfseries}}
\renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\z@}
{-2ex \@plus -0.1ex \@minus -.2ex}
{.2ex \@plus.2ex }
{\normalfont\small\sffamily\bfseries}}                        
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
{-2ex \@plus-.2ex \@minus .2ex}
{.1ex}
{\normalfont\footnotesize\sffamily\bfseries}}

%-------------------------------------------------------------------------------
%	PART HEADINGS
%-------------------------------------------------------------------------------

% numbered part in the table of contents
\newcommand{\@mypartnumtocformat}[2]{%
\setlength\fboxsep{0pt}%
\noindent\colorbox{blueUniovi!20}{\strut\parbox[c][.7cm]{\ecart}{\color{blueUniovi!70}\Large\sffamily\bfseries\centering#1}}\hskip\esp\colorbox{blueUniovi!40}{\strut\parbox[c][.7cm]{\linewidth-\ecart-\esp}{\Large\sffamily\centering#2}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unnumbered part in the table of contents
\newcommand{\@myparttocformat}[1]{%
\setlength\fboxsep{0pt}%
\noindent\colorbox{blueUniovi!40}{\strut\parbox[c][.7cm]{\linewidth}{\Large\sffamily\centering#1}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\esp
\setlength\esp{4pt}
\newlength\ecart
\setlength\ecart{1.2cm-\esp}
\newcommand{\thepartimage}{}%
\newcommand{\partimage}[1]{\renewcommand{\thepartimage}{#1}}%
\def\@part[#1]#2{%
\ifnum \c@secnumdepth >-2\relax%
\refstepcounter{part}%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@mypartnumtocformat{\thepart}{#1}}{\partname~\thepart\ ---\ #1}}
\else%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@myparttocformat{#1}}{#1}}%
\fi%
\startcontents%
\markboth{}{}%
{\thispagestyle{empty}%
\begin{tikzpicture}[remember picture,overlay]%
\node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%	
\fill[blueUniovi!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
\node[anchor=north] at (4cm,-3.25cm){\color{blueUniovi!40}\fontsize{220}{100}\sffamily\bfseries\@Roman\c@part}; 
\node[anchor=south east] at (\paperwidth-1cm,-\paperheight+1cm){\parbox[t][][t]{8.5cm}{
\printcontents{l}{0}{\setcounter{tocdepth}{1}}%
}};
\node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#2}};
\end{tikzpicture}};
\end{tikzpicture}}%
\@endpart}
\def\@spart#1{%
\startcontents%
\phantomsection
{\thispagestyle{empty}%
\begin{tikzpicture}[remember picture,overlay]%
\node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%	
\fill[blueUniovi!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
\node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#1}};
\end{tikzpicture}};
\end{tikzpicture}}
\addcontentsline{toc}{part}{\texorpdfstring{%
\setlength\fboxsep{0pt}%
\noindent\protect\colorbox{blueUniovi!40}{\strut\protect\parbox[c][.7cm]{\linewidth}{\Large\sffamily\protect\centering #1\quad\mbox{}}}}{#1}}%
\@endpart}
\def\@endpart{\vfil\newpage
\if@twoside
\if@openright
\null
\thispagestyle{empty}%
\newpage
\fi
\fi
\if@tempswa
\twocolumn
\fi}

%-------------------------------------------------------------------------------
%	CHAPTER HEADINGS
%-------------------------------------------------------------------------------

% A switch to conditionally include a picture, implemented by  Christian Hupfer
\newif\ifusechapterimage
\usechapterimagetrue
\newcommand{\thechapterimage}{}%
\newcommand{\chapterimage}[1]{\ifusechapterimage\renewcommand{\thechapterimage}{#1}\fi}%
\def\@makechapterhead#1{%
{\parindent \z@ \raggedright \normalfont
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
\draw[anchor=west] (\Gm@lmargin,-9cm) node [line width=2pt,rounded corners=15pt,draw=blueUniovi,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
\draw[anchor=west] (\Gm@lmargin+.3cm,-9cm) node {\huge\sffamily\bfseries\color{black}\thechapter. #1\strut};
\end{tikzpicture}};
\end{tikzpicture}
\else
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
\draw[anchor=west] (\Gm@lmargin,-9cm) node [line width=2pt,rounded corners=15pt,draw=blueUniovi,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
\draw[anchor=west] (\Gm@lmargin+.3cm,-9cm) node {\huge\sffamily\bfseries\color{black}#1\strut};
\end{tikzpicture}};
\end{tikzpicture}
\fi\fi\par\vspace*{270\p@}}}

%-------------------------------------------

\def\@makeschapterhead#1{%
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
\draw[anchor=west] (\Gm@lmargin,-9cm) node [line width=2pt,rounded corners=15pt,draw=blueUniovi,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
\draw[anchor=west] (\Gm@lmargin+.3cm,-9cm) node {\huge\sffamily\bfseries\color{black}#1\strut};
\end{tikzpicture}};
\end{tikzpicture}
\par\vspace*{270\p@}}
\makeatother

%-------------------------------------------------------------------------------
%	HYPERLINKS IN THE DOCUMENTS
%-------------------------------------------------------------------------------

\RequirePackage[
    unicode,
    driverfallback=dvipdfmx, 
    bookmarks, 
    colorlinks, 
    breaklinks
]{hyperref}  
\hypersetup{
    linkcolor=blueUniovi,
    citecolor=blueUniovi,
    filecolor=black,
    urlcolor=blueUniovi,
    bookmarksnumbered=true,
    bookmarksopen=true,         
    bookmarksopenlevel=1,
    pdfpagemode=UseOutlines
}

\usepackage{bookmark}
\bookmarksetup{
open,
numbered,
addtohook={%
\ifnum\bookmarkget{level}=0 % chapter
\bookmarksetup{bold}%
\fi
\ifnum\bookmarkget{level}=-1 % part
\bookmarksetup{color=blueUniovi,bold}%
\fi
}
}