\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  r8^\partSs c' f c16[ b] a8. b16 c4
  d8 d c8.[ b16] a8 c f4~
  f8 e16[ d] c8 b a d h8. h16
  c8
}

text = \lyricmode {
  Lau -- da -- te Do -- mi -- num,
  o -- mnes gen -- tes, lau -- da --
  te e -- um, o -- mnes po -- pu --
  li.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
