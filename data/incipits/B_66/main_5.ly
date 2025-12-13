\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
  a'2^\partSs b
  a g
  f e
  d r
  f g
}

text = \lyricmode {
  Be -- _
  ne -- _
  di -- _
  ctus,
  qui _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
