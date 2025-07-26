\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti e'16 d c h a g f8 d g g,
    c c'16 h a g f e d8 d'16 c h a g f
    e8 e'16 d c h a g f8 f'16 e d c h a
    g f e d c8 h c c' e, c
    g'4 r gis4. gis8
  }
}

BassFigures = \figuremode {
  r2 <6 5>
  r1
  r
  r
  r2 <5>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
