\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "Largo"
  \sbOn e'64(^\partV a, h c d e fis? gis) a16 a, \sbOff gis( d') h'( d,) \tuplet 3/2 8 { c h a } a8 r << { a' } \\ { c, } >> \gotoBar "4"
  \clef bass \autoBeamOff r2^\partBs a,16[ c32 h] a16[ gis] a[ e] c' a
  e'8 e, r h' c8.[\trill h32 a] g[ a h c d16 f,]
}

text = \lyricmode {
  \skips 9
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
