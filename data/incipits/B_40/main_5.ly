\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  gis'16[^\partSs h] h[ e] cis[ a] gis fis gis[ fis] gis8 r4
  r8 fis h8.[\trill cis32 dis] e2
  e16[ cis] dis[ e] cis8.\trill cis16 h4 r
}

text = \lyricmode {
  Be -- ne -- di -- ctus, qui ve -- nit
  in no -- _
  mi -- ne Do -- mi -- ni,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
