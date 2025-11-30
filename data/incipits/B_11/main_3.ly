\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  c'4^\partSc a r8 d c b
  a4 h c r
  r8 c d e f2
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- _ tem,
  fa -- cto -- rem "coe -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
