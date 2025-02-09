\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
  e16^\partVi e32 e e16 g e32 c d e f g a h c16 c32 c c16 e c32 e, f g a h c d \gotoBar "9"
  \clef soprano \autoBeamOff e8.^\partSc e16 e8 d c e16 e g8 e16 e
  d8 d
}

text = \lyricmode {
  \skips 26
  Ky -- ri -- e e -- lei -- son, e -- lei -- son, e --
  lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
