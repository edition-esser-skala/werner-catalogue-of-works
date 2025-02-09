\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  c'2^\partSc c
  c4 cis d2
  e4 f4. d8 f4
  e8 r r4 r2
}

text = \lyricmode {
  San -- ctus,
  san -- _ ctus,
  san -- _ _ _
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
