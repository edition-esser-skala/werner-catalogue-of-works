\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  g'2^\partBc d4 d
  e4. e8 d4 g~
  g fis e4. fis8
  g4 r r2
}

text = \lyricmode {
  Lau -- da -- te
  Do -- mi -- num, o --
  mnes gen -- _
  tes,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
