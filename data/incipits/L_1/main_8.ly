\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Arzt" a' a f16 a a8 e16 e g g a e
  fis8 fis16 fis a a c b g4 r16 b g f
}

text = \lyricmode {
  Wohl ed -- le ge -- lieb -- te ver -- liebt und auch be --
  trüb -- te wer ſich will helf -- fen ſehn kan auf die
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
