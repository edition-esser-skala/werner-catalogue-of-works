\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \twofourtime \key d \major \time 2/4 \autoBeamOff \tempoMarkup "Allegr[ett]o [passato]"
  a2^\part "Schnepfendrekh"
  a4. h16[ cis]
  d[ e fis8] e[ d]
  cis[ h] a[ g]
  fis4 d'
}

text = \lyricmode {
  Ein
  Schwab mueß
  ſchwö -- ren
  wie be --
  kandt wann
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
