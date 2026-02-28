\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Largo"
  \partial 8 c'8^\partVi f \tuplet 3/2 8 { a16 b c } \appoggiatura c8 b8. a32 g a16 f f c c a a8 \gotoBar "8"
  \clef tenor \autoBeamOff r4^\partTs r8 c, f16[ c] a[ g] f8 \tuplet 3/2 8 { g16[ a b]
    a[ g f] } f8 r c' d f c \tuplet 3/2 8 { f16[ e d] }
}

text = \lyricmode {
  \skips 15
  Be -- glück -- ter E -- dens
  Gar -- ten, da -- rin die gröſ -- ſte
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
