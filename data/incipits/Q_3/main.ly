\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "Affettuoso"
    \once \override Staff.TimeSignature.style = #'single-digit
  r8^\partVi e' a4. h16( gis)
  a8 e a4. h16( gis)
  a8 e fis a,( gis) e'
  \grace d cis4 r8 e dis a'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
