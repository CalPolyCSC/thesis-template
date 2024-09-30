% UCTHESIS DOCUMENT CLASS -- Release info is below.
%    for LaTeX version 2e - 11/3/94
%% Modified by John T. Whelan, June 1996, for UCSB use, following
%% Chris Martin's changes to ucthesis.sty
%% Modified by David D. Marshall, August 2024 for Cal Poly SLO use, based
%% on the (modified) ucthesis.cls file from the original project.
%%% ====================================================================
%%%  @LaTeX-class-file{
%%%     filename        = "cpthesis.cls",
%%%     version         = "1.0.1",
%%%     date            = "27 September 2024",
%%% portedby    = "David D. Marshall",
%%% address     = "Aerospace Engineering Department
%%%            California Polytechnic State University
%%%            1 Grand Ave.
%%%            San Luis Obispo, CA 93407
%%%            USA",
%%% telephone   = "(805) 756-6849",
%%% email       = "ddmarsha@calpoly.edu",
%%%     codetable       = "ISO/ASCII",
%%%     keywords        = "LaTeX, cpthesis",
%%%     supported       = "until August 31, 2025",
%%%     docstring       = "This file is the main file for the cpthesis
%%%                        class, which is intended to meet the requirements
%%%                        for Cal Poly SLO M.S. dissertations.
%%%            It is a heavily modified version of the ucthesis v3.0 class with
%%%            modifications tracked at the main repository for this project:
%%%            https://github.com/CalPolyCSC/thesis-template. This document
%%%            class removes as much content as possible that is not needed for
%%%            the Cal Poly thesis guidelines. It is not intended for general
%%%            use, as many stylistic decisions are made solely to satisfy the
%%%            format guidelines, currently available here:
%%%            https://grad.calpoly.edu/files/thesis/Masters-Thesis-Formatting-Guidelines.pdf.
%%%
%%%            Below is the modfication history for the ucthesis document class
%%%            that this class is based on. This is provided for historical and
%%%            authorship purposes as many/all of the remarks will not apply to
%%%            the current class file.
%%%
%%%            UCTHESIS.STY v2.7 is based on the standard
%%%            report.sty as modified by Mittelbach and Schopf in
%%%            Jan 1992.  The primary differences are (1) the use
%%%            of pseudo-double-spacing, except in certain special
%%%                        environments; and (2) the use of a 6 inch line
%%%                        with 4em paragraph indentation.  It is only
%%%            intended for single-sided printing.  Double-sided
%%%            printing may be possible, but you're on
%%%            your own.
%%%
%%%                        I know of no bugs in this implementation,
%%%                        but would be happy to hear of any problems
%%%                        that arise with it.
%%%
%%%            Version 2.x fixes a bug in the previous
%%%            version of 20 Jun 1988.  The bug was that
%%%            "draft" optional mode didn't work because of
%%%            problems in handling optional arguments.
%%%                        This file does not seem to work with earlier
%%%                        versions of LaTeX (pre-Jan 1992).
%%%
%%%            Version 2.3 includes a single-spaced
%%%            tabular* environment.
%%%
%%%            Version 2.4 sets \evensidemargin correctly
%%%            for two-sided style.  It also adds new
%%%            environments (\smalltabular and
%%%            \scriptsizetabular) which produce tables
%%%            with smaller fonts.  The obvious methods
%%%            of producing small-font tables don't work
%%%            in ucthesis style.
%%%
%%%            Version 2.5 adds support for the \maketitle
%%%            macro.
%%%
%%%            Version 2.6 adds support for complete and
%%%            correct front matter.  Some dead code was
%%%            removed, too.
%%%
%%%                        Version 2.7 adds front matter support for
%%%                        thesis committees of more than 3 people
%%%                        and for a labeled signature line on the
%%%                        abstract page.
%%%
%%%            Version 3.0 is a direct port of version 2.7
%%%            to LaTeX2e.  The major revisions in ucthesis.cls
%%%            are converting option processing to LaTeX2e
%%%            conventions.  The uct1x files have been revised
%%%            to use the new font selection commands.
%%%
%%%            Some users have had problems with the
%%%            margins ending up too small on one side.
%%%            This appears to be a DVI-to-PostScript
%%%            driver or printer-adjustment problem.
%%%            If you have such trouble, make small adjustments
%%%            to the \textwidth and \oddsidemargin
%%%            settings in your document preamble.
%%%
%%%            Another problem some people have had is
%%%            that you can't use \pagestyle{headings}
%%%            and \markboth if you use \part.  The solution
%%%            is to not use part since it is not listed as
%%%            an acceptable section of thesis."
%%%  }
%%% ====================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cpthesis}[2024/08/31 DDM's modification of the modified v3.0 University of California Thesis Class]

%    ****************************************
%    *               OPTIONS                *
%    ****************************************
%
% Option values are now declared first thing.  Defaults are set to
% 11 point, onesided, final (ie not draft) mode (BBF 10/31/94)
\newcommand\@ptsize{}
\newcommand\@draftmark{}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\renewcommand\@draftmark{1}}
\DeclareOption{final}{\renewcommand\@draftmark{0}}
\ExecuteOptions{11pt,oneside,final}


% CHOOSING THE TYPE SIZE:
%
%  The type size option is handled by reading a different file for each
%  size, as follows, to define font size-specific commands:
%       10pt : UCT10, 11pt : UCT11, 12pt : UCT12
%

