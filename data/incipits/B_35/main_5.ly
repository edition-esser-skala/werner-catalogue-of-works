\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 4/4 \tempoMarkup "Spirituoso"
  e'8.^\partVi d32 c h16 fis dis h \tuplet 3/2 8 { g' fis e } e8 g4 \gotoBar "5"
  \clef soprano \autoBeamOff e'8.[^\partSs d32( c)] h8. a16 \tuplet 3/2 8 { g[ fis e] } e8 r e'
    c8.[\trill h32( a)] g8 fis \tuplet 3/2 8 { g16[ fis e] } e8 r4
}

text = \lyricmode {
  \skips 12
  Be -- _ ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
