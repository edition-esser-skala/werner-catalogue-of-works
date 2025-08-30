\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/2 \tempoMarkup "Andante" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  r1^\partTc g~
  g2 fis gis a~
  a4 d, g1 fis2
  g1
}

text = \lyricmode {
  A --
  gnus De -- _
  _ _ _
  i,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
