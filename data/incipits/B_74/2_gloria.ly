\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c4-\tutti r r2
    r8 c e c g'4 g,
    r2 r8 e' gis e
    a4 a, r2
    r8 f' a f c' c, e c %5
    g'4 g, r2
    r8 g' h g c c, e c
  }
}

BassFigures = \figuremode {
  %tacet
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
