\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 6/8 \tempoMarkup "Allegro"
    a''8. h16 a8 gis a,4
    f'8. g16 f8 e a,4
    d8. e16 d8 c d16 c h a
    e'8 a, gis a16 h c d e fis
    g! a h a g a fis h gis e fis gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 6/8 \tempoMarkup "Allegro"
    R2.*4
    e'8. fis16 e8 dis e,4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 6/8 \tempoMarkup "Allegro"
    R2.*5
  }
}

BassFigures = \figuremode {
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
