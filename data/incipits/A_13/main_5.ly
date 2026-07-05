\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twofourtime \key c \major \time 2/4 \autoBeamOff \tempoMarkup "Tempo giusto"
  g'4.^\part "Barmherzigkeit" a16[ f]
  g8 c g \tuplet 3/2 8 { a16[ g f] }
  g8 c, c' e
  \tuplet 3/2 8 { d16[ c h] } a[ g] f8. e16
}

text = \lyricmode {
  Ob es
  ſchei -- net daß man
  mei -- net es ſey
  al -- le Hilff "ver -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
