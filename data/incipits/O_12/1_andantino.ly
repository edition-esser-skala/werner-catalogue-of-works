\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Andantino"
    a'16( c) f8 c16( f) a8
    b2
    b16( g) e8 g16( e) b8~
    b a16 g a4
    c8 f4 a8~
    a d,4 b8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Andantino"
    f16( a) c8 a16( c) f8
    g2
    g16( e) c8 b16( g) g8~
    g f16 e f4~
    f8 a16 f c'8 f,
    d( fis) g16( \hA fis) g8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Andantino"
    f8 f f f
    e e e e
    e e e e
    f f f f
    a, a a a
    b b b b
  }
}

BassFigures = \figuremode {
  r2
  <5 3>4 <\t \t>
  r2
  <4 2>8 <3 1>4.
  <6>2
  <7 3>4 <6>
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
