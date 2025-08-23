\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "[no tempo]"
  c''2^\partVi a8( f)
  c4 b' a8( f)
  c2 a8( f)
  c4 b' a8( f)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
