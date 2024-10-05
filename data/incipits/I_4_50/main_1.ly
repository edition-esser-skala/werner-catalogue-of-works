\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  d8~[\trill^\partSs d32 cis d e] fis16.[\trill e32 d e fis g] a16.[\trill g32 fis g a64 h cis32] d[ e fis g a g fis e]
  d16[ d,\trill fis\trill a]\trill d32[ cis h a g fis e d] a'8 e r4
}

text = \lyricmode {
  Sal -- _ _ _
  _ _ _ ve
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
