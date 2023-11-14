\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pczreport}[PCZ REPORT CLASS @2023]
\LoadClass[11pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[polish]{babel} % język polski
\RequirePackage[a4paper,left=2cm,right=2cm,top=2.5cm,bottom=2.5cm,includeheadfoot]{geometry} % geometria dokumentu
\RequirePackage{graphicx} % ilustracje
\RequirePackage{secdot} % kropki po numerach sekcji
\RequirePackage{indentfirst} % akapity
\RequirePackage[pdfusetitle]{hyperref} % odnośniki + metadane pdf

\linespread{1.3} % interlinia

\newif\ifcourse
\newif\ifsupervisor
\newif\ifspeciality
\newif\iflogo

\logotrue % domyślnie wyświetlaj logo
\DeclareOption{nologo}{\logofalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% dodatkowe komendy z metadanymi
\newcommand*{\course}[1]{\gdef\@course{#1} \coursetrue} % kurs
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1} \supervisortrue} % prowadzący
\newcommand*{\semester}[1]{\gdef\@semester{#1}} % semestr
\newcommand*{\speciality}[1]{\gdef\@speciality{#1} \specialitytrue} % specjalizacja
\newcommand*{\indexnumber}[1]{\gdef\@indexnumber{#1}} % album aka index
\newcommand*{\fieldofstudy}[1]{\gdef\@fieldofstudy{#1}} % kierunek
\newcommand{\whichlogo}[1]{%
  \ifcase\pdfstrcmp{#1}{wimii}
    \def\logoname{pcz_wimii.png}%
  \else\ifnum\pdfstrcmp{#1}{wb}=0
    \def\logoname{pcz_wb.png}%
  \else\ifnum\pdfstrcmp{#1}{we}=0
    \def\logoname{pcz_we.png}%
  \else\ifnum\pdfstrcmp{#1}{wip}=0
    \def\logoname{pcz_wip.png}%
  \else\ifnum\pdfstrcmp{#1}{wis}=0
    \def\logoname{pcz_wis.png}%
  \else\ifnum\pdfstrcmp{#1}{wz}=0
    \def\logoname{pcz_wz.png}%
  \else
    \def\logoname{unknown_logo.png}%
  \fi\fi\fi\fi\fi\fi
} % logo wydział
    
% strona tytułowa
\renewcommand*{\maketitle}{
    \begin{titlepage}
        \centering
        \vspace*{0cm}

        \iflogo
        \begin{minipage}[t]{0.5\textwidth}
            \vspace{0pt}
            \includegraphics[height=2cm]{pcz_logo.png}
        \end{minipage}%
        \hfill
        \begin{minipage}[t]{0.5\textwidth}
            \vspace{0pt}
            \includegraphics[height=2cm]{\logoname}
        \end{minipage}
        \fi

        \vfill
            {\huge\textbf\@title}
            \\
            \vspace{0.8cm}
        \ifcourse
            {\Large\textbf{\@course}}
            \ifsupervisor
                \\
                \vspace{0.8cm}
                {\normalsize Prowadzący: \@supervisor}
            \fi
        \fi

        \vfill

        \begin{flushright}
            \textbf{Imię i nazwisko:} \@author\\
            \textbf{Numer albumu:} \@indexnumber\\
            \textbf{Kierunek:} \@fieldofstudy, \ifspeciality\@speciality, \fi semestr \@semester
        \end{flushright}
    \end{titlepage}

    \setcounter{page}{2}
}