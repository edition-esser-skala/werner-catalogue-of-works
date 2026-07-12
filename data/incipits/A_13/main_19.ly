\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
  r8^\partVi c' e, f g16 c e g f8 e16 d \gotoBar "6"
  e16 c8 e16 d8 h c4*1/2 \clef bass \autoBeamOff c,8^\part "Schöpffer" e, f
  g e f g c, e g[ c16 e]
}

text = \lyricmode {
  \skips 16
  So habt dan
  acht und nicht ver -- acht mein "groſ -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
