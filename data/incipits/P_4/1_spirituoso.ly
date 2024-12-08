\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Spirituoso"
    c'16( c,) c4 c'16( h)
    c( c,) c4 c'16( h)
    c h32 a g16. a32 g16 f32 e d16. g32
    e8 c r c'16(\p h)
    c h32 a g16. a32 g16 f32 e d16. g32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Spirituoso"
    e8 g16( g,) g'8 f
    e g16( g,) g'8 f
    e8. c16 d8 h
    g g'16 g, g'8 f\p
    e8. c16 d8 h
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Spirituoso"
    c8 e e d
    c e e d
    c e h g
    c e e d\p
    c e h g
  }
}

BassFigures = \figuremode {
  r4. <6>8
  r4. q8
  r2
  r4. <6>8
  r2
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
