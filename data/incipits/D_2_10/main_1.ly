\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  f2.^\partBs f4
  c'8 \tuplet 3/2 8 { a16[ g f] } e4 f r
  r2 r4 d8 g
}

text = \lyricmode {
  A -- ve
  ma -- ris stel -- la
  De -- i
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
