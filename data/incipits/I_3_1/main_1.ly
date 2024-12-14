\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 2/2 \tempoMarkup "Allabreve" \autoBeamOff
  c1^\partAc
  \clef soprano g'^\partSc
  h2 g
  c2.( h4)
  a2 d4( c)
}

text = \lyricmode {
  "Re -"
  Re --
  gi -- na
  coe --
  li, "lae -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
