\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 12/8 \tempoMarkup "Allegro" \autoBeamOff
  f8^\partSs b d f es16[ d] c[ b] a8 f r r r d'
  c16[ b a b c d] c[ b a b c d] c[ b a b c d] c8 a b16[^\partSc c]
}

text = \lyricmode {
  Re -- gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- _ _ _ re, "Re -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
