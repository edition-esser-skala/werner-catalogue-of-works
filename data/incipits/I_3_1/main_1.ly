\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  r1 g'^\partSc
  h2 g c2. h4
  a2 d4 c h c h a
}

text = \lyricmode {
  Re --
  gi -- na coe -- _
  li, lae -- _ ta -- _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
