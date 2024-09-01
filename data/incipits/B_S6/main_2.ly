\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c'4.^\partSc c8 c4 h8 d
  c c \grace d8 c4 h r
  d4. d8 d4 d8 d
}

text = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  Glo -- ri -- a in "ex -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
