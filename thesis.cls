%
% This template has been created by Theo J. Mertzimekis, PhD
% It can be modified freely to meet your needs.
% Help in using this thesis can be found here:
% http://users.uoa.gr/~tmertzi/LaTeX
%
% As a minimal credit to the creator, please do not remove the lines above
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2022/10/26 Final Degree Project]
\LoadClass[11pt]{report}

% ---- COLORS ----
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% ---- we are setting up the layout of the document
\usepackage{geometry}
\geometry{a4paper,textwidth=150mm,textheight=220mm,marginparsep=4pt}
\setlength\parindent{8mm}
\setlength\parskip{3mm}
% -- we set the line spacing for the tabulars to 1.25 
\usepackage{setspace}
\setlength{\tabcolsep}{1mm}
\renewcommand{\arraystretch}{1.25}

% ---- we are setting up the fonts for this document
\usepackage{notomath}
\defaultfontfeatures{Mapping=tex-text} % converts LaTeX specials 

% ---- we are setting up the way enumerations are shown
\renewcommand\thesection{\arabic{section}}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3} % adding the depth to the subsubsection numbering
\renewcommand{\labelitemi}{$\blacktriangleright$}
\renewcommand{\labelitemii}{$\bullet$}

% ---- we are setting up some custom headings
% -- custom headings
\usepackage{sectsty} 
\usepackage[normalem]{ulem}
\sectionfont{\rmfamily\mdseries\upshape\Large}
\subsectionfont{\rmfamily\bfseries\upshape\normalsize} 
\subsubsectionfont{\rmfamily\mdseries\upshape\normalsize}

% ---- we are setting up some highlighting for the hrefs
\usepackage[
    unicode,
    driverfallback=dvipdfmx, 
    bookmarks, 
    colorlinks, 
    breaklinks, 
    pdftitle={Ángel Iglesias Préstamo - Analysis and implementation of an algorithm to validate Knowledge Graphs using Big data techniques},
    pdfauthor={UO270534}
]{hyperref}  
\hypersetup{
    linkcolor=blue,
    citecolor=blue,
    filecolor=black,
    urlcolor=blue,
    bookmarksnumbered=true,
    bookmarksopen=true,         
    bookmarksopenlevel=1,
    pdfpagemode=UseOutlines
} 

% beautiful quotes at the beginning of each chapter
\RequirePackage{epigraph}
\setlength\epigraphwidth{8cm}
\setlength\epigraphrule{0pt}
\renewcommand{\textflush}{flushepinormal}

% package allowing to break URLs also by hyphens
\usepackage{url}
\def\UrlBreaks{\do\/\do-}

% giving definitions an appropriate styling
\newtheorem{definition}{Definition}[section]
\newtheorem{example}{Example}[section]