%  Two-side or one-side printing.
%
% \@twosidefalse               %  Default is one-sided printing.
\def\ds@twoside{\@twosidetrue  %  Defines twoside option.
           \@mparswitchtrue}   %    Marginpars go on outside of page.

% This is a tricky solution to a tough bootstrapping problem.  The
% "draft" option requires the definition of the \ssp macro.  However,
% the \ssp macro requires that the uct1?.clo file has been loaded.  This
% loading is done by the \@options command which also invokes the
% \ds@draft macro.  This was a cyclic dependency in the previous
% version.  To break this dependency, I have made \ds@draft set a marker
% which is later tested to determine whether to actually do the draft
% mode actions.
%
% Ethan Munson (October 16, 1992)

% The \ProcessOptions command causes the execution of every option command
% FOO which is declared and for which the user typed the FOO option in his
% \documentclass.  For every undeclared option BAR there will be a warning
% message. (BBF 10/31/94)

\ProcessOptions

\input uct1\@ptsize.clo\relax

% For some environments we switch back to single-spacing, also
% provides \dsp in case you need double-spacing where single-spacing
% is otherwise used.
\def\ssp{\def\baselinestretch{1.0}\large\normalsize}
\def\dsp{\def\baselinestretch{1.37}\large\normalsize}

% \smallssp is used to produce tabular environments in the small font.
% This is required because single-spacing requires a change in font size.
% \scriptsizessp is a still smaller version of the same thing.

\def\smallssp{\def\baselinestretch{1.0}\large\small}
\def\scriptsizessp{\def\baselinestretch{1.0}\large\scriptsize}

%  draft option (this is where the draft option is actually implemented)
%
% \overfullrule = 0pt             % Default is don't mark overfull hboxes.
\ifnum \@draftmark = 1
\ssp                  % Single-spaces and
\overfullrule 5pt         % causes overfull hboxes to be marked.
\fi

%% Macros for labels that might need to be modified
%
% committee membership page title:
\def\committeemembershipname{Committee Membership}
%                            ~~~~~~~~~~~~~~~~~~~~
%
% table of contents name:
\def\contentsname{Table of Contents}
%                 ~~~~~~~~~~~~~~~~~
%
% list of figures name:
\def\listfigurename{List of Figures}
%                   ~~~~~~~~~~~~~~~
%
% list of tables name:
\def\listtablename{List of Tables}
%                  ~~~~~~~~~~~~~~
%
% list of symbols name:
\def\listsymbolsname{List of Symbols}
%                    ~~~~~~~~~~~~~~~
%
% list of algorithms name:
\def\listalgorithmsname{List of Algorithms}
%
%
% list of code listings name:
\def\listcodelistingsname{List of Code Listings}
%
%
% bibliography name:
\def\bibname{Bibliography}
%            ~~~~~~~~~~~~
%
% index name:
\def\indexname{Index}
%              ~~~~~
%
% figure environment:
\def\figurename{Figure}
%               ~~~~~~
%
% table environment:
\def\tablename{Table}
%              ~~~~~
%
% chapter name:
\def\chaptername{Chapter}
%                ~~~~~~~
%
% appendix name:
\def\appendixname{Appendix}
%                 ~~~~~~~~
%
% appendix toc entry name:
\def\appendixtocname{Appendix}
%                 ~~~~~~~~
%
% appendix toc entry name:
\def\appendicestocname{Appendices}
%                 ~~~~~~~~
%
% abstract environment:
\def\abstractname{Abstract}
%                 ~~~~~~~~
%
% keywords:
\def\keywordsname{Keywords}
%                 ~~~~~~~~
%
% acknowledge environment:
\def\acknowledgename{Acknowledgments}
%                    ~~~~~~~~~~~~~~~
%
% dedication environment:
\def\dedicationname{Dedication}
%                   ~~~~~~~~~~
%
% campus
\def\campus{San Luis Obispo}
%           ~~~~~~~~~~~~~~~
%
%    ****************************************
%    *             FRONT MATTER             *
%    ****************************************
%

% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.

% The month the degree will be officially conferred
\def\degreemonth#1{\gdef\@degreemonth{#1}}

% The year the degree will be officially conferred
\def\degreeyear#1{\gdef\@degreeyear{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The keywords associated with the thesis
\def\keywords#1{\gdef\@keywords{#1}}

% The name of your committee's chair
\def\chair#1{\gdef\@chair{#1}}

% The names of your other committe members, one per line
\def\othermemberA#1{\gdef\@othermemberA{#1}}
\def\othermemberB#1{\gdef\@othermemberB{#1}}
\def\othermemberC#1{\gdef\@othermemberC{#1}}
\def\othermemberD#1{\gdef\@othermemberD{#1}}
\def\othermemberE#1{\gdef\@othermemberE{#1}}
\def\othermemberF#1{\gdef\@othermemberF{#1}}
\def\othermemberG#1{\gdef\@othermemberG{#1}}
\def\othermemberH#1{\gdef\@othermemberH{#1}}
\def\othermemberI#1{\gdef\@othermemberI{#1}}

% The number of committee members, which affects both the
% number of lines and the amount of space between lines
% on the approval page.
\def\@numberofmembers{2}
\def\@approvalstretch{1.5}
\gdef\@approvalspread{1.1}
\def\numberofmembers#1{\gdef\@numberofmembers{#1}
\gdef\@approvalstretch{\ifcase\@numberofmembers \or 1.5 \or 1.5 \or 1.5 \or 1.3 \or 1.2 \or 1.0 \or 0.85 \or 0.7 \or 0.6 \or 0.5\fi}}

