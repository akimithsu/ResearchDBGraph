%-----------------------------------------------------------------------------
% UNSA.STY    Primary style for Grade Thesis
% USAGE:  (LaTeX2e)  \documentclass[options]{unsa}
%
% Modifies the {report} style, so that the title page and chapters
% are handled according to the UNSA EPIS requirements
%-----------------------------------------------------------------------------
%
%   Henry Huarsaya M.   Adapted from original of unknown source and pages added.
%   Ernesto Cuadros V.  + some updates
%   Percy Huertas N.    + some recommendations
%
%                       10/05/2004   3:30pm.
%-----------------------------------------------------------------------------
%
%   Pre-define commands required for option-processing
%
%-----------------------------------------------------------------------------
%
      \NeedsTeXFormat{LaTeX2e}[01/06/2002]
      \ProvidesClass{unsa}[09/04/2004 UNSA Thesis class]
%
% Define actions for style options
%
%
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
  \ProcessOptions*                  %% Process remaining options locally
  \LoadClass[a4paper]{report}       %% Standard REPORT format
  \RequirePackage{setspace}         %% Load package for double-spacing
%
%-----------------------------------------------------------------------------
%%%
%%% Override standard REPORT format for thesis layout requirements
%%%
\setstretch{1.5}            %Double spaced text
%-----------------------------------------------------------------------------
% Define packages

\usepackage{graphicx}
\usepackage{subfigure}
\usepackage{epsfig}
\usepackage{amssymb}
\usepackage{color}
%\usepackage[colorlinks]{hyperref}
%\usepackage{psfig}
%\usepackage{textfit}
%\usepackage[pdftex]{graphicx}
%\usepackage[pdftex]{graphics}
%\usepackage{longtable}
%\usepackage{makeidx}
%\usepackage{calc}
\usepackage{amsmath}
\usepackage{algorithm}
\usepackage{algorithmic}
\usepackage[latin1]{inputenc}
\usepackage[spanish]{babel}
\usepackage[%colorlinks=true,% red color
            %pdfstartview=FitV,
            %linkcolor=blue,citecolor=black, urlcolor=blue,
            bookmarks=true,
            %hyperindex=true,% raiselinks=false, %%%
            %pageanchor=true,
            %pagebackref=true
            ]{hyperref}
%-----------------------------------------------------------------------------
% Generate a blank page without page markers when needed
%
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}
\newcommand{\engtitle}{}

% Set up the margins
%
%\usepackage{a4wide}
\ifcase \@ptsize
    % mods for 10 pt
    \oddsidemargin  0.15 in     %   Left margin on odd-numbered pages.
    \evensidemargin 0.35 in     %   Left margin on even-numbered pages.
    \marginparwidth 1 in        %   Width of marginal notes.
    \oddsidemargin 0.25 in      %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 0.25 in
    \marginparwidth 0.75 in
    \textwidth 5.875 in % Width of text line.
\or % mods for 11 pt
    \topmargin 0.1 cm
    %\oddsidemargin -20 pt      %   Left margin on odd-numbered pages.
    %\evensidemargin 20 pt      %   Left margin on even-numbered pages.
    \marginparwidth 0 in        %   Width of marginal notes.
    \oddsidemargin 1.11 cm      %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 1.11 cm
    \marginparwidth -0.3 in
    \textwidth 5.700 in % Width of text line.
    \textheight 8.700 in
\or % mods for 12 pt
    \oddsidemargin -20 pt %-10 pt %   Left margin on odd-numbered pages.
    \evensidemargin 20 pt         %   Left margin on even-numbered pages.
    \marginparwidth 0 in %1 in    %   Width of marginal notes.
%    \oddsidemargin 0 in          %   Note that \oddsidemargin = \evensidemargin
%    \evensidemargin 0 in
    \oddsidemargin 0.5 cm         %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 0.5 cm
    \marginparwidth -0.3 in
    \textwidth 6.100 true in      % Width of text line.

\fi

%-----------------------------------------------------------------------------
% Set up the page styles
%
\RequirePackage{fancyheadings}

