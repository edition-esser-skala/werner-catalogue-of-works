\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Allegro"
  \sbOn \tuplet 3/2 8 { c16^\partVi h c } c16. e32 \tuplet 3/2 8 { e16 d e } e16. g32 \tuplet 3/2 8 { g16 f g } g16. c32 \tuplet 3/2 8 { c16[ h c] }
    \gotoBar "9" \clef soprano \autoBeamOff g8^\part "Jahel"
  c c, \tuplet 3/2 8 { e16[ d e] g[ f g] } c8 r \tuplet 3/2 8 { g16[ f g] c[ h c] }
}

text = \lyricmode {
  \skips 18
  Der
  Ad -- ler ſchwüngt ſich zwar, ſchwüngt ſich %
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
