\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Andante"
  c'8^\partVi c c c d16 h c g' f d e c
  h d g,,8 g g g''16 c, c8\trill a'16 c, c8\trill \gotoBar "7"
  \clef tenor \autoBeamOff c,4.^\partTs c8 d16([ h)] c8 f e
}

text = \lyricmode {
  \skips 23
  Al -- ma Re -- dem -- pto -- ris
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
