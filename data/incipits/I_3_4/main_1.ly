\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/2 \tempoMarkup "Andante"
  c4^\partOrg c'8 h c4 c8 h c4 g \gotoBar "7"
  \clef tenor \autoBeamOff g2^\partTs g g
  c c c
  d d2. c8[ d]
}

text = \lyricmode {
  \skips 8
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, "lae -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
