\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  r2^\partSs d'4. fis8
  fis[ e] d cis d16[ cis] d8 r a
  cis4 cis8 cis d16[ cis] d8 r d
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit, qui ve -- nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
