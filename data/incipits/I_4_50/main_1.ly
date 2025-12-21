\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Andante"
  c'2^\partVii \sbOn \tuplet 3/2 8 { e16 d c } h a \tuplet 3/2 8 { c h a } g f \sbOff \gotoBar "7"
  \clef soprano \autoBeamOff c'2^\partSs \sbOn \tuplet 3/2 8 { e16[ d c } h a] \tuplet 3/2 8 { c[ h a } g f]
  e8 c c'8.[\trill h32 a] g8 f16[ e] f4\trill
  e
}

text = \lyricmode {
  \skips 11
  Sal -- _ _
  _ ve, sal -- ve Re -- gi --
  na,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
