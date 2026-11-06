\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r16^\part "Barthlme" d d d g g d f es8 es r16 es g as
  b8. g16 es8 g c, c16 e g8 a
}

text = \lyricmode {
  Öß Dal -- khen, Li -- meln und öß Nar -- ren! wanß lie -- ber
  thäts dö Zeit er -- ſpah -- ren und bald oän
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
