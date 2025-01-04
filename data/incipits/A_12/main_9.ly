\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "Vivace"
  d4^\partVii d' \fC a^\partVi a'
  gis16 a h \hA gis e8 g fis16 g a fis d4 \gotoBar "7"
  \clef tenor \autoBeamOff d,,4^\part Leviathan d' cis16[ d e cis] a4
  h16[ a h8] cis16[ h cis8] d[ a] fis[ d]
}

text = \lyricmode {
  \skips 15
  Mein Ver -- ſu -- chung
  iſt ver -- ge -- ben,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
