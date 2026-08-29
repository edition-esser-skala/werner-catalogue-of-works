\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Vivace"
  r16^\partVi b d16. f32 \sbOn \tuplet 3/2 8 { b16 d f } b16. d32 \sbOff \appoggiatura d16 c16. b32 \appoggiatura b16 a16. g32 \appoggiatura g16 f16. es32 \appoggiatura es16 d16. c32 \gotoBar "7"
  \tuplet 6/4 4 { \sbOn b16 b' f d b f \sbOff } d4*1/2 \clef bass \autoBeamOff b,8^\part "Gerechtigkheit" b' f b d
  c16.[ b32 a16. g32] f16.[ es32 d16. c32] d8 b r d'
}

text = \lyricmode {
  \skips #23
  Du Him -- mel nicht ver --
  weil -- _ _ le mit
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
