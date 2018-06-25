\LoadClass[12pt]{article}
\ProvidesClass{tareas}

\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amsthm,amsfonts,amssymb}
% \RequirePackage{pstricks}
% \RequirePackage{pst-node}
\RequirePackage[margin=1.2in]{geometry}


\theoremstyle{plain}
\theoremstyle{definition}
\theoremstyle{remark}

\newtheorem{theorem}{Teorema}
\newtheorem{corollary}{Corolario}
\newtheorem{lemma}{Lema}
\newtheorem{proposition}{Proposici\'on}
\newtheorem{defn}{Definici\'on}
\newtheorem{Conjecture}{Conjectura}
\newtheorem{claim}{Claim}
\newtheorem{property}{Propiedad}
\newtheorem*{sketch}{Sketch}
\newtheorem{remark}{Observaci\'on}
\newtheorem{example}{Ejemplo}

\newcommand{\nombre}[1]{\gdef\@nombre{#1}}
\newcommand{\correo}[1]{\gdef\@correo{#1}}
\newcommand{\curso}[1]{\gdef\@curso{#1}}
\newcommand{\tareaNo}[1]{\gdef\@tareaNo{#1}}
\newcommand{\colab}[1]{\gdef\@colab{#1}}

\let\Oldmaketitle\maketitle
\renewcommand{\maketitle}
{
	\Oldmaketitle
	\thispagestyle{plain}
}

\newcounter{begin}
\setcounter{begin}{1}

\let\Oldsection=\section
\renewcommand*{\section}{
	\ifthenelse{\equal{\value{begin}}{1}}
	{
		\setcounter{begin}{0}
	}
	{
		\skipevenpage
	}
	\Oldsection
}

\fancypagestyle{plain}
{
	\fancyhead{}
	\fancyfoot{}
	\fancyfoot[LE,LO]{\@nombre}
	\fancyfoot[RE,RO] {\thepage}
	\renewcommand{\headrulewidth}{0pt}
}

\pagestyle{fancy}

\fancyhead{}
\fancyfoot{}
\fancyhead[RE,RO]{Tarea \#\@tareaNo}
\fancyhead[LE,LO]{\@curso}
\fancyfoot[RE,RO] {\thepage}
\fancyfoot[LE,LO]{\@nombre}
\renewcommand{\footrulewidth}{0.4 pt}

\newcounter{emptypages}
\setcounter{emptypages}{0}

\newcounter{sum}

\newcommand*{\skipevenpage}{
	\newpage
	\if@twoside
	\setcounter{sum}{\value{page}}
	\addtocounter{sum}{\value{emptypages}}
	\ifthenelse{\isodd{\value{sum}}}
	{
	}
	{
		\thispagestyle{empty}
		\hbox{}
		\newpage
		\addtocounter{page}{-1}
		\addtocounter{emptypages}{1}
	}
	{
	}
	\fi
}

\title{\@curso \ - Tarea \#\@tareaNo}
\author{\@nombre \ - \texttt{\@correo} \\ Colaborador(a): \@colab}
\date{\today}

\endinput