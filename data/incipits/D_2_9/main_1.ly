\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  g'4.^\partSc c8 c2
  c4 c d2~
  d8 c16[ h] c8 e c c cis cis
}

text = \lyricmode {
  Qui man -- du --
  cat, man -- du --
  cat, qui man -- du -- cat me -- am
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
