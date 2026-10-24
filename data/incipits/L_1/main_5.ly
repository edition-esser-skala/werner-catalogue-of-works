\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 6/8 \tempoMarkup "Allegro / Allegretto / Larghetto"
  \partial 8 g'8^\partVi c8. d16 c8 c8. e16 g8
  c,4 c8 c4 \gotoBar "8" \clef tenor \autoBeamOff g,8^\part "Savoiard"
  c8.[ d16] c8 c8.[ d16] c8
  c4. c4 c8
}

text = \lyricmode {
  \skips 10
  Ô
  bel -- la Mar -- ga --
  ri -- ta ô
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
