\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]" \autoBeamOff
  c2^\partAs e g
  c c h
  c2. h8[ a] g[ a g f]
}

text = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
