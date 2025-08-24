\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key h \minor \time 3/4 \autoBeamOff \tempoMarkup "Tempo giusto"
  r4^\partTs fis,8.[ gis32 ais] h8[ cis]
  \tuplet 3/2 8 { d16[ cis h] } h8 r h g'32[ fis e8 d16]
  \tuplet 3/2 8 { cis16[ h a] } a8 r a fis'32[ e d8 cis16]
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  _ nit, qui "ve -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