% The name of your degree's field (e.g. Psychology, Computer Science)
\def\field#1{\gdef\@field{#1}}

% \maketitle outputs the complete titlepage.  It requires all the
% above macros.

% Set the font that will be used in the front matter headings
\def\fmfont{\fontsize\@xiipt{12}\selectfont}
\def\fmsmallfont{\fontsize\@xiipt{12pt}\selectfont}


% TITLE PAGE - Cal Poly (Added by Mark Barry 2/07)
% Inverted pyramid title based on https://tex.stackexchange.com/a/19846
\newcommand\invpyramid[1]{%
        \vbox{%
                \hsize=\textwidth
                \parindent=0pt
                \leftskip=0pt plus.5fil
                \rightskip=0pt plus-0.5fil
                \parfillskip=0pt plus1fil
                \emergencystretch=1in
                \parshape6
                0.00in \textwidth
                0.1\textwidth 0.8\textwidth
                0.2\textwidth 0.7\textwidth
                0.3\textwidth 0.6\textwidth
                0.35\textwidth 0.55\textwidth
                0.4\textwidth 0.5\textwidth
                \strut
                #1%
        }%
}

\RequirePackage{hyphenat}

\def\maketitle{
{
% turns off page anchors to avoid "destination with the same identifier" warning from hyperref
\hypersetup{pageanchor=false}
    \let\footnotesize\small
    \let\footnoterule\relax
    \thispagestyle{empty}
    \setcounter{page}{1}

    \vfill\null
  \begin{center}
        \invpyramid{\MakeUppercase{\nohyphens{\@title}}}

        %\vfill\null
        \addvspace{1.4in}

    A Thesis \\
    presented to \\
    the Faculty of California Polytechnic State University, \\
    \campus

        \addvspace{1.4in}
        %\vfill\null


        In Partial Fulfillment \\
        of the Requirements for the Degree \\
        \@degree~in~\@field

        \addvspace{0.65in}

        by \\
        \@author \\
        \@degreemonth~\@degreeyear

\hypersetup{pageanchor=true}

\end{center}


\setcounter{footnote}{0}
\newpage
}}

% COMMITTEEMEMBERSHIPPAGE - Cal Poly (Added by Andrew Tsui 6/09)

\def\committeemembershippage{

\begin{center}
\MakeUppercase{\committeemembershipname}
\end{center}
\par
\vspace*{0.5in}

\begingroup
\newlength{\colwidth}
\setlength\colwidth{3.7in}
\renewcommand\arraystretch{\@approvalstretch}
\begin{tabular}{rp{\colwidth}}
TITLE:  &\@title     \par\\
AUTHOR: &\@author     \par\\
DATE SUBMITTED: &\@degreemonth~\@degreeyear  \par\\

\vspace*{0.5in} \\

COMMITTEE CHAIR:  &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@chair\end{flushleft}\end{minipage}  \\\\
\ifnum\@numberofmembers>1 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberA\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>2 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberB\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>3 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberC\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>4 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberD\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>5 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberE\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>6 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberF\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>7 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberG\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>8 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberH\end{flushleft}\end{minipage}     \\\\ \fi
\ifnum\@numberofmembers>9 COMMITTEE MEMBER: &\begin{minipage}[t]{\colwidth}\linespread{\@approvalspread}\selectfont{}\begin{flushleft}\@othermemberI\end{flushleft}\end{minipage}     \\\\ \fi

\end{tabular}

\endgroup
\newpage
}



% COPYRIGHTPAGE - Cal Poly (Added by Mark Barry 2/07)
%                          (Modified by Andrew Tsui 6/09: New digital submission format)
%

\def\copyrightpage{
%\setcounter{page}{2}
\fmfont
\vspace*{7in}
\begin{center}
\copyright~\@degreeyear\\
\@author\\
ALL RIGHTS RESERVED
\end{center}
\newpage
}


% ABSTRACT
%
% The ABSTRACT environment allows for multi-page abstracts which,
% in accordance with UC rules, is numbered separately from the rest
% of the rest of the dissertation in Arabic.  It requires definition
% of the \title, \author, \degree, \field, \campus, and \chair macros.

\def\abstract{
\begin{center}
{\fmfont
{\MakeUppercase{\abstractname}}\par
\@title\par
\@author\par
}
\end{center}}

\def\endabstract{
\par
\ifx\@keywords\undefined
\vfil\null
\else
\vspace*{\fill}
{\keywordsname}: \@keywords
\vspace{0.5in}
\fi
\newpage
}

% DEDICATION
%
% The dedication environment just makes sure the dedication gets its
% own page.

\newenvironment{dedication}{
\begin{center}
{\MakeUppercase{\dedicationname}}
\end{center}
}{\newpage}

% ACKNOWLEDGMENTS
%
% The acknowledgments environment.

\newenvironment{acknowledgments}{
\begin{center}
{\MakeUppercase{\acknowledgename}}
\end{center}
}{\newpage}


% FRONTMATTER environment
%
% The FRONTMATTER environment makes sure that page numbering is set
% correctly (roman, lower-case, starting at 2) for the front matter.
% It also resets page-numbering for
% the remainder of the dissertation (arabic, starting at 1).

\newif\if@resttwoside

