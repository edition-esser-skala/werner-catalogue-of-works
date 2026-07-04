\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/4 \tempoMarkup "Ariose" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  \tuplet 3/2 4 { h'8[^\partSs c d] e[ d c] h[ a g]
  fis[ g a] } g4 r
  cis8[ d] d,4 r
  cis'8[ d] d,4 r
}

text = \lyricmode {
  Sal -- ve Re --
  gi -- na,
  ma -- ter
  sal -- ve
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
