\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  a4^\partAs d e
  f2 e4
  d e fis
  g2 a4
}

text = \lyricmode {
  Pa -- trem o --
  mni -- po --
  ten -- tem, fa --
  cto -- rem
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
