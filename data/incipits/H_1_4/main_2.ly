\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  r2^\partSs r4 e' d c8[ h]
  a2. h8 c gis4. a8
  a2 r4 h c d
}

text = \lyricmode {
  Lau -- da -- te
  pu -- e -- ri Do -- mi --
  num:  Lau -- da -- te
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
