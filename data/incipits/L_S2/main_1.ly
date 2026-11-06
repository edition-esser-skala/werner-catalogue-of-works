\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
  c''8 g g g
  g16 a g f e8 g \gotoBar "42"
  \clef soprano \autoBeamOff
  g4 g8 g
  g g16[ f] e4
  g8[ f] d d
  e16[ f] e[ d] c4
}

text = \lyricmode {
  \skips 10
  O ſö -- ner
  Ra -- ri -- te
  o ſö -- ner
  Spil -- la -- werk
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
