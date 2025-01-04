\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b'4~^\partVi \sbOn \tuplet 3/2 8 { b16 d f } f,16. a32 b4~ \tuplet 3/2 8 { b16 f' b } b,16. d32 \sbOff \gotoBar "6"
    \clef tenor \autoBeamOff r8^\part Job f,4 f,8 b16[ a] b4.
    \tuplet 3/2 8 { c16[ d es] d[ es f] } \grace f8 es4 d f8 es16[ d]
}

text = \lyricmode {
  \skips #10
  Gro -- ßer Her -- ſcher,
  dei -- ne Gna -- de, die du
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
