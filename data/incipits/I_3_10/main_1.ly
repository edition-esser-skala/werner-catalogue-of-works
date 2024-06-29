\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  r8^\partSs a' cis16[ d] e8 a,16[ gis] a8 r4
  r2 r8 a cis16[ d] e8
  a,16[ gis] a8 r a d16[\trill cis] h[\trill a] gis[\trill fis] e[ d']
}

text = \lyricmode {
  Re -- gi -- na coe -- li,
  Re -- gi -- na
  coe -- li, lae -- ta -- re, al -- "le -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
