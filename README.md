# PCZ-LATEX
## Klasa LaTeX pozwalająca studentom Politechniki Częstochowskiej w prosty sposób stworzyć sprawozdanie z laboratorium

### Jak użyć? [Przykładowe sprawozdanie](https://github.com/xabix99/pcz-latex/blob/master/template/example.pdf)

```
%%% IMPORTOWANIE KLASY %%%

\documentclass{pczreport} 

%%% DEFINICJE DLA PIERWSZEJ STRONY %%%

\title{Sprawozdanie 00}
\course{Przykładowy przedmiot}
\supervisor{dr inż. Jan Kowalski}
\author{Jan Kowalski}
\semester{3}
\fieldofstudy{Przykładowy Kierunek}
\whichlogo{wimii} %%% LOGA DO WYBRANIA: wb,we,wimii,wip,wis,wz
\indexnumber{123456}

\begin{document}
    \maketitle %%% PIERWSZA STRONA Z DEFINICJAMI

    \section{Testowa sekcja}
    Testowy paragraf
\end{document}
```

