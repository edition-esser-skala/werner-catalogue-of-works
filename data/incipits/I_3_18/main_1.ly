\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    r8^\partVi a' cis e a e4 fis16 gis
    a8 e4 fis16 gis a8 \gotoBar "13" \clef bass \autoBeamOff a,,,8^\partBs cis e
    a e4 fis16[ gis] a8 e4 fis16[ gis]
}

text = \lyricmode {
  \skips 12
  Re -- gi -- na
  coe -- li lae -- ta -- re, "lae -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
