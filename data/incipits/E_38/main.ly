\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
  c'16[^\partSc d e d] e4. d16 d
  e8. e16 e4 e8 d
  e8. e16 e4 e8 d
}

text = \lyricmode {
  Glo -- _ ri -- a,
  glo -- ri -- a in al --
  tis -- si -- mis, in "al -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
