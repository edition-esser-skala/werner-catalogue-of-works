\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  c'4^\partSc d8.[\trill c32 d] e16[ f e f] g8 g,
  c16[ d c d] e8 e, a16[ h a h] c8 c,
  f16[ g a8] g f e c r c'
}

text = \lyricmode {
  Ky -- ri -- e __ _ e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
