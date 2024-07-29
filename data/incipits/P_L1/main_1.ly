\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "[no tempo]"
  d'8[^\partUnk d,] \bar "|" d[ d d d] d16 a' h cis
  d,8 d d d d16 e' fis gis a8 a,
  a a a a a16 e' fis gis a8 a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
