\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 12/8 \tempoMarkup "Allegretto"
  \partial 8 e8^\partVi a e cis' a4 e8 cis' a e' cis4 \gotoBar "5"
    \clef bass \autoBeamOff e,,8^\part "Barthlme"
  a e cis' a e a e cis e a,4 e'8
}

text = \lyricmode {
  \skips 10
  Äß
  iß hiez beym Bau -- ren faſt gar koä Re -- ſpect wann
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
