\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  r4^\partSc r8 h' c8. c16 c8 d
  e8. e16 e8 d e e d d
  d8. d16 d8 d d d c c
}

text = \lyricmode {
  Je -- ru -- ſa -- lem! wie
  wun -- der -- ſchön ſeyn al -- le dei -- ne
  Woh -- nun -- gen. Ô kla -- rer Tag der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
