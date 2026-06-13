\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Largo"
  c'16-\partVi b a b c4 g16 f e f g4 \gotoBar "7"
  \clef tenor \autoBeamOff
    c,4.^\partTs \tuplet 3/2 8 { d16[ e f] } e8. e16 f[ c] c[ b]
  a8 f c' c d e16[ f] e[ d] c[ b]
}

text = \lyricmode {
  \skips 10
  Heut mueß je -- ne Son -- ne
  wei -- chen, die daß Rund der Weld "be -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
