\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Larghetto"
    f,8\pp f' f f f f f f
    c c c4 f r8 f
    e4 a8 f d f g g,
    c4 r8 c d4 r8 d
    g4. f8 e4 r8 e %5
    a4. g8 f4 r8 f
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
