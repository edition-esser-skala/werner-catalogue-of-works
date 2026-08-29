\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 3/4 \tempoMarkup "Largo"
  g''4.^\part "vla d’amore" f16 es \tuplet 3/2 4 { d8 es f }
  es8. g,16 c,4 r \gotoBar "22"
  \clef tenor \autoBeamOff g4^\part "Der gehorſame Sohn" c es
  d8.[ es16] f4 h,
  \appoggiatura h8 c2 r4
}

text = \lyricmode {
  \skips #9
  Mach ſich nur
  kei -- _ ner
  grecht!
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
