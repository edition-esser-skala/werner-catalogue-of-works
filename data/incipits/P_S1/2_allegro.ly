\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Allegro"
    R1*4
    r2 d'
    b' cis,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Allegro"
    g'2 es'
    fis, d'
    e, c'
    d,4 b' a2
    g8 b a g f!4 r
    r8 g16 a b g a b a8 a, a'4
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Allegro"
    r2 r8 c'16 d es c d es
    d8 d, d'4 r8 h16 c d \hA h c d
    c8 c, c'4 r8 a16 b c a b c
    b8 b, g'2 fis4
    g8 g f es d4 d,
    R1
  }
}

BassFigures = \figuremode {
  r1
  <_+>2 <6>
  <_!> <6>
  r4 <3> <4 2> <6 5>
  r1*2
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
}
