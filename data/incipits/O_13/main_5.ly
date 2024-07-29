\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  e'4~^\partVi e16 d c h c4~
  c16 h a gis a4. f'8
  e16 d c h d c h a gis fis e d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