\newenvironment{frontmatter}{%
\@resttwosidefalse
\if@twoside
    \@resttwosidetrue
    \@twosidefalse
    \fi
\setcounter{page}{2}
\renewcommand{\thepage}{\roman{page}}
\pagestyle{plain}}{\newpage
\if@resttwoside
    \@twosidetrue
    \fi
\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}
% Add CHAPTER into table of contents.
\addtocontents{toc}{%
   \noindent CHAPTER
}
\pagestyle{plain}}


%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% ENUMERATE
%  Enumeration is done with four counters: enumi, enumii, enumiii
%  and enumiv, where enumN controls the numbering of the Nth level
%  enumeration.  The label is generated by the commands \labelenumi
%  ... \labelenumiv.  The expansion of \p@enumN\theenumN defines the
%  output of a \ref command.
%
% 16 Mar 88 -- changed defs of \labelenum... to use \theenum...

\def\labelenumi{\theenumi.}
\def\theenumi{\arabic{enumi}}

\def\labelenumii{(\theenumii)}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\theenumiii.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\theenumiv.}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

% ITEMIZE
% Itemization is controlled by four commands: \labelitemi, \labelitemii,
% \labelitemiii, and \labelitemiv, which define the labels of the
% various itemization levels.

\def\labelitemi{$\m@th\bullet$}
\def\labelitemii{\bfseries --}
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}


% VERSE
%   The verse environment is defined by making clever use of the
%   list environment's parameters.  The user types \\ to end a line.
%   This is implemented by \let'in \\ equal \@centercr.
%
\def\verse{\par\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

% QUOTATION
%   Fills lines
%   Indents paragraph
%
\def\quotation{\par\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep \z@ plus\p@}\item[]}
\let\endquotation=\endlist

