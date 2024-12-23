\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \tempoMarkup "Ben andante" \autoBeamOff
  r4^\partSc g'4. e8 a4. fis8 h4~
  h8[ g] c2 h4 c4. a8
  d4. h8 e4 c a d
}

text = \lyricmode {
  Ky -- ri -- e __ _ e --
  lei -- son, Ky -- ri --
  e __ _ e -- _ lei -- \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
