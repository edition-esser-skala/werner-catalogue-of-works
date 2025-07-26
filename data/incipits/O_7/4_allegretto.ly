\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/8 \tempoMarkup "Allegretto"
    d'4.\p
    f32( e d cis) d4
    f32( e d cis) d4
    e32( f g f) g8[ a]
    \grace { g16[ a] } b4 a16 g
    \tuplet 3/2 8 { f[ e d] } d8-!\f c!-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/8 \tempoMarkup "Allegretto"
    r8 f32(\p g a g) a8
    r d,32( e f e) f8
    r b16( g) a8
    r \tuplet 3/2 8 { cis16 d e } f8
    \grace { e16[ f] } g4 f16 e
    \tuplet 3/2 8 { f16[ e d] } d8-!\f c!-!
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/8 \tempoMarkup "Allegretto"
    d8\p d' c
    r b a
    r g f
    r e d
    r cis cis
    r d'-!\f c!-!
  }
}

BassFigures = \figuremode {
  r8 <3> <\t>
  r <5 3> <\t \t>
  r <7 5> <\t \t>
  r <6\\>4
  r8 <7- 3> <6>16 <5>
  r4.
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
