\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Tempo giusto"
  \partial 8 c'8^\partVi a'8.\trill g32 f e8 d c8.\trill b32 a g8 \gotoBar "4"
    \clef tenor \autoBeamOff c,^\part "Barthlme"
  f8. e32[ d] c8 b a8. g16 f8 f'
}

text = \lyricmode {
  \skips 10
  Ein
  Zim -- mer -- mann der et -- was khan iſt
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
