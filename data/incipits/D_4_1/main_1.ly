\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 5/8 \tempoMarkup "Allegro" \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/16^\partBc d a' b a\fermata \bar "||"
  \time 4/4 \clef alto r4^\partAc f' e8 a4 g8
  c b16[ a] g8 a g8. g16 c,8 f
}

text = \lyricmode {
  Ro -- _ ra -- _ te
  Coe -- li, coe -- li
  de -- su -- per, de -- _ su -- per, "coe -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
