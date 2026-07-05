\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "Allegro molto"
  d16.^\partVi fis32 a16. d32 a16. cis32 e16. g32 fis16. d32 a16. fis32 d16. a''32 a16. a32 \gotoBar "7"
  \clef tenor \autoBeamOff
    d,,4^\part "Gerechtigkeit" a \tuplet 3/2 8 { fis16[ e d] } r8 r fis'
  \sbOn \tuplet 3/2 8 { e16[ d cis d cis h] cis[ h a] h[ a g] } \appoggiatura g8 fis4 a \sbOff
}

text = \lyricmode {
  \skips 16
  Feur und Schwerd mein
  Rach __ _ be -- gerth, "Schwe -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
