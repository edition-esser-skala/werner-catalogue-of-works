\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'2^\partBs cis8[ h] a[ g]
  fis e d cis h4. h8
  a4 g'8 fis e e e d
}

text = \lyricmode {
  Be -- a -- tus
  vir qui ti -- met Do -- mi --
  num: In man -- da -- tis e -- ius
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