\renewcommand{\chaptermark}[1]
        {\markboth{\thechapter\ #1}{}}
\renewcommand{\sectionmark}[1]
        {\markright{\thesection\ #1}}
\lhead[\fancyplain{}{\thepage}]
      {\fancyplain{}{\rightmark}}
\rhead[\fancyplain{}{\leftmark}]
      {\fancyplain{}{\thepage}}
\cfoot[]{\fancyplain{\thepage}}

\renewcommand\chapter{\if@openright\clearemptydoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
%-----------------------------------------------------------------------------

% Create a command for unnumbered chapters, with a Table of Contents
% entry. (Not currently used)
%
\def\extrachapter{\@ifnextchar[{\@lextrachapter}{\@extrachapter}}

\def\@lextrachapter[#1]#2{% User specified optional contents entry
  \chapter*{#2}\addcontentsline{toc}{chapter}{#1}%
}

\def\@extrachapter#1{% Chapter heading used as contents entry
  \chapter*{#1}\addcontentsline{toc}{chapter}{#1}%
}

% We want roman page numbers in the frontmatter, and arabic afterward.
% use \begin{frontmatter} ... \end{frontmatter} to do this.
%
\newenvironment{frontmatter}%
{\pagenumbering{roman}}{\clearemptydoublepage\pagenumbering{arabic}}

\def\pubnum{\gdef\@pubnum}
\pubnum{}                       % No publication number

\def\ackname{\gdef\@ackname}
\ackname{}
%-----------------------------------------------------------------------------
%
% The titlepage must conform to UNSA requirements
% We specify a new command to make the title
%
%-----------------------------------------------------------------------------

\newcommand{\makeFirstCover}{%
\voffset = 0cm
\clearemptydoublepage
\thispagestyle{empty}
 \begin{center}
     %\hrule \bigskip
     %{\Huge\sf \expandafter{ TESIS DE GRADUACI\'{O}N}}
     %\bigskip\hrule
     \vspace*{2in}
        {\LARGE\sf \expandafter{\@Análisis de interacción de datos en base de datosusando Neo4j}}\\
      \vspace*{0.7in}
    {\Large\sf \@Rodrigo Mamani Sucacahua}\\
    \vspace*{3.2in}
    \vspace*{\stretch{2.5}}
    \textsf{Arequipa, Perú}\\
    \textsf{ $\,$\the\year$\,$}
  \end{center}
   \pagebreak
   \voffset = 0cm
}

%-----------------------------------------------------------------------------
%
\def\numberthesis{\gdef\@numberthesis}
\numberthesis{}
\newcommand{\makeSecondCover}{%
\enlargethispage{29cm}
\ackname{Agradecimientos}
\voffset = -1.7cm
\clearemptydoublepage
\thispagestyle{empty}
   \begin{center}
      \centerline{\includegraphics[scale=0.7]{unsa.png}}
      \vspace*{0.3cm}
      \hrule
      \vspace*{\stretch{4}}
\begin{singlespace}
      {\LARGE \textbf \@title \par}

      \vspace*{3cm}
Por\\
     { \textbf \@author}\\
      \vspace*{\stretch{1}}

Tesis presentada a la\\Escuela Profesional de Ciencia de la Computaci\'{o}n \\de la\\
UNIVERSIDAD NACIONAL DE SAN AGUST\'{I}N\\para el curso de Proyecto Final de Carrera I
\end{singlespace}
      \vspace*{\stretch{6}}
      \end{center}
   \pagebreak
   \voffset = 0cm
}
%
%-----------------------------------------------------------------------------
%
\newcommand{\dedicatory}{%
\clearemptydoublepage
\pagestyle{plain}
   \begin{flushright}
      \vspace*{2.6cm}
      \begin{tabular}{p{6.45cm}}
      {\normalsize\it \@dedicate}
      \end{tabular}
   \end{flushright}
   \pagebreak
   \voffset = 0cm
}

%-----------------------------------------------------------------------------
% The approval page is created with the approved command.
% First we set up some macros and commands to use when creating
% the page.
%
\gdef\@examinerone{}
\newcommand{\examinerone}[2]{\gdef\@examinerone{#1\\\textsc{#2}}}
\gdef\@examinertwo{}
\newcommand\examinertwo[2]{\gdef\@examinertwo{#1\\\textsc{#2}}}
\gdef\@examinerthree{}
\newcommand\examinerthree[2]{\gdef\@examinerthree{#1\\\textsc{#2}}}
\gdef\@examinerfour{}
\newcommand\examinerfour[3]{\gdef\@examinerfour{#1\\\textsc{#2}\\#3}}

\def\dedicate{\gdef\@dedicate}
\dedicate{}

%-----------------------------------------------------------------------------
\newcommand {\sigline}[1]
        {\vspace{0.4in} {\makebox[3in][l] {\hrulefill} \\}
        {\vspace{0.05in} #1\\}}

%-----------------------------------------------------------------------------
\newlength{\approval}
        \settowidth {\approval}
        {This thesis is submitted in partial fulfillment
         of UNSA FIPS EPIS requirements}

\newcommand{\approved}[1]{
\setcounter{page}{3}
\clearemptydoublepage
\pagestyle{plain}

\begin{singlespace}
\begin{center}
\noindent

\begin{minipage}{\approval} {
\begin{center}
{\large \textsc{Universidad Nacional de San Agust\'{i}n\\
Facultad de Ingenier\'{i}a de Producci\'{o}n y Servicios\\
Escuela Profesional de Ciencia de la Computaci\'{o}n \\}}
\vspace{2cm}
\large \@title \\
\vspace{1cm}
\end{center}
Tesis de graduación presentado por el bachiller \@author \hspace{0.2mm} en el cumplimiento de los
requisitos para obtener el t\'{i}tulo profesional de Licenciado en Ciencia de la Computaci\'{o}n.\\

\begin{flushright}
{Arequipa, \@date} % the variable \@date{} or \today is valid
\end{flushright}

Aprobado por:}
\end{minipage}

\vspace{1.5cm}
\newif \ifthreeexaminer

 \threeexaminertrue or \threeexaminerfalse

\newcommand{\tres}{\threeexaminertrue}

\newcommand{\cuatro}{\threeexaminerfalse}
    #1
    \ifthreeexaminer
        \sigline{\@examinerone} \vspace{0.6cm}\sigline{ \@examinertwo}
         \vspace{0.6cm}\sigline{ \@examinerthree}
        \end{center}
    \else
            \end{center}
            \begin{tabular}{p{0.422\textwidth}@{\qquad\qquad}p{0.422\textwidth}}
                \begin{center}
                \hrulefill\par \@examinerone
                \end{center}
            & \begin{center}
                \hrulefill\par \@examinertwo
                \end{center} \\
                \vspace{1cm}
                \begin{center}
                \hrulefill\par \@examinerthree
                \end{center}
            & \vspace{1cm} \begin{center}
                \hrulefill\par \@examinerfour
                \end{center} \\
            \end{tabular}\vfill
            %\@date\vfill
            \vspace{1cm}
    \fi

\end{singlespace}
}

%-----------------------------------------------------------------------------

% Set up the abstract, acknowledgement and others sections

\def\abstract{\clearemptydoublepage\chapter*{\abstractname}} % \begin{abstract}
\def\endabstract{\clearemptydoublepage}     % \end{abstract}
\def\acknowledgements{\clearemptydoublepage\chapter*{\@ackname}}
\def\endacknowledgements{\clearemptydoublepage}

\newcommand{\mybibliography}[1]
{\addcontentsline{toc}{chapter}{Bibliografía}
\bibliography{#1}}

\newcommand{\myAcknowledgements}[1]
{\addcontentsline {toc}{chapter}{Agradecimientos}
{\typeout{Acknowledgements}
\include{#1}}}

\newcommand{\myResumen}[1]
{\addcontentsline {toc}{chapter}{Resumen} {\typeout{Abstract}
\include{#1}}}

\newcommand{\myAbstrac}[1]
{\addcontentsline{toc}{chapter}{Abstract} {\typeout{Abstract}
\include{#1}}}

\newcommand{\myappendix}[1]
{\appendix { \typeout{Ap\'{e}ndice}
\include{#1}}}

%-----------------------------------------------------------------------------
\endinput
%-----------------------------------------------------------------------------
