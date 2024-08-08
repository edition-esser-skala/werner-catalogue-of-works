\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c'2.^\partSc h4 a2
  g r4 g a8[ g] a4
  h c2 h4 c c
}

text = \lyricmode {
  Be -- ne -- di --
  ctus, qui ve -- _
  nit, ve -- _ nit, "ve -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
