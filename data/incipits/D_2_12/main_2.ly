\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d'2^\partSc r
  es r
  d g4 c,8 c
  cis4. cis8 d2
}

text = \lyricmode {
  O,
  o,
  o sa -- crum con -- 
  vi -- vi -- um
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
