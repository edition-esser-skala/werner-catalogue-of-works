\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
  r2^\partVi c'4 g
  e c c' g
  e c \clef soprano c'2^\partSc
  h2. h4
  c2 r
}

text = \lyricmode {
  \skips 8
  Ma --
  gni -- fi --
  cat,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
