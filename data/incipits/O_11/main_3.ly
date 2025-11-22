\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/2 \tempoMarkup "Tempo di bon gusto"
  a''8^\partVi a,16 a a8 a a4 a a16 h c h a[ h c d]
  e8 e,16 e e8 e e4 e e16 fis gis \hA fis e[ \hA fis \hA gis e]
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
