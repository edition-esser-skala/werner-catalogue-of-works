\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  c'4^\partSc c e e
  g g e8 d e4
  d r r8 h h h
}

text = \lyricmode {
  San -- ctus, san -- ctus,
  san -- ctus, san -- ctus, san --
  ctus Do -- mi -- nus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
