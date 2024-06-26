%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% oup-contemporary.cls, v1.1, 2017/06/28
% Developed by Overleaf
% 
% This class file enables authors to prepare 
% manuscripts for submission to OUP journals using the
% 'contemporary' layout.
%
% V1.0 Supported journals:
% - gigascience
% - general
%
% V1.1
% - Moved logos to top level (EM requirements)
% - Handles missing/empty logo files

%Astronomy Education Journal: This template has been modified from the OUP Gigascience template downloaded from Overleaf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\ProvidesClass{aejstyles}[2017/06/28, v1.1]

\newif\if@numrefs
\newif\if@alpharefs

%% Options for bibliography style
\DeclareOption{alpha-refs}{
  \@numrefsfalse
  \@alpharefstrue
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{alpha-refs}
\ProcessOptions\relax
\LoadClass[twoside,twocolumn]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ifpdf}
\RequirePackage{microtype}
\RequirePackage{euler}
\RequirePackage[defaultfam,tabular,lining]{montserrat} %% Option 'defaultfam'
%% only if the base font of the document is to be sans serif
\RequirePackage[T1]{fontenc}
\renewcommand*\oldstylenums[1]{{\fontfamily{Montserrat-TOsF}\selectfont #1}}
\renewcommand{\ttdefault}{lmtt}
\RequirePackage[italic]{mathastext}
\RequirePackage{relsize}
\RequirePackage{ragged2e}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{graphicx}
\RequirePackage{etoolbox,xpatch}
\RequirePackage{environ}
\RequirePackage{lastpage}
\RequirePackage[figuresright]{rotating} % Liam Nolan added option figuresright for aesthetic purposes
\RequirePackage{rotating}
\RequirePackage{lscape}
\RequirePackage{afterpage}
\RequirePackage[absolute]{textpos}
\RequirePackage{url}
\RequirePackage{newfloat}
\RequirePackage{mdframed}
\RequirePackage{titlesec}

\RequirePackage{scrextend}
\changefontsizes[10.5pt]{7.5pt}

\RequirePackage{calc}
\RequirePackage{geometry}
\geometry{includefoot,
  hmargin=4pc+6.64pt,
  bottom=2pc+10pt,
  top=5pc+6pt,
  headsep=2pc,
  headheight=17.5pt,
  footnotesep=1pc+6pt,
  columnsep=18pt}
\setlength{\parindent}{12pt}
%\setlength{\parskip}{1em}Spacing between paragraphs

\RequirePackage[colorlinks,allcolors=black,urlcolor=blue,citecolor=blue, linkcolor = blue]{hyperref}

\RequirePackage[noblocks]{authblk}

\def\@ouplogo{imagen_c.png}

\def\@jname{eSPECTRA}
\def\@jlogo{imagen.png}

\newcommand{\jname}[1]{\def\@jname{#1}}
\newcommand{\jlogo}[1]{\def\@jlogo{#1}}

\def\@jyear{20xx}
\def\@jvolume{0}
\def\@jnumber{0}
\def\@jstartpage{1}

\newcommand{\jyear}[1]{\def\@jyear{#1}}
\newcommand{\jvolume}[1]{\def\@jvolume{#1}}
\newcommand{\jnumber}[1]{\def\@jnumber{#1}}
\newcommand{\jstartpage}[1]{\def\@jstartpage{#1}}

\def\@papercat{}
\def\@runningauthor{}
\def\@runningtitle{}
\def\@corraddress{}
\def\@authnotes{}
\colorlet{jcolour}{blue!40}

\newif\ifSFB@appendix
\def\appendix{\par
 \SFB@appendixtrue
 \@addtoreset{equation}{section}
 \@addtoreset{table}{section}
 \@addtoreset{figure}{section}
 \setcounter{section}{0}
 \setcounter{equation}{0}
 \setcounter{figure}{0}
 \setcounter{table}{0}
 \def\thesection{\Alph{section}}
 \renewcommand\thesubsection{\thesection\arabic{subsection}}
 \renewcommand\theequation{\thesection\arabic{equation}}
  \renewcommand\thefigure{\thesection\@arabic\c@figure}
  \renewcommand\thetable{\thesection\@arabic\c@table}
  \renewcommand{\theHsection}{A\arabic{section}} % for hyperref links
}


\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
\newcommand{\runningtitle}[1]{\def\@runningtitle{#1}}
\newcommand{\corraddress}[1]{\def\@corraddress{#1}}
\newcommand{\authnote}[1]{\appto{\@authnotes}{#1\par}}
\newcommand{\papercat}[1]{\def\@papercat{#1}}

\newcommand{\journal}[1]{%
  \ifstrequal{#1}{aej}{%
    \jname{eSPECTRA}%
    \jlogo{imagen.png}   
    \definecolor{jcolour}{RGB}{60, 52, 140}%{101,45,146}
    \definecolor{issncolour}{RGB}{104,103,102}%
  }
}
\RequirePackage[flushmargin,bottom]{footmisc}
\appto{\footnotelayout}{\fontsize{6.5pt}{9.5pt}\selectfont}
\deffootnote{1.5em}{1.5em}{\thefootnotemark\enspace}

\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrule}{\color{black!15}\rule{\textwidth}{2pt}}
\fancyhead[LE]{%
  \hspace*{12pt}%
  \fontsize{7.8pt}{10pt}\selectfont%
  \color{jcolour}%
  \textbf{\thepage}%
  \hspace{1em}\raisebox{-0.5pt}{|}\hspace{1em}%
  \textit{\@jname}, Vol.~\@jvolume, Núm.~\@jnumber~(\@jyear)
}
\fancyhead[RO]{%
  \fontsize{7.8pt}{10pt}\selectfont%
  \color{jcolour}%
  \@runningauthor%
  \hspace{1em}\raisebox{-0.5pt}{|}\hspace{1em}%
  \textbf{\thepage}%
  \hspace*{12pt}%
}

\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\headrule}{}
  \fancyfoot[R]{%
    \fontsize{7.8pt}{10pt}\selectfont%
    \color{jcolour}%
    \textbf{\thepage}\hspace*{12pt}%
  }
}


\pagestyle{fancy}

\AtBeginDocument{%
  \newsavebox{\@gscitedetails}
  \newlength{\@gscitedetailsheight}
  \newsavebox{\@gsheadbox}
  \newlength{\@gsheadboxheight}
  \savebox{\@gscitedetails}{%
    \parbox{\textwidth-21pc+4pc+6.64pt}{%
%     \normalfont{\itshape\bfseries\@jname}, \@jyear, \@jstartpage--\pageref{LastPage}\par
%     \vspace{\dimexpr 8pt-1em\relax}
    {\color{black!20}\rule{\linewidth}{1pt}}\par%
    \vspace{\dimexpr 8pt-1em\relax}%
    \fontsize{8pt}{14pt}\itshape%\bfseries%
\href{https://astronomiaoan.github.io/espectra}{\textcolor{blue}{https://astronomiaoan.github.io/espectra}}\\
    \textcolor{issncolour}{Publicado en Colombia}\par
    {\textcolor{issncolour}{\textcopyright\ Los autores \@jyear}}\par
   %Manuscript in Preparation\par
    %\@papercat\par
    \vspace{\dimexpr 8pt-1em\relax}%
    {\color{black!5}\rule{\linewidth}{0pt}}\par
  }}%
  \settototalheight{\@gscitedetailsheight}{\usebox{\@gscitedetails}}%
  %%%%
  \savebox{\@gsheadbox}{%
    \parbox{\textwidth-21pc+4pc+6.64pt}{%
    \normalfont%
    \fontsize{9.pt}{9.5pt}\selectfont%
    {\itshape\bfseries\@jname}, Vol.~\@jvolume, Núm.~\@jnumber~(\@jyear) %\@jstartpage--\pageref{LastPage}%
    \par
    \vspace{\dimexpr 8pt-1.5pt\relax}%
    \usebox{\@gscitedetails}
    }%
  }%
  \settototalheight{\@gsheadboxheight}{\usebox{\@gsheadbox}}%
}

\RequirePackage{alphalph}
\newalphalph{\fnsymbolmult}[mult]{\@fnsymbol}{5}

\newcounter{authorfn}
\setcounter{authorfn}{1}
\newcommand{\authfn}[1]{%
  \fnsymbolmult{#1}%
}

\renewcommand\Authand{ and }
\renewcommand\Authands{ and }
\renewcommand\AB@affilsepx{ \\ }
\renewcommand{\Authfont}{\fontsize{11pt}{18pt}\selectfont}
\renewcommand{\Affilfont}{\fontsize{8pt}{13pt}\selectfont}
\setlength{\affilsep}{21pt-9pt}

\AtBeginDocument{
\renewcommand{\@maketitle}{%
  \textblockorigin{4pc+6.64pt}{4pc+6pt}
  %%%%
  \begin{textblock*}{21pc}(0pt,0pt)
  \IfFileExists{\@ouplogo}{%
    \includegraphics[height=\@gsheadboxheight]{\@ouplogo}%
  }{%
    %\fbox{\begin{minipage}[b][\@gsheadboxheight]{\@gsheadboxheight}
    %\raggedright
    %Placeholder for OUP logo \@ouplogo
    %\end{minipage}}%
  }
  \hspace{0pt}%
  %% Do absolutely nothing if \@jlogo is empty string
  \ifdefempty{\@jlogo}{}{%
  \IfFileExists{\@jlogo}{%
    \includegraphics[height=80px]{\@jlogo}
    %\includegraphics[height=\@gscitedetailsheight]{\@jlogo}
  }{%
    \fbox{\begin{minipage}[b][\@gsheadboxheight]{\@gsheadboxheight}%
    \raggedright Placeholder for journal logo \@jlogo
    \end{minipage}}%
  }}
  \end{textblock*}
  %%%
  \begin{textblock*}{\textwidth-21pc}(21pc,0pt)
  \usebox{\@gsheadbox}
  \end{textblock*}%
  %%%
  \null\vspace*{\dimexpr 13pc+11pt-5pc-6pt\relax}%
  \raggedright%
  {\fontsize{15pt}{10pt}\selectfont%
    \ifpdf
      \textls[200]{\relsize{-1}\MakeUppercase{\@papercat}}
       \vspace{\dimexpr 20pt-1em\relax}%
    {\noindent\color{black!40}\rule{\hsize+4pc+6.64pt}{1pt}}\par
    \else %%% don't use letterspace in latex+dvi
      \relsize{-1}\MakeUppercase{\@papercat}%
    \fi%
    \par}
  \vspace{\dimexpr 26pt-18pt\relax}
  {\fontsize{17pt}{18pt}\bfseries\color{jcolour}\@title\par}
  \vspace{\dimexpr 26pt-13pt\relax}
  \@author\par
  \vspace{\dimexpr 15.5pt-1em}
  {
    \renewcommand{\authfn}[1]{%
      \textsuperscript{\fnsymbolmult{##1}}%
    }
    {\fontsize{6.5pt}{9.5pt}\selectfont\@authnotes\par}%
  }
  \vspace{\dimexpr 16pt-3pt-1em\relax}
}
}

\RequirePackage[style]{abstract}
\setlength{\absleftindent}{20pt}
\setlength{\absrightindent}{0pt}
\setlength{\absparindent}{12pt}
\setlength{\absparsep}{0pt}
\setlength{\abstitleskip}{16pt-8pt-\baselineskip}
\renewcommand{\abstractnamefont}{\hspace{20pt}\fontsize{11pt}{12pt}\bfseries\color{jcolour}}
\renewcommand{\abstitlestyle}[1]{{\abstractnamefont #1}}
\renewcommand{\abstracttextfont}{\fontsize{8pt}{11pt}\selectfont}
\preto{\abstract}{%
  {\noindent\color{jcolour!40}\rule{\hsize+0pc+0pt}{1pt}}\par
  \vspace*{\dimexpr 23pt-10pt\relax}
}
\appto\abstract{\noindent\raggedright\ignorespaces}
\preto\endabstract{\par}

\newenvironment{skeywords}
{\vspace*{\dimexpr 19pt-8pt-\baselineskip\relax}%
\hspace{20pt}
\noindent\fontsize{8pt}{20pt}\selectfont\textbf{Palabras clave:} \ignorespaces}%
{\par}

\newenvironment{keywords}
{\vspace*{\dimexpr 19pt-8pt-\baselineskip\relax}%
\hspace{20pt}
\noindent\fontsize{8pt}{20pt}\selectfont\textbf{Keywords:} \ignorespaces}%
{\par}



%\DeclareFloatingEnvironment[placement=t!,name=kpt]{keypoints}
\DeclareFloatingEnvironment[placement=t,name=kpt]{keypoints}

\xapptocmd{\keypoints}{%
  \begin{mdframed}[linewidth=0pt,linecolor=black!20, backgroundcolor=black!5, innerleftmargin=8pt,innerrightmargin=8pt,
  innertopmargin=10pt-8.2pt,innerbottommargin=6pt]
  {\fontsize{8.2pt}{10pt}\bfseries Key Points\par}
  \end{mdframed}
}{}{}

\xapptocmd{\endkeypoints}{}{}{}

\if@twocolumn
  \NewEnviron{frontmatter}
  {\twocolumn[%
      \BODY%
      \vspace*{\dimexpr 16pt-3pt-1em\relax}
      {\noindent\color{jcolour!40}\rule{\hsize+0pc+0pt}{3pt}}\par
      \vspace*{\dimexpr 23pt-1em\relax}]%
    \begin{figure*}[b!]
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \hrule%
      \vspace{\dimexpr 14pt-6.5pt\relax}%
      %\textbf{Compiled on:} \today.\par
      %Draft manuscript prepared by the author.\par
    \end{figure*}
  }
\else
  \NewEnviron{frontmatter}{%
      \BODY%
      \vspace*{\dimexpr 16pt-3pt-1em\relax}
      {\noindent\color{jcolour!40}\rule{\hsize+4pc+6.64pt}{3pt}}\par
      \vspace*{\dimexpr 23pt-1em\relax}%
    \begin{figure*}[b!]
      \fontsize{6.5pt}{9.5pt}\selectfont%
      \hrule%
      \vspace{\dimexpr 14pt-6.5pt\relax}%
      %\textbf{Compiled on:} \today.\par
      %Draft manuscript prepared by the author.\par
    \end{figure*}
  }
\fi

\setcounter{secnumdepth}{2}
\titleformat*{\section}{\fontsize{11pt}{12pt}\bfseries\color{jcolour}}
\titlespacing*{\section}{0pt}{26.5pt-1em}{16pt-1em}
\titleformat*{\subsection}{\fontsize{9pt}{11pt}\bfseries\color{jcolour}}
\titlespacing*{\subsection}{0pt}{2pc-1em}{17pt-1em}
\titleformat*{\subsubsection}{\normalsize\bfseries\slshape}
\titlespacing*{\subsubsection}{0pt}{\baselineskip}{0pt}
\titleformat{\paragraph}[runin]{\normalsize\itshape}{\theparagraph}{0pt}{}[.\enspace]
\titlespacing*{\paragraph}{0pt}{\baselineskip}{0pt}
  \titleformat{\subparagraph}[runin]{\relsize{-1}\uppercase}{\thesubparagraph}{0pt}{}[.\enspace]
\titlespacing*{\subparagraph}{0pt}{\baselineskip}{0pt}

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[itemize]{leftmargin=12pt,topsep=16pt-1em}
\setlist[enumerate]
{itemindent=-1pt,topsep=16.8pt-1em,
 label={\arabic*.},labelsep=7pt,
 labelwidth=*,leftmargin=*,align=right,labelindent=5pt}


% quotes and epigraphs
%\RequirePackage{quoting}
%\newcommand{\quotefont}{\fontsize{6.5pt}{9.5pt}\selectfont}
%\quotingsetup{vskip=16pt-1em,indentfirst=false,font={itshape,quotefont},leftmargin=12pt,rightmargin=12pt}

\renewenvironment{quote}{\begin{quoting}}{\end{quoting}}

\renewenvironment{quotation}{\begin{quoting}}{\end{quoting}}

\newenvironment{epigraph}[1]
{\begin{quoting}[font={itshape,fontsize{7.5pt}{10.5pt}},vskip=15pt-1em,leftmargin=0pt,rightmargin=0pt]%
 \def\@quotesource{#1}}
{\par\vspace{\dimexpr 15pt-1em\relax}{\upshape---\@quotesource}\end{quoting}}

% Space above/below equations
\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{\baselineskip}%
  \setlength\belowdisplayskip{\baselineskip}%
  \setlength\abovedisplayshortskip{\baselineskip}%
  \setlength\belowdisplayshortskip{\baselineskip}%
}
\usepackage{amsmath}

\RequirePackage{stfloats}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
% Left-, right- and center-aligned auto-wrapping column types
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}

\AtBeginEnvironment{tabularx}{%
  \fontsize{7pt}{10pt}\selectfont
}
\AtBeginEnvironment{tabular}{%
  \fontsize{7pt}{10pt}\selectfont
}

\setlength{\aboverulesep}{11pt-1em}
\setlength{\belowrulesep}{11pt-1em}
\setlength{\heavyrulewidth}{0.5pt}
\setlength{\lightrulewidth}{0.5pt}
\arrayrulecolor{jcolour}


\newcommand{\tnote}[1]{\textsuperscript{\textit{#1}}}
\newlist{tablenotes}{itemize}{1}
\setlist[tablenotes]{label={},labelsep=0pt,leftmargin=0pt,topsep={\dimexpr 12pt-1em\relax}}
\appto{\tablenotes}{\fontsize{6pt}{9pt}\selectfont}

\RequirePackage[tableposition=top]{caption}
\DeclareCaptionFont{figcaptionfont}{\fontsize{6pt}{9pt}\selectfont}
\DeclareCaptionFont{tabcaptionfont}{\fontsize{7pt}{9pt}\selectfont}
\captionsetup{justification=justified,singlelinecheck=false,labelfont={bf},labelsep=period}
\captionsetup*[figure]{font=figcaptionfont,skip=10pt}
\captionsetup*[table]{font=tabcaptionfont,skip=10pt-1em}

% Skips for floats
\setlength{\floatsep}{1pc+6pt}
\setlength{\intextsep}{1pc+6pt}
\setlength{\textfloatsep}{1pc+6pt}

% References
\if@numrefs
  \RequirePackage[numbers]{natbib}
  \bibliographystyle{vancouver-authoryear}
\fi
\if@alpharefs
    \usepackage[natbibapa]{apacite}
    \bibliographystyle{apacite}
\fi
\setlength{\bibhang}{11pt}
\setlength{\bibsep}{0pt}
\renewcommand{\bibnumfmt}[1]{#1.}
  

