\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  e'2^\partSc e
  e r
  e e
  e r4 r8 h
  cis[ h16 cis] d8[ cis] h4 r8 h
}

text = \lyricmode {
  Ky -- ri --
  e,
  Ky -- ri --
  e e --
  lei -- _ son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
