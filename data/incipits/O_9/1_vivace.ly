\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 2 2/8 \tempoMarkup "Vivace"
    \tuplet 3/2 8 { e'16 fis e } a8-!
    \tuplet 3/2 8 { e16 fis e } cis'8-!
    \tuplet 3/2 8 { e,16\p fis e } a8-!
    \tuplet 3/2 8 { e16 fis e } cis'8-!
    e,16\f d32 cis h16 d
    cis a r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 2 2/8 \tempoMarkup "Vivace"
    \tuplet 3/2 8 { cis'16 d cis } cis8-!
    \tuplet 3/2 8 { cis16 d cis } a'8-!
    \tuplet 3/2 8 { cis,16\p d cis } cis8-!
    \tuplet 3/2 8 { cis16 d cis } a'8-!
    cis,16\f h32 a gis16 h
    a cis, r8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 2 2/8 \tempoMarkup "Vivace"
    a'8 r
    a r
    a,\p r
    a r
    a'\f e
    a, r
  }
}

BassFigures = \figuremode {
  %tacet
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
