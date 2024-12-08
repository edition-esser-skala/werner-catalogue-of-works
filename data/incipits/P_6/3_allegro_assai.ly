\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/8 \tempoMarkup "Allegro assai"
    f'4.
    \grace { e16[ d] } c4.
    \grace { b16[ c] } d4.
    \grace { c16[ b] } a4.
    \grace { g'16[ a] } b4.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/8 \tempoMarkup "Allegro assai"
    f16 g a8 b
    \grace { c16[ b] } a4.
    \grace { g16[ a] } b4.
    \grace { a16[ g] } f4.
    \grace { e'16[ f] } g4.
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \major \time 3/8 \tempoMarkup "Allegro assai"
    f8 f f
    f f f
    f f f
    f f f
    c c c
  }
}

BassFigures = \figuremode {
  r4.
  r
  <6 4>
  <5 3>
  r
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
