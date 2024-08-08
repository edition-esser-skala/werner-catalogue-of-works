\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/1 \autoBeamOff \tempoMarkup "Moderato"
    \set Staff.timeSignatureFraction = 2/2
  r2^\partSc c'2. h4 a2~
  a gis a a
  a a4 a a2 h
}

text = \lyricmode {
  A -- gnus De --
  _ i, qui
  tol -- lis pec -- ca -- ta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
