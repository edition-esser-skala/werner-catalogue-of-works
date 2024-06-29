\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 4/2 \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  h'1^\partSc h2 cis
  d f1 f2
  e1 r2 cis
  d d4 d d2 d
}

text = \lyricmode {
  Se -- pul -- to
  Do -- _ mi --
  no, si --
  gna -- tum est mo -- "nu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
