\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  h'2.^\partSc c4 d c8[ d]
  e4 d c1\trill
  h4 g8[ a] h4 d c h
  a2 r r
}

text = \lyricmode {
  San -- _ _ _
  _ _ _
  ctus, san -- _ _ _ _
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
