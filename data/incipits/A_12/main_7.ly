\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "Largo"
  c'4.^\part "ob" es8 d fis g4
  c,8 e f2 es4 \gotoBar "6"
  \clef bass \autoBeamOff c,8[^\part Schöpffer g] es[ c] h[ d] g4
  c16[ b as8] g[ fis] fis[ g] g,4
}

text = \lyricmode {
  \skips 9
  Mei -- ne Ur -- theill
  ſein ver -- bor -- gen,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
