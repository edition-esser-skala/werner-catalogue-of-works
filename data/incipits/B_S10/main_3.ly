\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c'4.^\partSc c8 c c c c
  h4. h8 h2
  e8 e e e d4 d
}

text = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
