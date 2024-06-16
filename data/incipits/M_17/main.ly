\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "Largo"
  e'4^\partVi c'8( h) a( gis)
  a( e) e2~
  e8 a, e'( g!) f( e)
  f2.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
