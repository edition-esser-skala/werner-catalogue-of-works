\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  h'8^\partSs g a h c4. h8
  a4. gis8 a e'~ e16[ cis] a[ g]
  fis8 d d'4~ d16[ h a g] d'4
}

text = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
