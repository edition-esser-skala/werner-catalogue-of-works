\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
  a2^\partTc d,4 d'
  \clef soprano a'2^\partSc d,4 d'~
  d8 cis d e f2
  e r4 d
}

text = \lyricmode {
  Al -- ma "Re -"
  Al -- ma Re --
  dem -- pto -- ris Ma --
  ter, "Re -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
