\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  b'4.^\partSc g8 c a f f'
  d b d c16[ b] a8 c d4~
  d8[ c16 d] e8[ d16 \hA e] f8 f es d16 c
}

text = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  Ma -- ter, Re -- dem -- pto -- ris Ma --
  _ ter, quae per -- vi -- a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
