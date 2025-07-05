\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  r8^\partSc e'16[ d] e8 d c c16[ d] e4
  d r8 d d d d4
  e r8 c a16[ g] a4 d8
}

text = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, o -- mni -- po -- ten --
  tem, fa -- cto -- _ rem
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
