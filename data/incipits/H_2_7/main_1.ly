\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/2 \tempoMarkup "Tardissime"
    \set Staff.timeSignatureFraction = 2/2
  d'1^\partSc d
  c1. d2
  d1 es
  d\breve
  e
}

text = \lyricmode {
  Mi -- se --
  re -- re
  me -- i,
  De --
  us,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
