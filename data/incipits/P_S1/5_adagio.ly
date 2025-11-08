\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/8 \tempoMarkup "Adagio · Exprimens valedictionem" \autoBeamOff
    \partial 16 es'16 \grace es8 d4 r16 es
    \grace es8 d4 r16 es
    \grace es8 d8.[ c16 b a]
    b[ c b a g g']
    \grace g8 f!4 r16 g
    \grace g8 f4 r16 g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/8 \tempoMarkup "Adagio · Exprimens valedictionem" \autoBeamOff
    \partial 16 r16 r8 r16 b' \grace b8 a
    r r16 b \grace b8 a
    r r16 fis[ g a]
    d,4.
    r8 r16 d' \grace  d8 c
    r r16 d \grace  d8 c
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/8 \tempoMarkup "Adagio · Exprimens valedictionem" \autoBeamOff
    \partial 16 r16 r8 r16 g' \grace g8 fis
    r r16 g \grace g8 fis
    r r16 d[ e fis]
    g4 g,8
    r r16 b' \grace b8 a
    r r16 b \grace b8 a
  }
}

BassFigures = \figuremode {
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
