\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
  \mvTr gis'8^\partSs cis4 his8 cis cis r4
  r8 gis a16[ h] cis8 r fis, gis16[ a h8]~
  h a16 gis fis8. fis16 gis4 r
}

text = \lyricmode {
  Be -- _ ne -- di -- ctus,
  qui ve -- nit in no --
  mi -- ne Do -- mi -- ni,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
