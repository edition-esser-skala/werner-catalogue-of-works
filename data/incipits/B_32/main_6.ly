\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  e'8[^\partSc g16 f] e8 d c16[ h] c8 r h
  c16[ h] c8 r g! a16[ g] a8 r a
  d c h[ c] h4 r
}

text = \lyricmode {
  A -- _ gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
