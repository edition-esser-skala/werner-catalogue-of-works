\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
  c'4^\partSc c r
  cis cis r
  d2.~
  d8 e d4 cis
}

text = \lyricmode {
  San -- ctus,
  san -- ctus,
  san --
  ctus, san \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
