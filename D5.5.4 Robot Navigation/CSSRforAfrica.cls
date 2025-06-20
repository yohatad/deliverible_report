\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{CSSRforAfrica}[2023/06/28 v1.0
^^J
^^JCSSRforAfrica Deliverable Style
^^J]

\LoadClass[a4paper,10pt]{article}

\RequirePackage{times}
\RequirePackage{a4wide}
\RequirePackage{array}

% for use with standard LaTeX:
\RequirePackage[dvips]{graphicx}

% for use with PdfLaTeX:
% \RequirePackage[pdftex]{graphicx}

\RequirePackage{color}
\RequirePackage{ulem}
\RequirePackage{calc}
\RequirePackage{ifthen}

%
% BEGIN: literal inclusion of fancyheadings package
%
\let\fancy@def\gdef
\def\lhead{\@ifnextchar[{\@xlhead}{\@ylhead}}
\def\@xlhead[#1]#2{\fancy@def\@elhead{#1}\fancy@def\@olhead{#2}}
\def\@ylhead#1{\fancy@def\@elhead{#1}\fancy@def\@olhead{#1}}

\def\chead{\@ifnextchar[{\@xchead}{\@ychead}}
\def\@xchead[#1]#2{\fancy@def\@echead{#1}\fancy@def\@ochead{#2}}
\def\@ychead#1{\fancy@def\@echead{#1}\fancy@def\@ochead{#1}}

\def\rhead{\@ifnextchar[{\@xrhead}{\@yrhead}}
\def\@xrhead[#1]#2{\fancy@def\@erhead{#1}\fancy@def\@orhead{#2}}
\def\@yrhead#1{\fancy@def\@erhead{#1}\fancy@def\@orhead{#1}}

\def\lfoot{\@ifnextchar[{\@xlfoot}{\@ylfoot}}
\def\@xlfoot[#1]#2{\fancy@def\@elfoot{#1}\fancy@def\@olfoot{#2}}
\def\@ylfoot#1{\fancy@def\@elfoot{#1}\fancy@def\@olfoot{#1}}

\def\cfoot{\@ifnextchar[{\@xcfoot}{\@ycfoot}}
\def\@xcfoot[#1]#2{\fancy@def\@ecfoot{#1}\fancy@def\@ocfoot{#2}}
\def\@ycfoot#1{\fancy@def\@ecfoot{#1}\fancy@def\@ocfoot{#1}}

\def\rfoot{\@ifnextchar[{\@xrfoot}{\@yrfoot}}
\def\@xrfoot[#1]#2{\fancy@def\@erfoot{#1}\fancy@def\@orfoot{#2}}
\def\@yrfoot#1{\fancy@def\@erfoot{#1}\fancy@def\@orfoot{#1}}

\newdimen\headrulewidth
\newdimen\footrulewidth
\newdimen\plainheadrulewidth
\newdimen\plainfootrulewidth
\newdimen\headwidth
\newdimen\footruleskip
\newif\if@fancyplain \@fancyplainfalse
\def\fancyplain#1#2{\if@fancyplain#1\else#2\fi}
\headwidth=-123456789sp %magic constant

\def\fancy@reset{\restorecr
 \def\baselinestretch{1}%
 \def\nouppercase##1{{\let\uppercase\relax\let\MakeUppercase\relax##1}}%
 \ifx\undefined\@newbaseline% NFSS not present; 2.09 or 2e
   \ifx\@normalsize\undefined \normalsize % for ucthesis.cls
   \else \@normalsize \fi
 \else% NFSS (2.09) present
  \@newbaseline%
 \fi}

\headrulewidth 0.4pt
\footrulewidth\z@
\plainheadrulewidth\z@
\plainfootrulewidth\z@
\footruleskip .3\normalbaselineskip

\lhead[\fancyplain{}{\sl\rightmark}]{\fancyplain{}{\sl\leftmark}}
%  i.e. empty on ``plain'' pages, \rightmark on even, \leftmark on odd pages
\chead{}
\rhead[\fancyplain{}{\sl\leftmark}]{\fancyplain{}{\sl\rightmark}}
%  i.e. empty on ``plain'' pages, \leftmark on even, \rightmark on odd pages
\lfoot{}
\cfoot{\rm\thepage} % page number
\rfoot{}

\def\@fancyhead#1#2#3#4#5{#1\hbox to\headwidth{\fancy@reset\vbox{\hbox
{\rlap{\parbox[b]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[b]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[b]{\headwidth}{\raggedleft#4\strut}}}\headrule}}#5}

\def\@fancyfoot#1#2#3#4#5{#1\hbox to\headwidth{\fancy@reset\vbox{\footrule
\hbox{\rlap{\parbox[t]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[t]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[t]{\headwidth}{\raggedleft#4\strut}}}}}#5}

\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\hrule\@height\headrulewidth\@width\headwidth \vskip-\headrulewidth}}

\def\footrule{{\if@fancyplain\let\footrulewidth\plainfootrulewidth\fi
\vskip-\footruleskip\vskip-\footrulewidth
\hrule\@width\headwidth\@height\footrulewidth\vskip\footruleskip}}

\def\ps@fancy{%
\@ifundefined{@chapapp}{\let\@chapapp\chaptername}{}%for amsbook
\@ifundefined{MakeUppercase}{\def\MakeUppercase{\uppercase}}{}
\@ifundefined{chapter}{\def\sectionmark##1{\markboth
{\MakeUppercase{\ifnum \c@secnumdepth>\z@
 \thesection\hskip 1em\relax \fi ##1}}{}}%
\def\subsectionmark##1{\markright {\ifnum \c@secnumdepth >\@ne
 \thesubsection\hskip 1em\relax \fi ##1}}}%
{\def\chaptermark##1{\markboth {\MakeUppercase{\ifnum \c@secnumdepth>\m@ne
 \@chapapp\ \thechapter. \ \fi ##1}}{}}
\def\sectionmark##1{\markright{\MakeUppercase{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}%
%\csname ps@headings\endcsname % use \ps@headings defaults if they exist
\ps@@fancy
\gdef\ps@fancy{\@fancyplainfalse\ps@@fancy}%
% Initialize \headwidth if the user didn't
\ifdim\headwidth<0sp
    \advance\headwidth123456789sp\advance\headwidth\textwidth\fi}
\def\ps@fancyplain{\ps@fancy \let\ps@plain\ps@plain@fancy}
\def\ps@plain@fancy{\@fancyplaintrue\ps@@fancy}
\def\ps@@fancy{%
\ps@empty % This is for amsbook/amsart, which do strange things with \topskip
\def\@mkboth{\protect\markboth}%
\def\@oddhead{\@fancyhead\@lodd\@olhead\@ochead\@orhead\@rodd}%
\def\@oddfoot{\@fancyfoot\@lodd\@olfoot\@ocfoot\@orfoot\@rodd}%
\def\@evenhead{\@fancyhead\@rodd\@elhead\@echead\@erhead\@lodd}%
\def\@evenfoot{\@fancyfoot\@rodd\@elfoot\@ecfoot\@erfoot\@lodd}%
}
\def\@lodd{\if@reversemargin\hss\else\relax\fi}
\def\@rodd{\if@reversemargin\relax\else\hss\fi}

\let\latex@makecol\@makecol
\def\@makecol{\let\topfloat\@toplist\let\botfloat\@botlist\latex@makecol}
\def\iftopfloat#1#2{\ifx\topfloat\empty #2\else #1\fi}
\def\ifbotfloat#1#2{\ifx\botfloat\empty #2\else #1\fi}
\def\iffloatpage#1#2{\if@fcolmade #1\else #2\fi}

\newcommand{\fancypagestyle}[2]{%
  \@namedef{ps@#1}{\let\fancy@def\def#2\relax\ps@fancy}}
%
% END: literal inclusion of package fancyheadings
%



\parindent 15pt %Changed from 0mm back to default DV 04/08/2014

\normalem

\definecolor{CognironBlue}{rgb}{0.16,0.09,0.60}
\definecolor{CognironOrange}{rgb}{0.97,0.71,0.02}
\definecolor{CognironGrey}{rgb}{0.6,0.6,0.6}
\definecolor{CognironRed}{rgb}{1.0,0.2,0.2}
\newcommand{\missing}[1]{\textcolor{CognironRed}{[#1 missing]}}

% Boolean to check if the version of the deliverable is 1.0
\newboolean{isVersionOne}
\setboolean{isVersionOne}{false} % Default to false

\newcommand{\@deliverable}{\missing{deliverable ID}}
\newcommand{\deliverable}[1]{\renewcommand{\@deliverable}{#1}}
\newcommand{\thedeliverable}{\@deliverable}

\renewcommand{\@title}{\missing{title}}
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\newcommand{\thetitle}{\@title}

\newcommand{\@revision}{\missing{revision}}
\newcommand{\revision}[1]{\renewcommand{\@revision}{#1}}
\newcommand{\therevision}{\@revision}

\newcommand{\@deliverabledate}{\missing{due date}}
\newcommand{\deliverabledate}[1]{\renewcommand{\@deliverabledate}{#1}}
\newcommand{\thedeliverabledate}{\@deliverabledate}

\newcommand{\@submissiondate}{\missing{submission date}}
\newcommand{\submissiondate}[1]{\renewcommand{\@submissiondate}{#1}}
\newcommand{\thesubmissiondate}{\@submissiondate}

\newcommand{\@revisiondate}{\missing{revision date}}
\newcommand{\revisiondate}[1]{\renewcommand{\@revisiondate}{#1}}
\newcommand{\therevisiondate}{\@revisiondate}


\newcommand{\@responsible}{\missing{responsible person}}
\newcommand{\responsible}[1]{\renewcommand{\@responsible}{#1}}
\newcommand{\theresponsible}{\@responsible}

\newcommand{\@disseminationlevel}{\missing{dissemination level}}
\newcommand{\disseminationlevel}[1]{\renewcommand{\@disseminationlevel}{#1}}
\newcommand{\thedisseminationlevel}{\@disseminationlevel}

\newsavebox{\@sbpartners}
\newsavebox{\contrib}
%\newcommand{\partner}[1]{\sbox{\@sbpartners}{\usebox{\@sbpartners}#1\\}}
%\newcommand{\leadpartner}[1]{\partner{\underline{#1}}}

\newcommand{\partner}[1]{}
\newcommand{\@leadpartner}{\missing{lead partner}}
\newcommand{\leadpartner}[1]{\renewcommand{\@leadpartner}{#1}}
\newcommand{\theleadpartner}{\@leadpartner}

% Assuming \therevision is defined earlier and you set its value
\newcommand{\checkVersion}{%
  \ifthenelse{\equal{\therevision}{1.0}}{%
    \setboolean{isVersionOne}{true}%
  }{%
    \setboolean{isVersionOne}{false}%
  }%
}

% Set the footer date to submission or revision date based on the version of the deliverable
\newcommand{\setfooterdate}{%
  \checkVersion
  \ifthenelse{\boolean{isVersionOne}}{%
    \lfoot{\sf\fontsize{8}{8}\selectfont Date: \thesubmissiondate \\ Version: No \therevision}%
  }{%
    \lfoot{\sf\fontsize{8}{8}\selectfont Date: \therevisiondate \\ Version: No \therevision}%
  }%
}

\renewcommand{\maketitle}{%
\thispagestyle{empty}
\setlength{\unitlength}{1mm}
%%\setlength{\textwidth}{17cm}

\begin{picture}(0,0)(29,-47)

\put(23,-43){\includegraphics[width=35mm]{CSSRforAfrica_logo_red.pdf}}
%%DV\put(23,-43){\includegraphics[width=35mm]{CSSRforAfrica_logo_black.pdf}}

\put(20,-40){\parbox{160mm}{\raggedleft \normalfont\sf\fontsize{16}{16}\selectfont Culturally Sensitive Social Robotics \\for Africa}}

%%DV \put(5,-80){\parbox{190mm}{\centering\sf\bfseries\fontsize{18}{18}\selectfont Project No. xxxxxx}}
%%DV\put(5,-95){\parbox{190mm}{\centering\sf\bfseries\fontsize{18}{18}\selectfont CSSRforAfrica}}
%%DV\put(5,-110){\parbox{190mm}{\centering\sf\bfseries\fontsize{18}{18}\selectfont  Culturally Sensitive Social Robotics \\for Africa}}
\put(23,-130){\sf\fontsize{12}{12}\selectfont 
\begin{tabular}{ll}
%%Grant Agreement Type:\hspace{0cm} & \\ %DV
%%Grant Agreement Number: &                     %DV
\end{tabular}}

\put(20,-130){\parbox{170mm}{\centering\sf\bfseries\fontsize{18}{18}\selectfont \thetitle}}
%\put(15,-170){\parbox{170mm}{\centering\sf\bfseries\fontsize{18}{18}\selectfont \thetitle}}

\put(10,-165){\parbox{190mm}
%\put(5,-185){\parbox{190mm}
{\centering\sf\fontsize{12}{12}\selectfont Due date: \sf\bfseries\fontsize{12}{12}\selectfont \thedeliverabledate\\
\normalfont\sf\fontsize{12}{12}\selectfont Submission Date: \sf\bfseries\fontsize{12}{12}\selectfont \thesubmissiondate\\
\normalfont\sf\fontsize{12}{12}\selectfont Revision Date: \sf\bfseries\fontsize{12}{12}\selectfont \therevisiondate}}


%DV\put(28,-185) {\sf\fontsize{12}{12}\selectfont Start date of project: \sf\bfseries\fontsize{12}{12}\selectfont 01/07/2023} 
\put(23,-225) {\sf\fontsize{12}{12}\selectfont Start date of project: \sf\bfseries\fontsize{12}{12}\selectfont 01/07/2023} 

%DV\put(28,-185){\parbox{160mm}{\raggedleft \normalfont\sf\fontsize{12}{12}\selectfont Duration: \sf\bfseries\fontsize{12}{12}\selectfont 36 months}}
\put(20,-225){\parbox{160mm}{\raggedleft \normalfont\sf\fontsize{12}{12}\selectfont Duration: \sf\bfseries\fontsize{12}{12}\selectfont 36 months}}

%DV\put(28,-195){\normalfont\sf\fontsize{12}{12}\selectfont Lead organisation for this deliverable: \sf\bfseries\fontsize{12}{12}\selectfont \theleadpartner }
\put(23,-235){\normalfont\sf\fontsize{12}{12}\selectfont Lead organisation for this deliverable: \sf\bfseries\fontsize{12}{12}\selectfont \theleadpartner }


%DV\put(28,-205){\sf\fontsize{11}{11}\selectfont Responsible Person: \sf\bfseries\fontsize{12}{12}\selectfont \theresponsible}
\put(23,-245){\sf\fontsize{11}{11}\selectfont Responsible Person: \sf\bfseries\fontsize{12}{12}\selectfont \theresponsible}

%DV\put(28,-215){\parbox{160mm}{\raggedleft\sf\fontsize{12}{12}\selectfont Revision: \sf\bfseries\fontsize{12}{12}\selectfont \therevision}}
\put(20,-245){\parbox{160mm}{\raggedleft\sf\fontsize{12}{12}\selectfont Revision: \sf\bfseries\fontsize{12}{12}\selectfont \therevision}}


%DV\put(28,-245){\parbox{160mm}{\sf\fontsize{12}{12}\selectfont 
\put(23,-270){\parbox{160mm}{\sf\fontsize{12}{12}\selectfont 
\begin{tabular}{|l|l|l|}
\hline
\multicolumn{3}{|c|}{
\sf\bfseries\fontsize{10}{10}\selectfont ~~~~~~~~~~~~~Project funded by the African Engineering and Technology Network (Afretec) ~~~~~~~~~~~~~ }\\
\multicolumn{3}{|c|}{
\sf\bfseries\fontsize{10}{10}\selectfont Inclusive Digital Transformation Research Grant Programme }\\
\hline
\multicolumn{3}{|c|}{\sf\bfseries\fontsize{10}{10}\selectfont Dissemination Level}\\
\hline
\sf\bfseries\fontsize{10}{10}\selectfont PU & \sf\fontsize{10}{10}\selectfont Public & \sf\bfseries\fontsize{10}{10}\selectfont PU \\
\hline
\sf\bfseries\fontsize{10}{10}\selectfont PP & \sf\fontsize{10}{10}\selectfont Restricted to other
programme participants (including Afretec Administration) & \sf\bfseries\fontsize{10}{10}\selectfont \\
\hline
\sf\bfseries\fontsize{10}{10}\selectfont RE & \sf\fontsize{10}{10}\selectfont Restricted to a group 
specified by the consortium (including  Afretec Administration) & \\
\hline
\sf\bfseries\fontsize{10}{10}\selectfont CO & \sf\fontsize{10}{10}\selectfont Confidential, only for
members of the consortium (including  Afretec Administration) &  \\
\hline
\end{tabular}
}}


\end{picture}
\pagenumbering{arabic}
\thispagestyle{empty}
\newpage
\settoheight{\headheight}{\parbox{80mm}{4.5cm}}
\pagestyle{fancy}
%%DV\setlength{\headrulewidth}{1pt}
%%DV\setlength{\footrulewidth}{1pt}
\setlength{\headrulewidth}{0.75pt}
\setlength{\footrulewidth}{0.75pt}
\lhead{\sf\fontsize{9}{11}\selectfont{\parbox{110mm}{\includegraphics[width=25mm]{CSSRforAfrica_logo_grey.pdf}
 }}}
\rhead{\sf\fontsize{14}{14}\selectfont\textcolor{CognironGrey}{\parbox{100mm}{\raggedleft \thetitle}}}
\cfoot{}
%\lfoot{\sf\fontsize{10}{10}\selectfont Date: \thesubmissiondate \\ Version: No \therevision}
\setfooterdate
\rfoot{\sf\fontsize{8}{8}\selectfont\textcolor{CognironGrey}{Page \thepage{}} }
\setlength{\headsep}{20mm}
}

% date = deliverable date


% \AtEndOfClass{\usepackage{cogdeliv}}
