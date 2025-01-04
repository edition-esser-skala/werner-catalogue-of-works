\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/8 \tempoMarkup "Allegro"
    g''8.\trill f32 e d16 c
    c'8-! g-! a-!
    g,8.\p f32 e d16 c
    c'8-! g-! a-!
    g16\f g' g( f) f( e)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/8 \tempoMarkup "Allegro"
    e'16 c32 d e16 c f( e)
    r8 e-! f-!
    e,16\p c32 d e16 c f( e)
    r8 e-! f-!
    e16\f e' e( d) d( c)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 3/8 \tempoMarkup "Allegro"
    c'16 c c c c c
    c c c c c c
    c\p c c c c c
    c c c c c c
    c8\f h c
  }
}

BassFigures = \figuremode {
  r4.
  r8 <5 3> <6 4>
  <5 3>4.
  r8 q <6 4>
  <5 3> <6>16 <5> <9 4> <8 3>
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
