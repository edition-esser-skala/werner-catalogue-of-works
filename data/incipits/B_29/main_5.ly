\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/4 \tempoMarkup "Larghetto" \newSpacingSection
    \once \override Staff.TimeSignature.style = #'single-digit
  r8^\partVi e' h( a) h, a'
  g16( a32 h c d e fis) g8 c, d,16( fis) a( c) \gotoBar "8"
  \clef soprano \autoBeamOff r8^\partSs h4 c8 h16[ g a fis]
  g4
}

text = \lyricmode {
  \skips 9
  Be -- ne -- di --
  ctus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
