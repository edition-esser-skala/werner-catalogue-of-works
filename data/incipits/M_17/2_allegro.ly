\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1*4 %27
    e2 c'4. h16 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    a2 f'4. e16 f
    dis8 dis dis dis h'4. a16 h
    gis8 gis gis gis e'4 a,~
    a8 h c16 h a gis a8 c4 h16 a
    h8 a g16 a fis g e8 e e e
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    R1*5
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
