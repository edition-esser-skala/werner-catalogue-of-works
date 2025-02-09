\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  a'4^\partSs e' cis r8 fis
  \sbOn \tuplet 3/2 8 { e16[ fis e } d cis] \tuplet 3/2 8 { d[ e d } cis h] cis8 a r fis'
  \tuplet 3/2 8 { e16[ fis e } d cis] \tuplet 3/2 8 { d[ e d } cis h] \sbOff cis[ d cis d] e8 e,
}

text = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ son, e --
  lei -- _ son, __ _ "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
