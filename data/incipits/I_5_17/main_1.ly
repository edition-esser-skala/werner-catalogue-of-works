\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  c'1^\partSc h2
  c r4 c a4. a8
  g4 g a h c d
}

text = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- _ gi \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
