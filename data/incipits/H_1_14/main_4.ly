\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  d2^\partBc f4. e8
  d4 d8 c \clef soprano r b''^\partSc d e
  f8.[ e16] d8[ c] b4.\trill b8
}

text = \lyricmode {
  Lau -- da -- te
  pu -- e -- ri Lau -- da -- te
  no -- men Do -- "mi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
