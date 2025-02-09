\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "Adagio"
  \partial 4 e8^\partVi cis' cis4. d16 cis h8 a \gotoBar "8"
  \clef soprano \autoBeamOff r4^\partSc r e'8 d
  cis4 cis8 cis cis cis
  \tuplet 3/2 4 { cis[ e d] } d4
}

text = \lyricmode {
  \skips 7
  Ky -- ri --
  e, Ky -- ri -- e e --
  lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
