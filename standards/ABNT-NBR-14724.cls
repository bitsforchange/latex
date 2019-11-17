% Copyright 2019 ---- to do


% ------------------------------ INITIAL SET UP

% This is a LaTeX2e document class.
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ABNT-NBR-14724}[2019/11/14 v0.1  Standard LaTeX class for ABNT NBR 14724]


% The configuration file, used for passing options.
%     Must load figures and specifications for each variation of the standard.
% \InputIfFileExists{????}{%
%   \ClassInfo{ABNT-NBR-14724}{Using local configuration file}%
% }{%
%   \ClassInfo{ABNT-NBR-14724}{No local configuration file}%
% }


% Fonts.
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


% Switch off some of the book options.
% \DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
% \DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{titlepage}{\OptionNotUsed}
% \DeclareOption{onecolumn}{\OptionNotUsed}

% The default action for any option is to pass it to the book class.
\DeclareOption{showframe}{\PassOptionsToPackage{\CurrentOption}{geometry}}
\DeclareOption{brazil}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{spanish}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{italian}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{french}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{babel}}
% \DeclareOption{...}{\PassOptionsToPackage{\CurrentOption}{...}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% Execute the options.
\ProcessOptions\relax
 
% Load the book class (doc size).
\LoadClass[a4paper,12pt,oneside,onecolumn,openany]{book}


% ------------------------------ REQUIRED PACKAGES

\RequirePackage{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc} % Determina a codificação utilizada (conversão automática dos acentos)

% The package url.sty takes care of breaking url's that are too long
% to fit in a two-column design
% but it might not be available on all installations.
% Therefore we need to check if the file url.sty can be found.
%
% Also, it uses a verbatim input mode so Chris does not use it for
% urls as he wants to control layout and use macros within it.  Also
% he usuually wants to hand-craft the line-breaks in such text. 
% 
\IfFileExists{url.sty}{%
  \RequirePackage{url}
  \newcommand\email{\begingroup \Url}}{%
  \newcommand*{\url}[1]{\texttt{##1}}
  \newcommand*{\email}[1]{\texttt{##1}}
  }
  
\RequirePackage[symbols]{glossaries-extra}

\RequirePackage{ifthen}
\RequirePackage[normalem]{ulem}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage[dvipsnames,svgnames]{xcolor}
\RequirePackage{pdfpages}
\RequirePackage{setspace}       % para os espaçamentos

\RequirePackage{makeidx}        % Cria o índice
\RequirePackage{hyperref}       % Controla a formação do índice
\RequirePackage{indentfirst}    % Indenta o primeiro paragrafo de
                            % cada seção.
\RequirePackage{graphicx}       % Inclusão de gráficos
\RequirePackage{subfig}
\RequirePackage{multirow}
\RequirePackage{amsmath,amssymb}  % pacotes matemáticos
% \RequirePackage[alf]{abntex2cite} % pacote para citacoes
% \RequirePackage[font=default,frame=no]{repUERJformat} % pacote para as normas da UERJ
% ---
% pacote auxiliar para elaboração de pseudocódigos
% este pacote pode ser retirado caso nao se planeje
% elaborar pseudocódigos
% ---
% \RequirePackage[dots=yes]{repUERJpseudocode}


\RequirePackage{enumitem}
\RequirePackage{calc}
\RequirePackage{pifont}
\RequirePackage{keyval}
\RequirePackage{lastpage}

% pacotes uteis para diagramacao da pagina
\RequirePackage{geometry}
\RequirePackage{eso-pic}
%\RequirePackage[noframe]{showframe}

% \RequirePackage{amsmath}
%\setlength{\mathindent}{\parindent}
% \setlength{\mathindent}{0pt}

\RequirePackage[maxfloats=25]{morefloats}
\RequirePackage{array}
\setlength\extrarowheight{2pt}

% % table configuration?
% \setlength\arraycolsep{5\p@}
% \setlength\tabcolsep{6\p@}
% \setlength\arrayrulewidth{.4\p@}
% \setlength\doublerulesep{2\p@}
% \setlength\tabbingsep{\labelsep}
% \setlength\fboxsep{3\p@}
% \setlength\fboxrule{.4\p@}

\RequirePackage[explicit]{titlesec} % para mudar o estilo dos capítulos, seções...


% ------------------------------ PAGE STYLE

% Margem das páginas
\geometry{top=3cm, bottom=2cm, left=3cm, right=2cm}

% Espaçamentos entre linhas e parágrafos.
% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.25cm}
% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{0cm}
% Controle do espaçamento entre parágrafos dentro de um item:
\setlength{\parsep}{0cm}
% Controle do espaçamento entre um item e outro:
\setlength{\itemsep}{0cm}
% Refaz o comando do setspace (Espaço simples).
\renewcommand{\singlespacing}{0.5\baselineskip}
% Espaço duplo
\renewcommand{\doublespacing}{\baselineskip}
% Dois espaços duplos
% 2\doublespacing


% \newcommand\@ptsize{}
% \newif\if@restonecol
% \newif\if@titlepage
% \@titlepagetrue
% \newif\if@openright

\setkeys{ESO}{colorgrid=true}
\gridSetup[mm]{1.266mm}{1.266}{5}{20}{1}


% ------------------------------ LANGUAGE SETUP
% English is the default
\addto\captionsamerican{
    % \renewcommand\bibname{References}
    \renewcommand{\acronymname}{List of abbreviations and acronyms}
    \renewcommand{\symbolname}{List of Symbols}
}
\newcommand{\inscriptionname}{Inscription}
\newcommand{\acknowledgementsname}{Acknowledgements}
\newcommand{\listinframename}{List of Frames}
\newcommand{\listgraphname}{List of Graphs}
\newcommand{\inframename}{Frame}
\newcommand{\graphname}{Graph}
\newcommand{\annexname}{Annex}
\newcommand{\abstractname}{Abstract}
\newcommand{\legendname}{Legend}
\newcommand{\sourcename}{Source}

% \newcommand{\glossarionome}{Gloss\'ario}
% \renewcommand*{\glossarysection}[2][]{\pretextualchapter{#2}}%

% Brazilian Portuguese
\addto\captionsbrazil{%
    \renewcommand{\bibname}{Referências}
    \renewcommand{\contentsname}{Sumário}
    \renewcommand{\indexname}{Índice}
    \renewcommand{\listfigurename}{Lista de figuras}
    \renewcommand{\listtablename}{Lista de tabelas}
    \renewcommand{\listinframename}{Lista de quadros}
    \renewcommand{\listgraphname}{Lista de gráficos}
    \renewcommand{\acronymname}{Lista de abreviaturas e siglas}
    \renewcommand{\symbolname}{Lista de símbolos}
    \renewcommand{\inscriptionname}{Dedicatória}
    \renewcommand{\acknowledgementsname}{Agradecimentos}
    \renewcommand{\figurename}{Figura}
    \renewcommand{\tablename}{Tabela}
    \renewcommand{\inframename}{Quadro}
    \renewcommand{\graphname}{Gráfico}
    \renewcommand{\legendname}{Legenda}
    \renewcommand{\sourcename}{Fonte}
    \renewcommand{\partname}{}
    \renewcommand{\chaptername}{Capítulo}
    \renewcommand{\appendixname}{Apêndice}
    \renewcommand{\annexname}{Anexo}
    \renewcommand{\abstractname}{Resumo}
}

% Spanish

% French

% Italian

% German


% Opcional da Norma, ver como incluir isso em inglês tb (acho q já consertei isso no meu modelo!)

\newcommand{\orientadornome}{Orientador}
\newcommand{\coorientadornome}{Coorientador}




% ------------------------------ \maketitle PARAMETERS



% ------------------------------ SECTIONING COMMANDS
\setcounter{secnumdepth}{3} % until subsubsection

% CHAPTER
\titlespacing{\chapter}{0pt}{0pt}{2\doublespacing}
\titleformat
    {\chapter} % title command
    [hang] % shape
    {\normalfont\normalsize\bfseries} % format
    {\thechapter\space} % label
    {0pt} % sep
    {\MakeUppercase{#1}} % title name

\titleformat
    {name=\chapter,numberless} % title command
    [hang] % shape
    {\normalfont\normalsize\bfseries\centering} % format
    {} % label
    {0pt} % sep
    {\MakeUppercase{#1}} % title name

% SECTION
\titlespacing{\section}{0pt}{2\doublespacing}{2\doublespacing}
\titleformat
    {\section} % title command
    [hang] % shape
    {\normalfont\normalsize\bfseries} % format
    {\thesection\space} % label
    {0pt} % sep
    {#1} % title name

\titleformat
    {name=\section,numberless} % title command
    [hang] % shape
    {\normalfont\normalsize\bfseries} % format
    {} % label
    {0pt} % sep
    {#1} % title name

% SUBSECTION
\titlespacing{\subsection}{0pt}{2\doublespacing}{2\doublespacing}
\titleformat
    {\subsection} % title command
    [hang] % shape
    {\normalfont\normalsize} % format
    {\thesubsection\space} % label
    {0pt} % sep
    {\underline{#1}} % title name

\titleformat
    {name=\subsection,numberless} % title command
    [hang] % shape
    {\normalfont\normalsize} % format
    {} % label
    {0pt} % sep
    {\underline{#1}} % title name

% SUBSUBSECTION
\titlespacing{\subsubsection}{0pt}{2\doublespacing}{2\doublespacing}
\titleformat
    {\subsubsection} % title command
    [hang] % shape
    {\normalfont\normalsize\itshape} % format
    {\thesubsubsection\space} % label
    {0pt} % sep
    {#1} % title name

\titleformat
    {name=\subsubsection,numberless} % title command
    [hang] % shape
    {\normalfont\normalsize\itshape} % format
    {} % label
    {0pt} % sep
    {#1} % title name

% ANNEX
\newcommand\annex{\par
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \renewcommand\appendixname{Annex}
    % \renewcommand\appendixpagename{Annexes}
    % \renewcommand{\appendixtocname}{Annexes}
    % \gdef\@chapapp{\annexname}
    % \gdef\thechapter{\@Roman\c@chapter}
    % \renewcommand{\theHchapter}{\annexname.\thechapter}
    % \addappheadtotoc
    }


% ------------------------------ PRE-TEXTUAL CHAPTER
% Alinhamento centralizado: na folha de rosto e na folha de aprovação, a natureza do trabalho, o objetivo, o nome da instituição a que é submetida e a área de concentração.

% Elementos sem título e sem indicativo numérico: folha de aprovação, dedicatória e epígrafe.

% Títulos sem indicativo numérico (errata, agradecimentos, lista de ilustrações, lista de abreviaturas e siglas, lista de símbolos, resumos, sumário, referências, glossário, apêndice(s), anexo(s) e índice(s)): devem ser centralizados.

\newenvironment{inscription}{\chapter*{\inscriptionname}\vfill\noindent}{}
\newenvironment{acknowledgements}{\chapter*{\acknowledgementsname}\vfill\noindent}{}
\newenvironment{epigraph}{\vfill\noindent}{}
\newenvironment{abstract}{\chapter*{\abstractname}\noindent\reference\vspace{\doublespacing}}{\printkeys\vfill}


% TOCs
\renewcommand\tableofcontents{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \cleardoublepage
    }

\renewcommand\listoffigures{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }

\renewcommand\listoftables{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }

\newcommand\listofinframes{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listinframename}%
    \@starttoc{lom}%
    \if@restonecol\twocolumn\fi
    }

\newcommand\listofgraphs{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listgraphname}%
    \@starttoc{lop}%
    \if@restonecol\twocolumn\fi
    }

% ------------------------------ PÓS-TEXTUAL


% BIBLIOGRAPHY


% INDEX


% ------------------------------ TEXTUAL
% Notas de rodapé: devem estar dentro das margens, separadas do texto por um espaço simples de entrelinhas e por filete de 3 cm, a partir da margem esquerda.


% ENVIRONMENTS



% CAPTION



% LEGEND



% SOURCE


