\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \tempoMarkup "Allegro moderato" \autoBeamOff
  c2^\partAs d
  e4 f4. f8 e4
  d2\trill c
}

text = \lyricmode {
  A -- ve
  Re -- gi -- na coe --
  lo -- rum,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
