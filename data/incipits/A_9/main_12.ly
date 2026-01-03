\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \twotwotime \key d \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  \partial 4 a4^\part "Judas" d2 a
  fis d
  a' r
}

text = \lyricmode {
  Ver -- ma -- le --
  dey -- ter
  Geitz!
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
