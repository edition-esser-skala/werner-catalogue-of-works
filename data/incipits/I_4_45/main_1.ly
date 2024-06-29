\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
  f2^\partAc g4
  e c r8 f
  g a b4. a16[ g]
  \clef soprano c2^\partSc d4
  h g r8 c
  d e f4. e16[ d]
}

text = \lyricmode {
  Sal -- ve,
  sal -- ve Re --
  gi -- na, sal -- ve
  Sal -- ve,
  sal -- ve Re --
  gi -- na, "sal -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
