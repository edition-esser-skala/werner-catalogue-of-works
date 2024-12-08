\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Allegro ma non troppo"
    b'4.~
    b8 a b
    c16 d es4~
    es8 d es
    f16( d b8) as
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Allegro ma non troppo"
    d16 es f8 d
    c f4~
    f8 es c
    f b, r
    b d16( b) f'8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 3/8 \tempoMarkup "Allegro ma non troppo"
    b'8 d, b
    f'4 r8
    r g a
    b4 r8
    d,4 r8
  }
}

BassFigures = \figuremode {
  r4.
  <4>8 <3>4
  r8 <6> <\t> %65
  <4> <3>4
  <6>4.
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
