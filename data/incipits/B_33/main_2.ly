\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  cis'8.^\partSc cis16 cis4 r2
  cis8. cis16 cis4 h8 h e e
  cis cis h e16 e cis8 e a cis,
}

text = \lyricmode {
  Glo -- ri -- a,
  glo -- ri -- a in ex -- cel -- sis
  De -- o, glo -- ri -- a in ex -- cel -- sis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
