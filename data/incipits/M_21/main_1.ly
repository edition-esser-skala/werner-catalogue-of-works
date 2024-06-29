\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \dorian \time 3/4 \tempoMarkup "Largo"
  d'4^\partVi f cis
  d \grace { c16[ b] } a4 b
  cis, d8( e) f( gis)
  a4 h! cis8.(\trill h32 cis)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
