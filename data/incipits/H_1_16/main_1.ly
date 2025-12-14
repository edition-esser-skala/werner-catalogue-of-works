\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  r4 g'8[^\partSc h] c e d d
  c8.[\trill h32 c] d8.[\trill c32 d] e8.[\trill d32 e] f8 f
  d d e4 d8 d^\partSs d e
}

text = \lyricmode {
  Se -- de a dex -- tris
  me -- _ _ is, a
  dex -- tris me -- is, Vir -- gam "vir -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
