\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d'4-! fis-!
    a-! d-!
    a8 fis16 g a g fis e
    d8 a fis d
    r fis'\p gis a
    e4-! a-!
    d2~
    d8 cis16 h cis8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d'4-! fis-!
    a-! d-!
    a8 fis16 g a g fis e
    d8 a fis d
    d'4\p r
    cis-! c-!
    r8 h fis gis
    a e a,4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d4-! fis-!
    a-! d-!
    a8 fis16 g a g fis e
    d8 a fis d
    R2*4
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
  r2*4
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
