\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
  d'4.^\partSc d8 d h16[ c] d8 a
  h h r4 r8 d4 a8
  h h h g d' d dis8. dis16
}

text = \lyricmode {
  O Ma -- ri -- a sem -- per
  pi -- a, sem -- per
  pi -- a nos af -- fli -- ctos con -- "tur -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
