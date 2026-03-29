\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \tempoMarkup "Presto" \autoBeamOff
  e2^\partBc a,4 a'~
  a g c2
  h~ h8[ e,] a4~
  a g fis2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
