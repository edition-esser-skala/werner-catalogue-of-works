\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  e8[^\partSs a] \tuplet 3/2 4 { a[ h cis] h[ a gis] }
  a8.[\trill gis16] \tuplet 3/2 4 { a8[ h cis] h[ a gis] }
  a8.[\trill gis16] a4 cis
}

text = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- rum, "a -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
