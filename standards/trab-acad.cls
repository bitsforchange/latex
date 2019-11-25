% Copyright 2019 ---- to do


% ------------------------------ Class Identification

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{config/trab-acad}[2019/11/20 Standard LaTeX class for ABNT NBR 14724: Trabalhos academico]

% Onde deve entrar isso?
% The configuration file, used for passing options. (the way to talk with .sty file) -- I don't know if it has to stay here.
% \InputIfFileExists{????}{%
%   \ClassInfo{ABNT-NBR-14724}{Using local configuration file}%
% }{%
%   \ClassInfo{ABNT-NBR-14724}{No local configuration file}%
% }


% ------------------------------ Preliminary declarations

% GLOBAL VARIABLES
\newcommand{\ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}

\newif\ifquali
\qualifalse

\newcounter{numberlesschapter}

\newcommand{\signature}[2]{%
    % \@ifstar%
    {\par\hspace{1cm}\parbox[t]{12.25cm}{%\singlespacing
        {\nopagebreak{#1\\#2}\par\vspace*{0.8cm}}}}%
    % {\begingroup\par\hspace{0.75\baselineskip}\parbox[t]{12.25cm}{\singlespacing{\vspace*{0.8cm}\rule{12.25cm}{1pt}\par\nopagebreak{#1\\#2}\par}}\endgroup}
}

% \newcommand{check}[2]
% {
%     \IfFileExists{#1.sty}
%         {\RequirePackage[#2]{#1}}
%         {\ClassError{trab-acad}{Missing package {#1}.}{This class requires the package \textit{#1} to work. Please make it available on the same directory of this class.}}
% }

\newcommand{\paginas}{\pageref{LastPage}}

\providecommand{\reference}{}
\newcommand{\headertext}[1]{%
    \renewcommand{\reference}{\par\begin{flushleft}#1\end{flushleft}\vspace*{\singlespacing}}
}

\headertext{\MakeUppercase{\authorfullname}, \authorabvr\ \emph{\@title}. \ano. \paginas\ f. \documento\ (\grau\ em \Pcurso) -- \IESunit, \IESunitname, \IESname, \printcidade, \ano.}

\newlength{\hanglength}
\newcommand{\printkeys}{
    \par\medskip\settowidth{\hanglength}{Keywords: }
    \noindent Keywords: \parbox[t]{\textwidth-\hanglength}{
        \raggedright \keyA\ \keyB\ \keyC\ \keyD\
    }
}

\newcommand{\printchaves}{
    \par\medskip\settowidth{\hanglength}{Palavras-chave: }
    \noindent Palavras-chave: \parbox[t]{\textwidth-\hanglength}{
        \raggedright \keyA\ \keyB\ \keyC\ \keyD\
    }
}

% \newcommand{\marcadagua}[4] {%
  \newcommand{\marcadagua}{marcadagua_uerj_cinza.png}%{#1}
  \newcommand{\imgscale}{1}%{#2}
  \newcommand{\imgposX}{0}%{#3}
  \newcommand{\imgposY}{0}%{#4}
% }

% Warnings and Erros.
\newcommand{\qualiwarn}{%
    \@latex@warning@no@line{Class 'trab-acad' warning: The "quali" option is enabled. Non-mandatory elements will not be shown. If you want to show them, remove the "quali" option or set the option to "final"}
}


% Fonts. (Isso já não está definido em book?)
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
% \renewcommand{\normalsize}{\fontsize{9}{10}\selectfont} -- to be defined -- preciso disso pq? não está definido na classe do livro que é 12?

% Load the book class (default document size and structure).
\LoadClass[a4paper,12pt,oneside,onecolumn,openany]{book}

% Required Packages.
\RequirePackage[american]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}                   % page layout
\RequirePackage[dvipsnames,svgnames]{xcolor}% for custom colors: must be before 'eso-pic'
\RequirePackage{eso-pic}                    % background image
\RequirePackage{ifthen}                     % for conditional codes
\RequirePackage{lastpage}                   % to get the number of pages
\RequirePackage{setspace}                   % to define paragraphs spaces
\RequirePackage{hyperref}                   % to create a sort of links
\RequirePackage{indentfirst}                % to indent the first paragraphs
\RequirePackage[explicit]{titlesec}         % to easily custom chapter and sections styles
\RequirePackage[inline]{enumitem}           % for enumerate, itemize lists and so on
\RequirePackage[acronym, symbols, index, nonumberlist, nopostdot, automake, style=indexgroup]{glossaries-extra}  % to affordable handle with glossary, acronyms and symbols
% \RequirePackage{makeidx}                    % for index -- to be reviewed its requirement
\RequirePackage[normalem]{ulem}             % for underlining
\RequirePackage{comment}                    % to comment block of texts
\RequirePackage{pdfpages}                   
\RequirePackage{float}
\RequirePackage[maxfloats=25]{morefloats}
\RequirePackage{caption}
\RequirePackage{subfig}
\RequirePackage{multirow}
\RequirePackage{amsmath,amssymb}            % math subjects
%\setlength{\mathindent}{\parindent}    % ainda preciso disso?
% \setlength{\mathindent}{0pt}    % ainda preciso disso?
\RequirePackage{graphicx}                   % to insert figures and graphs
\graphicspath{{img/}}
\RequirePackage{calc}               % Pacote que permite realizar operacoes matematicas no codigo TeX
\RequirePackage{pifont}
\RequirePackage{keyval}
\RequirePackage{array}
\setlength\extrarowheight{2pt}

% \RequirePackage[alf]{abntex2cite} % pacote para citacoes
% \RequirePackage[font=default,frame=no]{repUERJformat} % pacote para as normas da UERJ
% ---
% pacote auxiliar para elaboração de pseudocódigos
% este pacote pode ser retirado caso nao se planeje
% elaborar pseudocódigos
% ---
% \RequirePackage[dots=yes]{repUERJpseudocode}

% % table configuration?
% \setlength\arraycolsep{5\p@}
% \setlength\tabcolsep{6\p@}
% \setlength\arrayrulewidth{.4\p@}
% \setlength\doublerulesep{2\p@}
% \setlength\tabbingsep{\labelsep}
% \setlength\fboxsep{3\p@}
% \setlength\fboxrule{.4\p@}

% ------------------------------ Options

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
\DeclareOption{twocolumn}{\OptionNotUsed}

% The default action for any option is to pass it to the book class.
\DeclareOption{showframe}{\PassOptionsToPackage{\CurrentOption, pass}{geometry}}
\DeclareOption{brazil}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{spanish}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{italian}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{french}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{babel}}
% \DeclareOption{...}{\PassOptionsToPackage{\CurrentOption}{...}}
\DeclareOption{quali}{\qualitrue\qualiwarn}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% opção padrão: [ABNT] = ABNT-NBR-14724 = só informativo para o usuário, deixar em branco tem o mesmo resultado.

% Execute the options.
\ProcessOptions\relax

% ------------------------------ More declarations

%  PAGE STYLE
\geometry{top=3cm, bottom=2cm, left=3cm, right=2cm}
% \setlength{\textwidth}{17.5cm} -- to be defined % pq isso?
% \setlength{\textheight}{22cm} -- to be defined % pq isso?

\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0cm}
\setlength{\parsep}{0cm}
\setlength{\itemsep}{0cm}
\renewcommand{\singlespacing}{0.5\baselineskip} % espaço simples
\renewcommand{\doublespacing}{\baselineskip} % espaço duplo

% pre-textual pages
\renewcommand{\frontmatter}{%
    \pagestyle{empty}% isso já não esta definido por capítulo?
    % tipo de numeração da página?
}

% textual pages
\renewcommand{\mainmatter}{%
    \pagestyle{plain}% isso já não esta definido por capítulo?
    % tipo de numeração da página?
}

% pos-textual pages
\renewcommand{\backmatter}{%
    % tipo de numeração da página?
}

% LANGUAGE SETUP
% Although Portuguese (BR) is the document default language,
% English is used as default for the configuration.
% Nonetheless, the main document can be other than Portuguese (BR).

\addto\captionsamerican{
    \renewcommand\bibname{References} % The default is 'Bibliography'
    \renewcommand{\acronymname}{List of abbreviations and acronyms}
}
\newcommand{\advisorlang}{Advisor}
\newcommand{\coadvisorlang}{Co-advisor}
\newcommand{\folhaderostoname}{Title Page}
\newcommand{\errataname}{Erratum}
\newcommand{\folhadeaprovacaoname}{Approval Sheet}
\newcommand{\dedicatorianame}{Inscription}
\newcommand{\agradecimentosname}{Acknowledgements}
\newcommand{\epigrafename}{Epigraph}
\newcommand{\resumoname}{Resumo} % main language
\newcommand{\abstractname}{Abstract} % second language
\newcommand{\symbolsname}{List of Symbols}
\newcommand{\listinframename}{List of Frames} % pra quê isso?
\newcommand{\listgraphname}{List of Graphs} % pra quê isso?
\newcommand{\inframename}{Frame} % pra quê isso?
\newcommand{\graphname}{Graph} % pra quê isso?

% \newcommand{\glossarioname}{Gloss\'ario}
\newcommand{\annexname}{Annex}
% Índices?
\newcommand{\legendname}{Legend}
\newcommand{\sourcename}{Source} % acho q já existe por padrão
\newcommand{\notaname}{Note} % pra quê isso?

% Seções sem título: (mas as definições são necessárias para os 'bookmarks')
% - Folha de rosto (verso: Catálogo)
% - Folha de aprovação
% - Dedicatória
% - Epígrafe


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
    \renewcommand{\symbolsname}{Lista de símbolos}
    \renewcommand{\errataname}{Errata}
    \renewcommand{\dedicatorianame}{Dedicatória}
    \renewcommand{\agradecimentosname}{Agradecimentos}
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
    \renewcommand{\resumoname}{Resumo}
    \renewcommand{\advisorlang}{Orientador} % incluir gênero
    \renewcommand{\coadvisorlang}{Coorientador} % incluir gênero
}

% Spanish


% French


% Italian


% German



% NEW COMMANDS
\newcommand{\printacronym}{\printglossary[type=acronym]}
\renewcommand{\printsymbols}{\printglossary[type=symbols, title=\symbolsname]}

\providecommand{\plogo}{}
\newcommand{\logo}[1]{\ifnotempty{#1}{\renewcommand{\plogo}{#1}}}

\providecommand{\IESdata}{}
\newcommand{\IES}[4]{
    \newcommand{\IESname}{#1}
    \newcommand{\IEScenter}{#2}
    \newcommand{\IESunit}{#3}
    \newcommand{\IESunitname}{\ifnotempty{#4}{#4}} % não sei que merda é essa
    
    \renewcommand{\IESdata}{\textbf{\IESname}\par\IEScenter\par\IESunit{\IESunitname}}
}

\providecommand{\authorfullname}{}
\renewcommand{\author}[3]{
    \newcommand{\authorname}{#1}
    \newcommand{\authorsurname}{#2}
    \newcommand{\authorabvr}{#3}
    \renewcommand{\authorfullname}{#1 #2}
}

\providecommand{\printcidade}{}
\newcommand{\cidade}[1]{\renewcommand{\printcidade}{#1}}

\providecommand{\printdata}{}
\newcommand{\data}[3]{
    \newcommand{\dia}{\relax#1}
    \newcommand{\mes}{\relax#2}
    \newcommand{\ano}{\relax#3}
    \renewcommand{\printdata}{\ano}
}

\newcommand{\advisor}[2]{
    \newcommand{\advisoropt}{\advisorlang}
    \newcommand{\advisorname}{#1}
    \newcommand{\advisoraffiliation}{#2}
}

\newcommand{\coadvisor}[2]{
    \newcommand{\coadvisoropt}{\coadvisorlang}
    \newcommand{\coadvisorname}{#1}
    \newcommand{\coadvisoraffiliation}{#2}
}

% ---
% Tipo de trabalho
% ---
\newcommand{\titulacao}{}
\newcommand{\grau}{}
\newcommand{\documento}{}
\newcommand{\posgraduacao}{}
% ---
\newcommand{\curso}[1]{
    \newcommand{\Pcurso}{#1}
}
% ---
\newcommand{\presented}{apresentada}
% ---
\newcommand{\Pgrau}[1]{
    \ifthenelse{\equal{#1}{Mestre}}{
        \renewcommand{\titulacao}{Mestre}
        \renewcommand{\grau}{Mestrado}
        \renewcommand{\documento}{Dissertação}
        \renewcommand{\posgraduacao}{Programa de Pós-Graduação em \curso}
        }{\ifthenelse{\equal{#1}{Doutor}}{
            \renewcommand{\titulacao}{Doutor}
            \renewcommand{\grau}{Doutorado}
            \renewcommand{\documento}{Tese}
            \renewcommand{\posgraduacao}{Programa de Pós-Graduação em \curso}
            }{\ifthenelse{\equal{#1}{Bacharel}}{
                \renewcommand{\titulacao}{Graduado em \curso}
                \renewcommand{\grau}{Graduação}
                \renewcommand{\documento}{Trabalho de Conclusão de Curso}
                \renewcommand{\posgraduacao}{\IESunit{\IESunitname}}
                \renewcommand{\presented}{apresentado}
                }{\ifthenelse{\equal{#1}{Licenciado}}{
                    \renewcommand{\titulacao}{Graduado em \curso}
                    \renewcommand{\grau}{Graduação}
                    \renewcommand{\documento}{Trabalho de Conclusão de Curso}
                    \renewcommand{\posgraduacao}{\IESunit{\IESunitname}}
                    \renewcommand{\presented}{apresentado}
                }{
                    \renewcommand{\titulacao}{Graduado em \curso}
                    \renewcommand{\grau}{Graduação}
                    \renewcommand{\documento}{Trabalho de Conclusão de Curso}
                    \renewcommand{\posgraduacao}{\IESunit{\IESunitname}}
                    \renewcommand{\presented}{apresentado}
                }
            }
        }
    }
}

\newcommand{\chaveA}{}
\newcommand{\chaveB}{}
\newcommand{\chaveC}{}
\newcommand{\chaveD}{}
\newcommand{\palavraschaves}[4]{
    \renewcommand{\chaveA}{#1.}
    \renewcommand{\chaveB}{#2.}
    \renewcommand{\chaveC}{#3.}
    \ifnotempty{#4}{\renewcommand{\chaveD}{#4.}}
}

\newcommand{\keyA}{}
\newcommand{\keyB}{}
\newcommand{\keyC}{}
\newcommand{\keyD}{}
\newcommand{\keywords}[4]{
    \renewcommand{\keyA}{#1.}
    \renewcommand{\keyB}{#2.}
    \renewcommand{\keyC}{#3.}
    \ifnotempty{#4}{\renewcommand{\keyD}{#4.}}
}

% SPECIFIC FIELDS OF THE STANDARD

% ----- Pré-textual -----

% Capa
% \maketitle PARAMETERS (front cover)
\newlength{\img}
\setlength{\img}{2.2cm}
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    {\centering\large
    \begin{onehalfspace}
        {\ifthenelse{\equal{\plogo}{}}
            {\parbox[c]{\textwidth}{\centering{\large\IESdata\par}}}
            {\parbox[c]{\img}{\includegraphics[width=\img]{\plogo}}
            \parbox[c]{\textwidth-\img-2mm}{\centering{\large\IESdata\par}}}
        }
        \hfill
        {\hspace{\img}}
        \vfill\vfill
        \authorfullname\par
        \vfill\vfill
        {\bfseries\@title}\par
        \vfill\vfill\vfill\vfill\vfill
        \printcidade\\[0.3\baselineskip]
    \end{onehalfspace}
    \printdata
    \normalsize\cleardoublepage}
}

% Folha de rosto
\newcommand{\folhaderosto}{yyyyyyy}%\@ifstar{\folhaderostoB}{\folhaderostoA}}

\newcommand{\folhaderostoA}{
    \thispagestyle{empty}%
    {\centering
    \begin{onehalfspace}
        \AddToShipoutPicture*{
            \put(\imgposX,\imgposY){
                \includegraphics[scale=\imgscale]{\marcadagua}
            }
        }
        \authorfullname\par
        \vfill\vfill
        {\bfseries\@title}\par
        \vfill\vfill\vfill
        \vspace{.8cm}
        \hspace{.49\textwidth}
        \begin{minipage}{.5\textwidth}
            aaaaaaaa%\preambulo
        \end{minipage}%
        \vfill\vfill\vfill\vfill\vfill
        % \advisoropt: \advisor\par
        % \ifnotempty{\coadvisor}{{\coadvisoropt: \coadvisor}\par}
        \vfill\vfill\vfill
        \printcidade\\[0.1\baselineskip]
    \end{onehalfspace}
    \data
    \cleardoublepage
    }
}

\newcommand{\folhaderostoB}{
  \thispagestyle{empty}%
  {
    \centering
    \begin{onehalfspace}
      \AddToShipoutPicture*{
        \put(\imgposX,\imgposY){
          \includegraphics[scale=\imgscale]{\marcadagua}
        }
      } 
      \authorfullname\par
      \vfill\vfill\vfill
      {\bfseries\@title}\par
      \vfill\vfill\vfill\vfill\vfill
      \vspace{.8cm}
      \hspace{.49\textwidth}
      \begin{minipage}{.5\textwidth}
         \preambulo
       \end{minipage}%
       \vfill\vfill\vfill\vfill\vfill
      \begin{center}
        Autorizo a apresentação
        \vspace{1cm}
        \hrule
        \vspace{0.4cm}
        % \surpevisor: \orientador\par
      \end{center}
    %   \ifnotempty{\coorientador}{
    %      {\cosurpevisor: \coorientador}\par
    %   }
      \vfill\vfill\vfill
      \printcidade\\[0.1\baselineskip]
    \end{onehalfspace}
    \data
    \cleardoublepage
  }
}

% Errata
\ifquali
    \excludecomment{errata}
\else
    \newenvironment{errata}{\chapter*{\errataname}}{\vfill}
\fi

% Folha de aprovação
\newenvironment{folhadeaprovacao}{%
    \thispagestyle{empty}%
    \begin{onehalfspace}
        {
            \centering
            \authorfullname\par
            \vspace{1.0cm}
            {\bfseries\@title}\\
            \vspace{1.0cm}
        }
        \noindent\hspace{.49\textwidth}
        \begin{minipage}{.5\textwidth}
        gggggggg%   \preambulo
        \end{minipage}
        
        \vspace{1.3cm}
        \noindent Aprovada em \rule{1cm}{.1pt} de \rule{4cm}{.1pt} de \ano.\par
        \noindent Aprovada em \dia\ de \mes\ de \ano.\par
        \noindent Banca Examinadora:\\[-1.5\baselineskip]
        \signature{\advisorname\ (\advisoropt)}{\advisoraffiliation}
        \ifnotempty{\coadvisor}{tttt}%\signature{\coadvisorname (\coadvisoropt)}{\coadvisoraffiliation}}
    \end{onehalfspace}
}
{
    \vfill
    {\centering
    \printcidade\\[0.1\baselineskip]
    \printdata\par
    }
    \cleardoublepage
}

% Dedicatória(s)
\ifquali
    \excludecomment{dedicatoria}
\else
    \newenvironment{dedicatoria}{\chapter*{}\vfill\noindent}{}
\fi

% Agradecimento(s)
\ifquali
    \excludecomment{agradecimentos}
\else
    \newenvironment{agradecimentos}{\chapter*{\agradecimentosname}\vfill\noindent}{}
\fi

% Epígrafe
\ifquali
    \excludecomment{epigrafe}
\else
    \newenvironment{epigrafe}{\chapter*{}\vfill\noindent}{}
\fi

% Resumo na língua vernácula
\newenvironment{resumo}{\chapter*{\resumoname}\noindent\reference}{\printchaves\vfill}

% Resumo em língua estrangeira
\newenvironment{abstract}{\chapter*{\abstractname}\noindent\reference}{\printkeys\vfill}

% Lista de ilustrações
\ifquali
    \renewcommand\listoffigures{}
\else
    \renewcommand\listoffigures{\chapter*{\listfigurename}\@starttoc{lof}}
\fi

% Lista de tabelas
\ifquali
    \renewcommand\listoftables{}
\else
    \renewcommand\listoftables{\chapter*{\listtablename}\@starttoc{lot}}
\fi

% Lista de abreviaturas e siglas
% \ifquali
%     ...
% \else
%     ...
% \fi
% lista de abreviaturas e siglas -- \glossarypackage...

% Lista de símbolos
% \ifquali
%     ...
% \else
%     ...
% \fi
% lista de símbolos -- \glossarypackage...

% Sumário
% ????

% NÃO SEI PRA QUÊ ISSO!!
\newcommand\listofgraphs{\chapter*{\listgraphname}\@starttoc{lop}}

% NÃO SEI PRA QUÊ ISSO!!
\newcommand\listofinframes{\chapter*{\listinframename}\@starttoc{lom}}


% ----- Pós-textual -----

% Referências

% Glossário
% \ifquali
%     ...
% \else
%     ...
% \fi
% glossário -- \glossarypackage...

% Apêndice(s)
% \ifquali
%     ...
% \else
%     ...
% \fi
%   APÊNDICE A – Título do apêndice
% \appendices

% Anexo(s)
% \ifquali
%     ...
% \else
%     ...
% \fi
%   ANEXO A – Título do anexo
% \annexes

% Índice(s)
% \ifquali
%     ...
% \else
%     ...
% \fi
% \pacote adicional...










% ------------------------------ TEXTUAL
% Notas de rodapé: devem estar dentro das margens, separadas do texto por um espaço simples de entrelinhas e por filete de 3 cm, a partir da margem esquerda.


% ENVIRONMENTS



% CAPTION



% LEGEND -- sugestão de formatação (abnTex2)
\newcommand{\fonte}[2][\fontename]{%
  \M@gettitle{#2}%
  \memlegendinfo{#2}%
  \par
  \begingroup
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \ABNTEXfontereduzida
     %\configureseparator
     \captiondelim{\ABNTEXcaptionfontedelim}
     \@makecaption{\ABNTEXfontereduzida #1}{\ignorespaces\ABNTEXfontereduzida #2}\par
  \endgroup}

% SOURCE



% REDESIGN SECTIONING COMMANDS -- customizable fields
\setcounter{tocdepth}{5}    % until paragraph
\setcounter{secnumdepth}{5} % until paragraph

% CHAPTER
\titlespacing{\chapter}{0pt}{0pt}{2\doublespacing}
\titleformat
    {\chapter}                          % title command
    [hang]                              % shape
    {\normalfont\normalsize\bfseries}   % format
    {\thechapter\space}                 % label
    {0pt}                               % sep
    {\MakeUppercase{#1}}                % title name

\titleformat
    {name=\chapter,numberless}                  % title command
    [hang]                                      % shape
    {\normalfont\normalsize\bfseries\centering} % format
    {}                                          % label
    {0pt}                                       % sep
    {\MakeUppercase{#1}%
        \stepcounter{numberlesschapter}%
        \pdfbookmark[0]{#1}%
        {nlchap:\thenumberlesschapter}}         % title name

% SECTION
\titlespacing{\section}{0pt}{2\doublespacing}{2\doublespacing}
\titleformat
    {\section}                          % title command
    [hang]                              % shape
    {\normalfont\normalsize\bfseries}   % format
    {\thesection\space}                 % label
    {0pt}                               % sep
    {#1}                                % title name

\titleformat
    {name=\section,numberless}          % title command
    [hang]                              % shape
    {\normalfont\normalsize\bfseries}   % format
    {}                                  % label
    {0pt}                               % sep
    {#1}                                % title name

% SUBSECTION
\titlespacing{\subsection}{0pt}{2\doublespacing}{2\doublespacing}
\titleformat
    {\subsection}               % title command
    [hang]                      % shape
    {\normalfont\normalsize}    % format
    {\thesubsection\space}      % label
    {0pt}                       % sep
    {\underline{#1}}            % title name

\titleformat
    {name=\subsection,numberless}   % title command
    [hang]                          % shape
    {\normalfont\normalsize}        % format
    {}                              % label
    {0pt}                           % sep
    {\underline{#1}}                % title name

% SUBSUBSECTION
\titlespacing{\subsubsection}{0pt}{2\doublespacing}{2\doublespacing}
\titleformat
    {\subsubsection}                % title command
    [hang]                          % shape
    {\normalfont\normalsize\itshape}% format
    {\thesubsubsection\space}       % label
    {0pt}                           % sep
    {#1}                            % title name

\titleformat
    {name=\subsubsection,numberless}% title command
    [hang]                          % shape
    {\normalfont\normalsize\itshape}% format
    {}                              % label
    {0pt}                           % sep
    {#1}                            % title name

% PARAGRAPH = SUBSUBSUBSECTION          % a definir formatação-------------------
\titlespacing{\paragraph}{0pt}{2\doublespacing}{2\doublespacing}
\titleformat
    {\paragraph}                    % title command
    [hang]                          % shape
    {\normalfont\normalsize\itshape}% format
    {\theparagraph\space}           % label
    {0pt}                           % sep
    {#1}                            % title name

\titleformat
    {name=\paragraph,numberless}    % title command
    [hang]                          % shape
    {\normalfont\normalsize\itshape}% format
    {}                              % label
    {0pt}                           % sep
    {#1}                            % title name

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
