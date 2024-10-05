\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Allegretto"
  e'16^\partVi g32 f e16 c g e g c e g32 f e16 c g e g c \gotoBar "5"
   \clef soprano \autoBeamOff r8^\partSc e16 d e8 e r16 e e d e8 e
   e e d d
}

text = \lyricmode {
  \skips 18
  Tri -- um -- pha -- les pa -- ra -- te pal -- mas
  im -- mor -- ta -- les
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
