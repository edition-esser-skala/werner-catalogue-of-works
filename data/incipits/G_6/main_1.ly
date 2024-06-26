\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Andante"
  b''8^\partVi f16. d32 b8 f d b r4
  r8 f''16. d32 b8 d g, g'16. es32 c8 es \gotoBar "4"
  \clef soprano \autoBeamOff d8.^\partSc d16 d8 f d d r d
  b b r d c c c b
}

text = \lyricmode {
  \repeat unfold 16 { \skip 8 }
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, Ky -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
