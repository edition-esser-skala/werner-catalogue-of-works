\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
  r8 g' g g es4 es
  as8 as as2 g8[ f]
  es4. es8 d2
}

text = \lyricmode {
  So iſt dan di -- ſer
  Tag des Jam -- mers
  und der Plag,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
