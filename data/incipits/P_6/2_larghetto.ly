\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    d'2~ d8. f16
    b,2~ b8. d16
    cis,2.~
    cis8 d d4 r
    d'2~ d8. f16
    gis,2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    f4 f f
    g g g
    e e e
    f f f
    f f f
    e e e
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    d'4 d d
    d d d
    d d d
    d d d
    d d d
    d d d
  }
}

BassFigures = \figuremode {
  r2.
  <6 4>
  <7+ 4 2>
  <8 3>
  r
  <4+ 2>
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
