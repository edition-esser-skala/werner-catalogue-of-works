\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
    \partial 4 c'8-! e-!
    a,-! f'-! e-! d-!
    e-! c-! c'8. h32 a
    g8. f16 e8.\trill d32 c
    g4 g'8(\p fis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
    \partial 4 c'8-! e-!
    a,-! d-! c-! h-!
    c4-! c'8. h32 a
    g8. f16 e8.\trill d32 c
    g4 es'8(\p d)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
    \partial 4 e4-!
    f-! g-!
    c,-! c'8.-\unisono h32 a
    g8. f16 e8. d32 c
    g8 g' g\p g
  }
}

BassFigures = \figuremode {
  <6>4
  q <4>8 <3>
  r2
  r
  r4 <8 6->8 <7\\ 5>
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
