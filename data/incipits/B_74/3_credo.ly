\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4.-\tutti c8 c' c,
    g4. g8 g' g,
    c4. c8 e e
    f4. d8 fis fis
    g4. g,8 g' g
    c,4. c8 c' c,
    f,4. d'8 d, d'
    g, c g'4 g,
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r4 <6>2
  r2.
  r
  r
  r4 <4> <3>
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
