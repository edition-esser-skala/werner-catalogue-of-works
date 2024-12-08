\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Adagio"
    h'8.( cis16) d4 eis
    fis8( fis,) fis4 r
    e'!8.( fis16) g4 fis8( e)
    d8.( cis16) h4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Adagio"
    r4 h'' d,
    cis2 r4
    cis2 cis4
    fis, d' fis
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key h \minor \time 3/4 \tempoMarkup "Adagio"
    h'2 h4
    ais2 r4
    ais2 ais4
    h, h' a
  }
}

BassFigures = \figuremode {
  r2 <4+ 3>4
  <6>2.
  <7 5!>2 <6 \t>4
  r2 <6>4
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
