\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 12/8 \tempoMarkup "Vivace" \autoBeamOff
  d'8^\partSc d d g d g d h d h g r
  r4 r8 a a a d a d a fis a
  fis d r r4 r8 a' a a fis16[ g a g fis e]
}

text = \lyricmode {
  Re -- gi -- na coe -- li, lae -- ta -- re, lae -- ta -- re,
  re -- gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- re, al -- le -- lu -- ia, __
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
