\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \dorian \time 2/2 \tempoMarkup "Alla breve"
    R1*4 \gotoBar "9"
    d'1
    a'
    b2 a4 gis
    a2 fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \dorian \time 2/2 \tempoMarkup "Alla breve"
    g'1
    d'
    es2 d4 cis
    d2 h \gotoBar "9"
    d4 e f2~
    f e
    d e
    cis d
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \dorian \time 2/2 \tempoMarkup "Alla breve"
    R1*4 \gotoBar "9"
    R
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
