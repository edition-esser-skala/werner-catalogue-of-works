\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  cis'4^\partSc r8 cis e4 h
  cis r8 a h8.[\trill cis32 d] e8[ d]
  cis4 a8[ h16 cis] d4 h8.[ cis32 d]
}

text = \lyricmode {
    Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae, "bo -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
