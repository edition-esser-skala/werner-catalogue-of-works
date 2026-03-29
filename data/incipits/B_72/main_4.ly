\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \dorian \time 4/4 \tempoMarkup "[unknown]" \autoBeamOff
  es4.^\partAc d16[ c] d8 g, g'4~
  g8[ f16 es] f4. es16[ d] es8[ f16 es]
  d2 c8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