% QUOTE -- same as quotation except no paragraph indentation,
%
\def\quote{\par\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

% DESCRIPTION
%
%  To change the formatting of the label, you must redefine
%  \descriptionlabel.

\def\descriptionlabel#1{\hspace\labelsep \bfseries #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\newdimen\descriptionmargin
\descriptionmargin=3em


%    ****************************************
%    *         OTHER ENVIRONMENTS           *
%    ****************************************
%
%
% VERBATIM
%
% standard verbatim mode driver macro is modified to use
% single-spacing.  There appears to be a small problem with extra
% vertical space (1 or 2 points worth) after this environment.
% Probably, this results from returning to double-spacing before
% issuing a \parskip, but I'm not enough of TeX hacker to figure out
% the source of the problem. (EVM, 9/25/94)
% 94/11/03 BBF converted \tt to \ttfamily

\def\@verbatim{\trivlist\ssp \item[]\if@minipage\else\vskip\parskip\fi
\leftskip\@totalleftmargin\rightskip\z@
\parindent\z@\parfillskip\@flushglue\parskip\z@
%%RmS 91/08/26 Added \@@par to clear possible \parshape definition
%%from a surrounding list (the verbatim guru says)
\@@par
\@tempswafalse \def\par{\if@tempswa\hbox{}\fi\@tempswatrue\@@par
\penalty\interlinepenalty}%
\obeylines \ttfamily \catcode``=13 \@noligs \let\do\@makeother \dospecials}

% ARRAY AND TABULAR
%

\arraycolsep 5pt     % Half the space between columns in an array
                     % environment.
\tabcolsep 6pt       % Half the space between columns in a tabular
                     % environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular
                     % environment.

% We have to redefine array here in order to make it single-spaced.
% (Not sure if this is really necessary.)
\def\array{\let\@acol\@arrayacol \let\@classz\@arrayclassz
 \let\@classiv\@arrayclassiv \let\\\@arraycr\let\@halignto\@empty\@tabarray}

% TABBING
%
\tabbingsep \labelsep   % Space used by the \' command.
                        %  (See LaTeX manual.)

% We have to redefine tabular here in order to make it single-spaced.
\def\tabular{\par\ssp\let\@halignto\@empty\@tabular}
\expandafter \def\csname tabular*\endcsname #1%
{\par\ssp\def\@halignto{to#1}\@tabular}

% \smalltabular and \smalltabular* are alternative tabular styles
% in the \small font.  They are required because single-spacing implies a
% change of font to a particular size.
% EVM, 7/20/93
\def\smalltabular{\par\smallssp\let\@halignto\@empty\@tabular}
\def\endsmalltabular{\endtabular}
\expandafter \def\csname smalltabular*\endcsname #1%
{\par\smallssp\def\@halignto{to#1}\@tabular}
\expandafter \let \csname endsmalltabular*\endcsname = \endtabular

% \scriptsizetabular and \scriptsizetabular* are analogs of \smalltabular
\def\scriptsizetabular{\par\scriptsizessp\let\@halignto\@empty\@tabular}
\def\endscriptsizetabular{\endtabular}
\expandafter \def\csname scriptsizetabular*\endcsname #1%
{\par\scriptsizessp\def\@halignto{to#1}\@tabular}
\expandafter \let \csname endscriptsizetabular*\endcsname = \endtabular

% MINIPAGE
%  \@minipagerestore is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \skip\@mpfootins : plays same role for footnotes in a minipage as
%                    \skip\footins does for ordinary footnotes

\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
\fboxsep = 3pt    % Space left between box and text by \fbox and
                  % \framebox.
\fboxrule = .4pt  % Width of rules in box made by \fbox and \framebox.


%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
% DEFINE COUNTERS:
%
% \newcounter{NEWCTR}[OLDCTR] : Defines NEWCTR to be a counter, which is
%                               reset to zero when counter OLDCTR is
%                               stepped.
%                               Counter OLDCTR must already be defined.

% Must redefine @startsection so that we always get indentation.
\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
   \par \@tempskipa #4\relax
   \@afterindenttrue
   \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \relax\fi
   \if@nobreak \everypar{}\else
     \addpenalty{\@secpenalty}\addvspace{\@tempskipa}\fi \@ifstar
     {\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

%% Redefine @sect so that the abbreviated name is used only for %%
%% the page heading, and the full name goes into the table of   %%
%% contents -- JTW                                              %%

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \let\@svsec\@empty\else
     \refstepcounter{#1}%
     \let\@@protect\protect
     \def\protect{\noexpand\protect\noexpand}%
     \edef\@svsec{\@seccntformat{#1}}%
     \let\protect\@@protect\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}%
                    {\interlinepenalty \@M #8\par}%
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
%%                     #7}\else
                    #8}\else
        \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
                   \@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                           \protect\numberline{\csname the#1\endcsname}%
                                     \fi
%%                        #7}}\fi
                       #8}}\fi
     \@xsect{#5}}


\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

% For any counter CTR, \theCTR is a macro that defines the printed
% version of counter CTR.  It is defined in terms of the following
% macros:
%
%  \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
%  \roman{COUNTER}  : Its value printed as a lower-case roman numberal.
%  \Roman{COUNTER}  : Its value printed as an upper-case roman numberal.
%  \alph{COUNTER}   : Value of COUNTER printed as a lower-case letter:
%                         1 = a, 2 = b, etc.
%  \Alph{COUNTER}   : Value of COUNTER printed as an upper-case letter:
%                           1 = A, 2 = B, etc.
%

\def\thechapter       {\arabic{chapter}}
\def\thesection       {\thechapter.\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}

% replace the appendix macro with custom
\newif\if@appendix
\@appendixfalse
\renewcommand\appendix[1][2]{%
    \def\@chapapp{\appendixname}
    \addtocontents{toc}{\let\protect\l@chapter\protect\l@section}
    \renewcommand\thechapter{\Alph{chapter}}
    \setcounter{chapter}{0}
    \ifnum#1>1
        {\addtocontents{toc}{\noindent\MakeUppercase{\appendicestocname}}}
    \else
        {\addtocontents{toc}{\noindent\MakeUppercase{\appendixtocname}}}
    \fi
    % Indents Appendix in Table of Contents
    \addtocontents{toc}{\let\protect\l@chapter\protect\l@section}
    \@appendixtrue
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       CHAPTER                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% redefine chapter command to remove the extra vertical space between
% chapters in list of figures and list of tables
% see: https://tex.stackexchange.com/a/69327
%
% make toc entry uppercase
% see: https://tex.stackexchange.com/a/109948
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \if@appendix
                             \addcontentsline{toc}{chapter}%
                                    {\protect\numberline{\thechapter.}{#1}}
                         \else
                             \addcontentsline{toc}{chapter}%
                                    {\protect\numberline{\thechapter.}\uppercase{#1}}
                         \fi
                       \else
                         \addcontentsline{toc}{chapter}{\MakeUppercase{#1}}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{\MakeUppercase{#1}}%
                    \fi
                    \chaptermark{#1}%
                      \@makechapterhead{#2}%
                      \@afterheading
                    }



%    ****************************************
%    *         TABLE OF CONTENTS, ETC.      *
%    ****************************************
%
% A \subsection command writes a
%       \contentsline{subsection}{TITLE}{PAGE}
% command on the .toc file, where TITLE contains the contents of the
% entry and PAGE is the page number.  If subsections are being numbered,
% then TITLE will be of the form
%       \numberline{NUM}{HEADING}
% where NUM is the number produced by \thesubsection.  Other sectioning
% commands work similarly.
%
% A \caption command in a 'figure' environment writes
%    \contentsline{figure}{\numberline{NUM}{CAPTION}}{PAGE}
% on the .lof file, where NUM is the number produced by \thefigure and
% CAPTION is the figure caption.  It works similarly for a 'table'
% environment.
%
% The command \contentsline{NAME} expands to \l@NAME.  So, to specify
% the table of contents, we must define \l@chapter, \l@section,
% \l@subsection, ... ; to specify the list of figures, we must define
% \l@figure; and so on.  Most of these can be defined with the
% \@dottedtocline command, which works as follows.
%
% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE}
%    LEVEL    : An entry is produced only if LEVEL < or = value of
%               'tocdepth' counter.  Note, \chapter is level 0, \section
%               is level 1, etc.
%    INDENT   : The indentation from the outer left margin of the start
%               of the contents line.
%    NUMWIDTH : The width of a box in which the section number is to go,
%               if TITLE includes a \numberline command.
%
% This command uses the following three parameters, which are set
% with a \def (so em's can be used to make them depend upon the font).
%   \@pnumwidth : The width of a box in which the page number is put.
%   \@tocrmarg  : The right margin for multiple line entries.  One
%                 wants \@tocrmarg > or = \@pnumwidth
%   \@dotsep    : Separation between dots, in mu units.  Should be
%                 \def'd to a number like 2 or 1.7

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{1}


% TABLEOFCONTENTS

\def\tableofcontents{
  \chapter*{\MakeUppercase{\contentsname}
        \@mkboth{\MakeUppercase{\contentsname}}{\MakeUppercase{\contentsname}}}%
  {\ssp\@starttoc{toc} \addtocontents{toc}{\hbox to \linewidth{\hfill Page}}}}

\def\l@part#1#2{\addpenalty{-\@highpenalty}%
   \addvspace{2.25em plus\p@}% space above part line
   \begingroup
   \@tempdima 3em         % width of box holding part number, used by
     \parindent \z@ \rightskip \@pnumwidth             %% \numberline
     \parfillskip -\@pnumwidth
     {\large \bfseries          % set line in \large boldface
     \leavevmode          % TeX command to enter horizontal mode.
     #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
     \nobreak             % Never break after part entry
    \global\@nobreaktrue                        %% Added 24 May 89 as
    \everypar{\global\@nobreakfalse\everypar{}}%% suggested by
                                               %% Jerry Leichter
   \endgroup}

%% First line of l@chapter changed 24 May 89, as suggested
%% by Jerry Leichter.
%%
\def\l@chapter#1#2{\addpenalty{-\@highpenalty}%
%   \vskip 1.0em plus\p@   % space above chapter line
   \vskip 0.3em plus\p@   % space above chapter line
   \@tempdima 1.5em       % width of box holding chapter number
   \begingroup

     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
    %  \bfseries                  % Boldface.

     \leavevmode          % TeX command to enter horizontal mode.
      \advance\leftskip\@tempdima  %% added 5 Feb 88 to conform to
      \hskip -\leftskip            %% 25 Jan 88 change to \numberline
     #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
     \penalty\@highpenalty %% added 24 May 89, suggested by J. Leichter
   \endgroup}

\def\l@chapter{\@dottedtocline{1}{0em}{1.5em}}
\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}


% LIST OF FIGURES
%
% Single-space list of figures, add it to the table of contents.
\def\listoffigures{
  \chapter*{
    \MakeUppercase{\listfigurename}
    \@mkboth{\MakeUppercase{\listfigurename}}{\MakeUppercase{\listfigurename}}
  }
  \addcontentsline{toc}{chapter}{\uppercase{\listfigurename}}
  \ssp\@starttoc{lof}
}

\def\l@figure{\@dottedtocline{1}{1.5em}{3.2em}}


% LIST OF TABLES
%
\def\listoftables{
  \chapter*{
      \MakeUppercase{\listtablename}
      \@mkboth{\MakeUppercase{\listtablename}}{\MakeUppercase{\listtablename}}
  }
  \addcontentsline{toc}{chapter}{\uppercase{\listtablename}}
  \ssp\@starttoc{lot}
}


\let\l@table\l@figure



%    ****************************************
%    *             BIBLIOGRAPHY             *
%    ****************************************
%
% The thebibliography environment executes the following commands:
%
%  \def\newblock{\hskip .11em plus .33em minus .07em} --
%      Defines the `closed' format, where the blocks (major units of
%      information) of an entry run together.
%
%  \sloppy  -- Used because it's rather hard to do line breaks in
%      bibliographies,
%
%  \sfcode`\.=1000\relax --
%      Causes a `.' (period) not toproduce an end-of-sentence space.

%% RmS 91/10/27 [ .. ] replaced by \@biblabel{ .. }
%% RmS 91/11/13: Changed counter enumi to enumiv,
%%               as it says in the comment in latex.tex
%% RmS 92/01/14: Set \p@enumiv to {} and \theenumiv to \arabic{enumiv}
%%               to get correct references
\def\thebibliography#1{\chapter*{\MakeUppercase{\bibname}\@mkboth{%
\MakeUppercase{\bibname}}{\MakeUppercase{\bibname}}}
  \list{\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin20pt% change 20 pt according to your needs
    \advance\leftmargin\labelsep
    \setlength\itemindent{-20pt}% change using the inverse of the length used before
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em }%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m
    \raggedright}

%% 91/08/26 FMI & RmS: introduced warning instead of error

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}

 \def\@biblabel#1{[#1]\hfill}  % Produces the label for a \bibitem[...]
                                % command.

% \def\@cite#1{[#1]}            % Produces the output of the \cite
                                % command.



%    ****************************************
%    *              THE INDEX               *
%    ****************************************
%
% THE THEINDEX ENVIRONMENT
% Produces double column format, with each paragraph a separate entry.
% The user commands \item, \subitem and \subsubitem are used to
% produce the entries, and \indexspace adds an extra vertical space
% that's the right size to put above the first entry with a new letter
% of the alphabet.

\def\theindex{
\columnseprule \z@
\columnsep 35\p@\twocolumn[\@makeschapterhead{\MakeUppercase{\indexname}}]%
    \@mkboth{\MakeUppercase{\indexname}}{\MakeUppercase{\indexname}}%
    \thispagestyle{plain}\parindent\z@
    \parskip\z@ plus .3\p@\relax\let\item\@idxitem}

\def\@idxitem{\par\hangindent 40\p@}

\def\subitem{\par\hangindent 40\p@ \hspace*{20\p@}}

\def\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}

\def\endtheindex{clearpage}

\def\indexspace{\par \vskip 10\p@ plus5\p@ minus3\p@\relax}


%    ****************************************
%    *             FOOTNOTES                *
%    ****************************************
%
% \footnoterule is a macro to draw the rule separating the footnotes
% from the text.  It should take zero vertical space, so it needs a
% negative skip to compensate for any positive space taken by the rule.
% (See PLAIN.TEX.)

\def\footnoterule{\kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}                 % The \hrule has default height of .4pt.

% \newcounter{footnote}
\@addtoreset{footnote}{chapter}  % Numbers footnotes within chapters

%   \@makefntext{NOTE} :
%        Must produce the actual footnote, using \@thefnmark as the mark
%        of the footnote and NOTE as the text.  It is called when
%        effectively inside a \parbox of width \columnwidth (i.e., with
%        \hsize = \columnwidth).
%
%        The following macro indents all lines of the footnote by 10pt,
%        and indents the first line of a new paragraph by 1em.  To
%        change these dimensions, just substitute the desired value for
%        '10pt' [in both places] or '1em'.  The mark is flushright
%        against the footnote.
%          \long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize
%             \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
%             \parindent 1em\noindent
%             \hbox to \z@{\hss$\m@th^{\@thefnmark}$}#1}
%
%        A simpler macro is used, in which the footnote text is
%        set like an ordinary text paragraph, with no indentation except
%        on the first line of a paragraph, and the first line of the
%        footnote.  Thus, all the macro must do is set \parindent
%        to the appropriate value for succeeding paragraphs and put the
%        proper indentation before mark.

\long\def\@makefntext#1{\parindent 1em\noindent
            \hbox to 1.8em{\hss$\m@th^{\@thefnmark}$}#1}

% \@makefnmark : A macro to generate the footnote marker that goes
%    in the text.  Default used.
%


% Single-space footnotes.
\long\def\@footnotetext#1{\insert\footins{\ssp\reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
%
% Float placement parameters.  See LaTeX manual for their definition.
%
\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with
%  \normalsize.
% changed 25 Jun 86 to fix according to Howard Trickey:
% instead of \unhbox\@tempboxa\par we do #1: #2\par

% 15 Nov 93: further changes to support captions BEFORE the figure
% or table.  Changes suggested by Donald Arseneau, installed by Ethan
% Munson.  Detailed reasons are:
%   The \unhbox allows \vadjust material (\vspace) to get out;
%   the \vbox to\topskip{} is for captions at the top of top-floats;
%   the \ifdim is for captions above the figure or table;
%   the strut is for tables below the caption.

%% The following makecaption macro created by Ashish Singhal, 10/06/2000
%% Needs to use package tabularx
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{#1}.\hspace{6pt}#2}%
  \ifdim \wd\@tempboxa >\hsize
        {#1}. {#2}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%% ------------------------------------------

% To define a float of type TYPE (e.g., TYPE = figure), the document
% style must define the following.
%
%  \fps@TYPE   : The default placement specifier for floats of type
%                TYPE.
%
% \ftype@TYPE : The type number for floats of type TYPE.  Each TYPE
%                has associated a unique positive TYPE NUMBER, which
%                is a power of two.  E.g., figures might have type
%                number 1, tables type number 2, programs type number
%                4, etc.
%
% \ext@TYPE : The file extension indicating the file on which the
%                contents list for float type TYPE is stored.  For
%                example, \ext@figure = 'lof'.
%
%  \fnum@TYPE  : A macro to generate the figure number for a caption.
%                For example, \fnum@TYPE == Figure \thefigure.
%
%  The actual float-making environment commands--e.g., the commands
%  \figure and \endfigure--are defined in terms of the macros \@float
%  and \end@float, which are described below.
%
% \@float{TYPE}[PLACEMENT] : Macro to begin a float environment for a
%     single-column float of type TYPE with PLACEMENT as the placement
%     specifier.  The default value of PLACEMENT is defined by
%     \fps@TYPE.  The environment is ended by \end@float.  E.g.,
%     \figure == \@float{figure}, \endfigure == \end@float.


% FIGURE

\newcounter{figure}[chapter]
\def\thefigure{\thechapter.\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\figure{\@float{figure}}
\def\endfigure{\end@float}
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

% TABLE
%
\newcounter{table}[chapter]
\def\thetable{\thechapter.\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\table{\@float{table}}
\def\endtable{\end@float}
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}


%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%
% The page style 'foo' is defined by defining the command \ps@foo.  This
% command should make only local definitions.  There should be no stray
% spaces in the definition, since they could lead to mysterious extra
% spaces in the output.
%
% The \ps@... command defines the macros \@oddhead, \@oddfoot,
% \@evenhead, and \@evenfoot to define the running heads and
% feet---e.g., \@oddhead is the macro to produce the contents of the
% heading box for odd-numbered pages.  It is called inside an \hbox of
% width \textwidth.
%
% To make headings determined by the sectioning commands, the page style
% defines the commands \chaptermark, \sectionmark, ... , where
% \chaptermark{TEXT} is called by \chapter to set a mark, and so on.
% The \...mark commands and the \...head macros are defined with the
% help of the following macros.  (All the \...mark commands should be
% initialized to no-ops.)
%
% MARKING CONVENTIONS:
% LaTeX extends TeX's \mark facility by producing two kinds of marks
% a 'left' and a 'right' mark, using the following commands:
%     \markboth{LEFT}{RIGHT} : Adds both marks.
%     \markright{RIGHT}      : Adds a 'right' mark.
%     \leftmark  : Used in the \@oddhead, \@oddfoot, \@evenhead or
%                  \@evenfoot macro, gets the current 'left' mark.
%                  Works like TeX's \botmark command.
%     \rightmark : Used in the \@oddhead, \@oddfoot, \@evenhead or
%                  \@evenfoot macro, gets the current 'right' mark.
%                  Works like TeX's \firstmark command.
% The marking commands work reasonably well for right marks 'numbered
% within' left marks--e.g., the left mark is changed by a \chapter
% command and the right mark is changed by a \section command.  However,
% it does produce somewhat anomalous results if two \bothmark's occur on
% the same page.
%
%
% Commands like \tableofcontents that should set the marks in some
% page styles use a \@mkboth command, which is \let by the pagestyle
% command (\ps@...)  to \markboth for setting the heading or
% \@gobbletwo to do nothing.

\mark{{}{}}   % Initializes TeX's marks

% \ps@empty defined in LATEX.TEX

% Definition of 'headings' page style
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%
% 91/03/26 FMi: Added extra set of braces arround |\sl| in |\@oddhead|
% to support NFSS (|\sl| is a shape |\rm| a family). Also remove
% unnecessary |\hbox{}| commands.
%
% 94/11/3 BBF: Eliminated two letter font selection commands \rm and \sl
% in favor of \rmfamily and \slshape.
%

\if@twoside         % If two-sided printing.
\def\ps@headings{\let\@mkboth\markboth
 \def\@oddfoot{}\def\@evenfoot{}%       No feet.
 \def\@evenhead{\rmfamily \thepage\hfil \slshape \leftmark}%    Left heading.
 \def\@oddhead{{\slshape \rightmark}\hfil \rmfamily\thepage}% Right heading.
 \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
      \@chapapp\ \thechapter. \ \fi ##1}}{}}%
 \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
   \thesection. \ \fi ##1}}}}
\else               % If one-sided printing.
\def\ps@headings{\let\@mkboth\markboth
\def\@oddfoot{\hfil\rmfamily\thepage\hfil}\def\@evenfoot{\hfil\rmfamily\thepage\hfil}% Footer.
\def\@oddhead{}% No header
\def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
  \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi

% Definition of 'plain' page style.
%
\def\ps@plain{\let\@mkboth\markboth
\def\@oddfoot{\rm\hfil\thepage\hfil}
\def\@evenfoot{\rm\hfil\thepage\hfil}           % page numbers
                            % in feet
\def\@oddhead{}                     % heading (right)
\def\@evenhead{}}                   % heading (left)



%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

% EQUATION and EQNARRAY -- put here because it must follow \chapter
% definition
%
% \newcounter{equation}
%
\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation'
                                  % counter.

\def\theequation{\thechapter.\arabic{equation}}


%% ------------------------
%% I like section-based equation numbers -- JTW 1996  %% Changed to Chapter.EquationNumber format by Ashish 10/06/2000

%% \def\theequation{\thechapter.\arabic{equation}}
%% \@addtoreset{equation}{section}
%% ------------------------

% \jot = 3pt      % Extra space added between lines of an eqnarray
                  % environment

% The macro \@eqnnum defines how equation numbers are to appear in
% equations.
%
% \def\@eqnnum{(\theequation)}
%

\usepackage[
letterpaper,
nohead,
tmargin=1in,
bmargin=1in,
lmargin=1.5in,
rmargin=1in
]{geometry}

%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

\ps@headings                   % 'headings' page style
\pagenumbering{arabic}      % Arabic page numbers
\if@twoside\else\raggedbottom\fi % Ragged bottom unless twoside
                                 % option.

\setlength{\parskip}{1.em}
\setlength{\parindent}{0pt}

\usepackage{titlesec}

% Shrink the size of headers
\titleformat{\chapter}[display]
        {\normalfont\normalsize\centering}
        {\chaptertitlename\ \thechapter}
        {0pt}{\normalsize\uppercase}
\titlespacing*{\chapter}{0pt}{-20pt}{4.3ex plus .2ex}

\titleformat*{\section}{\normalsize\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}
\titleformat*{\paragraph}{\normalsize\bfseries}
\titleformat*{\subparagraph}{\normalsize\bfseries}


%% the document class does not define this standard item
% see https://tex.stackexchange.com/a/612744
\let\smallsize\relax
\let\@currsize\smallsize

%% Different font in captions (single-spaced, bold) ------------
%\newcommand{\captionfonts}{\small\bf\ssp}
%
%\newcommand{\mycaption}[2]{\caption[#1 --- #2]{#1 --- #2}}
%
%\makeatletter  % Allow the use of @ in command names
%\long\def\@makecaption#1#2{%
%  \vskip\abovecaptionskip
%  \sbox\@tempboxa{{\captionfonts #1: #2}}%
%  \ifdim \wd\@tempboxa >\hsize
%    {\captionfonts #1: #2\par}
%  \else
%    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip}
%\makeatother   % Cancel the effect of \makeatletter
% ---------------------------------------

% Added to avoid windows and orphans
\RequirePackage[all]{nowidow}

% Added to fix spacing between footnote entries
% Also makes table rows single spaced
\RequirePackage{setspace}
\newlength{\myfootnotesep}
\setlength{\myfootnotesep}{\baselineskip}
\addtolength{\myfootnotesep}{-\footnotesep}
\setlength{\footnotesep}{\myfootnotesep} % set spacing between footnotes

% Set the counter depths
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\endinput
