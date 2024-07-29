\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 2/4 \tempoMarkup "[no tempo]"
  \partial 4 a'^\partUnk a, a'
  a, a'8 g16 fis
  e8[ d cis h]
  cis a e''4
  a, e'
  e, e'8 dis16 cis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
