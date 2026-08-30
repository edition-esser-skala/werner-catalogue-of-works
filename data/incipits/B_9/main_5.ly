\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \mixolydian \time 4/4 \tempoMarkup "Larghetto"
  gis'16.^\partVi h32 e16. gis32 h16. fis32 dis16. h32 \gotoBar "3"
    \clef alto \autoBeamOff e,4^\partAs h'
  \tuplet 3/2 8 { gis16[ fis e] } e8 r gis fis16[ gis ais h] \tuplet 3/2 8 { cis[ h ais] gis[ fis e] }
}

text = \lyricmode {
  \skips 8
  Be -- ne --
  di -- ctus, qui ve -- nit, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
