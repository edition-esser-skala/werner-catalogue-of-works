\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    \tuplet 3/2 4 { f'8 g a } f,2
    \tuplet 3/2 4 { a'8 b c } f,,2
    b'16( d8.) c16( g8.) a16( f8.)
    \tuplet 3/2 4 { e8 f g } c,4 r
    f \tuplet 3/2 4 { g8 f e } f( c)
    c( b) b( a) a( g)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    \tuplet 3/2 4 { f'8 g a } f,2
    \tuplet 3/2 4 { a'8 b c } f,,2
    b'16( d8.) c16( g8.) a16( f8.)
    \tuplet 3/2 4 { e8 f g } c,4 r
    f \tuplet 3/2 4 { g8 f e } f( c)
    c( b) b( a) a( g)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f4 e d
    c b a
    g' e f
    c c' b
    a b a
    g f e
  }
}

BassFigures = \figuremode {
  <8 3>2 \bassFigureExtendersOn q4
  <6 4>2 q4 \bassFigureExtendersOff
  r <6>2
  r2.
  <6>4 q8 <4> <6>4
  r2 q4
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
