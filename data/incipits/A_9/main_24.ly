\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "St: Michael" d fis16 fis g a cis,4 r8 e
  g8. g16 a8 e fis8. fis16 fis8 a
  d, d e h cis4
}

text = \lyricmode {
  Kom mein ver -- lieb -- te Braut und
  fol -- ge mir, nit förch -- te dir, geh
  ſi -- cher und ver -- traut.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
