\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  r2^\partSc g' a h
  c b a2. a4
  g1 r
}

text = \lyricmode {
  Cru -- de -- lis
  He -- ro -- des De --
  um
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
