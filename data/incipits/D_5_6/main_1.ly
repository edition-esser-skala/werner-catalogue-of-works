\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff
  r4^\partSs g'2
  a8[ g] a2
  h8[ a] h2
  c8[ h] c2
  h4 a2 %5
}

text = \lyricmode {
  A --
  _ _
  _ _
  _ _
  men, "a -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
