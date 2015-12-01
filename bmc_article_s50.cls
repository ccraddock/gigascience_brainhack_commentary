%%                                           %
 %    bmc_article.cls             ver: 1.03  %
 %                                           %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %                                          %%
 %    A Style Class based on article for    %%  
 %     formating towards BioMed Central     %%
 %               guidelines                 %%
 %                                          %%
 %           <1 September 2003>             %%
 %                                          %%
 %                                          %%
 %                                          %%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 
 % See Readme.txt for ToDo list.
%%
%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{bmc_article}[2003/09/01 v1.01 BioMed Central article class]
\LoadClassWithOptions{article} 

\renewcommand\@biblabel[1]{#1.}
\def\hi{}

\AtBeginDocument{}

\def\@abstractline{\textwidth}

\newcounter{bmc@correspondingauthor} 
\setcounter{bmc@correspondingauthor}{0} %never changes
\newcounter{bmc@emailcounter} \setcounter{bmc@emailcounter}{0}


% Corresponding Authors.
% adds an asterisk * as a marker.
\def\correspondingauthor{$^*$}
\def\@corresponding{\footnotesize\correspondingauthor Corresponding author} 


%%%%%%%%%%%%%% TITLE %%%%%%%%%%%%%%%%%%%%

%% Article Email

\renewcommand{\maketitle}{
\begin{flushleft}
\fontsize{20.7pt}{19.07pt}\fontfamily{ptm}\fontseries{b}
\fontshape{u}\selectfont
    \@title
\end{flushleft}
}

%%%%%%%%%%%%%%%% author, email and corauthor %%%%%%%%%%%%%%%%%%%%
\renewcommand\author[2][]{\relax
    {\hspace*{56pt}#2\hspace*{0pt}$^{#1}$\\}}

\newcommand\email[1]{\relax
    {\hspace*{56pt}\vspace*{15pt}Email: #1\\}}

\newcommand\cor[1]{\relax
    {\hspace*{56pt}$^*$Corresponding author\\}}

\newcommand\address[2][]{\relax
    {\hspace*{56pt}$^#1$#2}\vspace*{7pt}\\}
    
% reformats abstract to BMC looks 
\let\old@abstract\abstract 
\renewenvironment{abstract}                  
   { \begin{framed}
      \ifhmode\begingroup\parskip0pt\par\noindent\endgroup\fi%
    %  \begin{sffamily}
       % use \topsep in list
            {\noindent\Large\bfseries\abstractname\vspace{-0.5em}}
                {\par\vbox{}} 
     \raggedright}{                                     
            \ifhmode\begingroup\parskip0pt\par\noindent\endgroup\fi % 
         % \end{sffamily}                         
         \end{framed}
   }



%% \@startsection{sec-name}{level}{indent}{pre-skip} 
%%               {post-skip}{style}*[srt title]{title}
\parskip = 1.2\baselineskip
\renewcommand\section{\@startsection {section}{1}{\z@}%
                     {-0.3cm \@plus 1ex \@minus -.2ex} {2pt\@plus.2ex} %%
                     {\normalfont\large\bfseries}}
                     \raggedright
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                     {-0.20cm \@plus -1ex \@minus -.2ex} {1pt \@plus.2ex} %%
                     {\normalfont\normalsize\bfseries}}
                     \raggedright
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                     {-0.15cm \@plus -1ex \@minus -.2ex} {.2ex \@plus.2ex} %%
                     {\normalfont\normalsize\bfseries\itshape}}
                     \raggedright
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                    {12.5pt \@plus1ex \@minus.2ex}%
                    {-.5em}%
                    {\normalfont\normalsize\bfseries}}
%%\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%%                     {-0.10cm \@plus -1ex \@minus -.2ex}{0.5pt \@plus.2ex}
%%                     {\normalfont\normalsize\bfseries}}
%%                     \raggedright
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                     {-.2em \@plus -1ex \@minus -.2ex} {-0.5em} %%
                     {\normalfont\it}}
                     \raggedright
                     
%%%%%%%%%%%%%%%S50 Requirements%%%%%%%%%%%%%%%%%%

\RequirePackage{times}
%\usepackage{mathtime}
%\RequirePackage[T1,mtbold]{bmc-mathtime}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathrsfs}
\RequirePackage{framed_v1}

\RequirePackage[nospace]{cite}
\renewcommand{\citedash}{\mbox{-}\penalty\citepunctpenalty}

%%%%%%%%%%%%%%%Floats %%%%%%%%%%%%%%%%%%

%%\def\tablename{\bf Table}
%%\def\figurename{\bf Figure}
%%
%%\long\def\@makecaption#1#2{%
%%  \vskip\abovecaptionskip
%%  \sbox\@tempboxa{#1\hspace*{4pt}\ #2}%
%%  \ifdim \wd\@tempboxa >\hsize
%%    #1\hspace*{4pt}\ #2\par
%%  \else
%%    \global \@minipagefalse
%%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%%  \fi
%%  \vskip\belowcaptionskip}
\RequirePackage{xstring}
\RequirePackage{etoolbox}
\RequirePackage{caption}
\captionsetup{labelfont=bf,labelsep=space,singlelinecheck=off}
\makeatletter
\newcommand\formatlabel[1]{%
    \noexpandarg
    \IfSubStr{#1}{.}{%
      \StrBefore{#1}{.}[\firstcaption]%
      \StrBehind{#1}{.}[\secondcaption]%
      \textbf{\firstcaption.} \secondcaption}{%
      #1}%
      }


\patchcmd{\@caption}{#3}{\formatlabel{#3}}
\makeatother
  
%%%%%%%%%%%%%%%--Enunciation--%%%%%%%%%%%%%%%%%%

\RequirePackage{amsthm}
\makeatletter
\let\proof\relax
\let\endproof\relax
\newif\ifproofthm
\def\@endtheorem{\ifproofthm\qed\global\proofthmfalse\fi\endtrivlist\@endpefalse }
\makeatother

\newtheoremstyle{bmcstyleone}
  {} % Space above
  {} % Space below
  {\normalfont} % Body font
  {\parindent} % Indent amount
  {\bfseries} % Theorem head font
  {.} % Punctuation after theorem head
  {.5em} % Space after theorem head
  {} % Theorem head spec (can be left empty, meaning `normal')

\newtheoremstyle{bmcstyletwo}
  {} % Space above
  {} % Space below
  {\normalfont} % Body font
  {} % Indent amount
  {\itshape} % Theorem head font
  {.} % Punctuation after theorem head
  {.5em} % Space after theorem head
  {\thmname{#1}\thmnumber{ #2}\thmnote{. #3}} % Theorem head spec (can be left empty, meaning `normal')
  
\newtheoremstyle{bmcstylethree}
  {} % Space above
  {} % Space below
  {\itshape} % Body font
  {\parindent} % Indent amount
  {\bfseries} % Theorem head font
  {.} % Punctuation after theorem head
  {.5em} % Space after theorem head
  {} % Theorem head spec (can be left empty, meaning `normal')

%%%%%%%%%%%%%%%=Proof=%%%%%%%%%%%%%%%%%%

\newtheoremstyle{bmcproofone}% Proof
{12pt}% Space above
{12pt}% Space below
{\normalfont}% Body font
{\parindent}% Indent amount
{\itshape}% Theorem head font
{.}% Punctuation after theorem head
{.35em}% Space after theorem headi
{\global\proofthmtrue\thmname{#1}}% Theorem head spec (can be left empty, meaning `normal')

\newtheoremstyle{bmcprooftwo}% Proof
{12pt}% Space above
{12pt}% Space below
{\normalfont}% Body font
{\parindent}% Indent amount
{\bfseries}% Theorem head font
{.}% Punctuation after theorem head
{.35em}% Space after theorem headi
{\global\proofthmtrue\thmname{#1}}% Theorem head spec (can be left empty, meaning `normal')
 
%%%%%%%%%%%%%%%--Keywords--%%%%%%%%%%%%%%%%%%

\def\abshead#1{{\bfseries\large #1}\par}
\def\pacs#1{\textbf{\large Pacs}\par #1}
\def\keywords#1{\textbf{\large Keywords}\par #1}
\def\pacs#1{\textbf{\large Pacs}\par #1}


%%%%%%%%%%%%%%% Reference %%%%%%%%%%%%%%%%%%

\def\nameyear{\usepackage{natbib}\bibpunct[, ]{(}{)}{;}{a}{}{,}}

%%%%%%%%%%%%%%%--EndNotes--%%%%%%%%%%%%%%%%%%
\RequirePackage{endnotes}
\let\footnote=\endnote
\renewcommand{\notesname}{Endnotes}
\renewcommand\enoteformat{\vspace*{-12pt}\normalsize\rightskip=0pt \leftskip=0pt \parindent=0em
  \leavevmode\makeenmark}
%%%%%%%%%%%%%%%--EndNotes--%%%%%%%%%%%%%%%%%%

\setlength{\paperheight}{297mm}%
\setlength{\paperwidth}{210mm}%

\setlength\topmargin{25mm}
\addtolength{\topmargin}{-1in}

\setlength\oddsidemargin{25truemm}
\addtolength{\oddsidemargin}{-1in}   

\setlength{\textwidth}{159mm}
\setlength{\textheight}{246mm}%{60\baselineskip}
\addtolength\textheight{.25pt}   

%%\setlength\footskip{28}
\setlength\maxdepth{0pt}

\setlength{\parskip}{12pt}

\usepackage{ragged2e}



\voffset-20mm     
                     

\endinput
%% end of bmc_article.cls
