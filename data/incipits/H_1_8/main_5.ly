\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  r8^\partSs a' a a fis e16 d d'8 d
  h g r e' e cis d e
  fis e16[ d] \grace d8 cis8. cis16 d4 d8^\partSc d16 d
}

text = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, lau -- da -- te e -- um,
  o -- mnes po -- pu -- li. Glo -- ri -- a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
