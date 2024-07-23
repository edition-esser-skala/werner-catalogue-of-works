\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key g \major \time 2/2 \tempoMarkup "Allabreve"
  \partial 4 g'8^\partFl a \tuplet 3/2 2 { h4 c h } h c
  d h r c
  d h r c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
