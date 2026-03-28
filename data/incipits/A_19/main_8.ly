\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  r8^\part "Debora" c g'8. g16 g8 b des c
  as as r f es8. c16 \hA es8 d!
  b4 r8 g' f16 a c a f8 a
}

text = \lyricmode {
  Ô Herr! in deſ -- ſen Wun -- der --
  güt -- te kein Grund zu for -- ſchen
  iſt, be -- feu -- re dei -- nes Volks "Ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
