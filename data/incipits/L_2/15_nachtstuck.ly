\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Largo"
    d'2^\conSord c
    b4. \tuplet 3/2 8 { es16 d c } b8. c16 a4\trill
    g8 b c16( d) d( es) es2~
    es8 f d \tuplet 3/2 8 { g16 f es } d8. es16 c4\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Largo"
    b'2.^\conSord a4~
    a8 g16 fis g4~ g8. a16 fis4\trill
    g r r8 g a16( b) b( c)
    c8 b16 a b4~ b8. c16 a4
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Largo"
    g'8\pp a b g a g fis d
    g, a b c d c d d,
    g g'16 f! es8 d c c'16 b a8 g
    f f, g es' f es f f,
  }
}

BassFigures = \figuremode {
  r2 <9>4 <5 3>8 <\t \t>
  <9>4 <6> <6 4> <5 _+>
  r <6>2 <5->4
  <7>2 <6 4>4 <5 3>
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
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
