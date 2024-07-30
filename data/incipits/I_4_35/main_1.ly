\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  c4.^\partAs \tuplet 3/2 8 { e16[ d c] } g'4. \tuplet 3/2 8 { h16[ a g] }
  c8[ h16 a] g8 f e16[ d] c8 r g'
  a16[ h c h] c8 g f16[ g a g] a8 e
}

text = \lyricmode {
  Sal -- _ _ _
  _ ve Re -- gi -- na, Re --
  gi -- _ na sal -- _ ve,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
