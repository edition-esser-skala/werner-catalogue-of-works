\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "Allegro"
  d4^\partVi d' cis8( h) a h
  a g fis e fis16( e) d( cis) d4 \gotoBar "9"
  \clef soprano \autoBeamOff d4^\part "Jobs Frau" d' cis8[ h] a[ h]
  a[ g] fis[ e] fis16[ e d8] d4
}

text = \lyricmode {
  \skips 12
  Erd, er -- öff -- ne
  dei -- nen Ra -- chen,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
