\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  a'2.^\partSc cis4 d2
  e1 d2~
  d cis d~
  d4 c b a b2
}

text = \lyricmode {
  Be -- _ ne --
  di -- _
  ctus, qui __
  _ "ve -" _ _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
