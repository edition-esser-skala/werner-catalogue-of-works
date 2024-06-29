\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \minor \time 3/8 \tempoMarkup "Ariose" \autoBeamOff
  e4.~^\partAs
  e~\trill
  e16[ fis] \tuplet 3/2 8 { g[ fis e] fis[ e dis] }
  e[ dis] e8 g~
  g fis16[ e] d[ c]
}

text = \lyricmode {
  A --

  ve Re --
  gi -- na, a --
  ve "Re -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
