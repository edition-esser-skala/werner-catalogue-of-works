\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  c'4.^\partSc h8 c4. e8
  d4 c4. h16_[ a] h4\trill
  c r r2
}

text = \lyricmode {
  San -- ctus, san -- ctus,
  san -- _ _ _
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
