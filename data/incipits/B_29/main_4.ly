\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagiosè"
  r2^\partSc a'4. h8
  cis[ d e fis] g g,4 a8
  h[ cis] d[ cis16 h] a4. h16[ cis]
}

text = \lyricmode {
  San -- _
  _ ctus, san -- _
  _ _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
