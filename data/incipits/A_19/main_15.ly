\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Jahel" g' c e h8. h16 h8 c
  d d f e c c c d
  e8. a,16 a8 cis e g f e
}

text = \lyricmode {
  Be -- glük -- tes Is -- ra -- el! Ich
  hab im Geiſt ge -- ſehn dein ſcharf -- fes
  Hel -- den -- ſchwerd auf Lor -- ber -- ä -- ſten
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
