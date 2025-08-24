\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  r4 c'2 h4
  r d2 c4
  r h c8 a16 h c8 d
}

text = \lyricmode {
  Al -- ma
  Ma -- ter,
  quae per -- vi -- a coe -- li
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
