\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Spirituoso"
  f16.^\partVi a32 c16. a32 f'8 f a8.\trill g32 f \gotoBar "4"
    \clef bass \autoBeamOff c,8^\part "Sagfäller" a
  f c a c f16[ e] f8 f \tuplet 3/2 8 { a16[ b c] }
  b[ a] g[ f] e[ d] c[ b'] a8 r f a
}

text = \lyricmode {
  \skips 9
  Hoch und
  mit -- le nied -- re Sten -- de brau -- chen
  mi und ſänd gar froh, ſprö -- chen
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
