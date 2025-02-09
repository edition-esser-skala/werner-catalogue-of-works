\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allabreve"
  d2.^\partBc d4
  e a, a'2~
  a4 g2 f4
  e d2 cis4
}

text = \lyricmode {
  Ky -- ri --
  e __ _ e --
  _ _
  lei -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
