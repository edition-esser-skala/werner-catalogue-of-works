\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Presto mà moderato"
  r4^\partBs g c4. d8
  es4 es8 f g4. g8
  c, c' c c b![ as] b[ g]
}

text = \lyricmode {
  Lau -- da -- te
  pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
