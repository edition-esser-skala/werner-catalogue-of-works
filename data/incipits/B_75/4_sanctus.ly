\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c'4.-\tutti h8 c4
    g c8 g e c
    g'2 r4
    c,-! e4.-! d16-! c-!
    g'4-! a2\trill
    << {
      g4 h4. a16 g
      c4 d2\trill
    } \\ {
      g,4. d8 g f
      e a f e16 d g8 f
    } >>
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r
  r
  r
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
