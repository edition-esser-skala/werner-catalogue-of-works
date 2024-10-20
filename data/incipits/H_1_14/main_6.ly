\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  b'4^\partSc c8. c16 d8 b d b
  f'4 f f4. f8
  f4 r r8 d d d
}

text = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma
  me -- a Do -- mi --
  num, et ex -- "ul -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
