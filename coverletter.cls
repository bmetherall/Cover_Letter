\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coverletter}[2024/07/24 Brady Metherall's cover letter template]

% Optional arguments from the document
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass[11pt,a4paper]{article}

% Necessary packages
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{tikz}

% Get info from main tex document
\newcommand*{\department}[1]{\def\@department{#1}}
\newcommand*{\university}[1]{\def\@university{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\logo}[1]{\def\@logo{#1}}
\newcommand*{\decoration}[1]{\def\@decoration{#1}}

% Define margins
\geometry{top=5cm, bottom=2.5cm, left=2.5cm, right=2.5cm}

\renewcommand{\baselinestretch}{1.4}

\newcommand{\opening}[1]{
	\noindent #1
	
	\vspace{0.5em}
}

\newcommand{\signoff}{
	\vspace{1em}
	\noindent Sincerely,
	
	\@author
}

% Header stuff
\renewcommand{\maketitle}{
	\begin{tikzpicture}[overlay, remember picture]
		\node[anchor=north east, xshift=-2.5cm, yshift=-6cm] at (current page.north east) {\includegraphics[height=3cm]{\@logo}};
	\end{tikzpicture}
	
	\begin{tikzpicture}[overlay, remember picture]
		\node[anchor=north west, xshift=2.5cm, yshift=-1.25cm] at (current page.north west) {\includegraphics[height=3cm]{\@decoration}};
	\end{tikzpicture}

	\begin{singlespace}
		\noindent \@author \\
		\@department \\
		\@university \\
		Email: \texttt{\@email} \\
		\@date
	\end{singlespace} 
	\vspace{1cm}
}

\endinput