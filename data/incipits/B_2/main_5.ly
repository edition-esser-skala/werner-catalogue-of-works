\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c'4.^\partSc f8 e4 e8 d
  c[ h] c4 r8 g g[ a]
  h16[ c h c] d8 g, g4 r8 c
}

text = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit in no --
  _ _ mi -- ne, in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
