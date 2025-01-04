\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d'4^\part "Die Kinder Gottes" r es r8 es
  d d c b b[ a] a g
  g[ fis] fis4 r8 h4 h8
}

text = \lyricmode {
  Seht! ſeht! ſo
  pfle -- get Gott zu ſtih -- len, zu
  ſtih -- len, dan nach
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
