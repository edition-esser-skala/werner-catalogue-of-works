\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  f8^\partAs c d16[ f] e[ g] f8 e16[ d] c8. b16
  \clef soprano f'8^\partSs c' \tuplet 3/2 8 { d16[ c b] a[ g f] } f8 e r g16 g
  a8[ g] a b a d4 b8
}

text = \lyricmode {
  Et in ter -- ra pax ho -- mi -- "ni -"
  bo -- nae vo -- lun -- ta -- tis, be -- ne --
  di -- ci -- mus te, ad -- "o -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
