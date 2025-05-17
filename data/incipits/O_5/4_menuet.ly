\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    a'4 \tuplet 3/2 4 { a8 h cis } h4
    \tuplet 3/2 4 { cis8 d e } \grace e d2
    cis4 d8 e fis gis
    a( e) \grace e d2
    cis4 fis2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    a'4 \tuplet 3/2 4 { a8 h cis } h4
    \tuplet 3/2 4 { cis8 d e } \grace e d2
    cis4 d8 e fis gis
    a( e) \grace e d2
    cis4 fis2
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    a4 a' gis
    e fis gis
    a8 gis fis e d4
    cis h e,
    a d' h
  }
}

BassFigures = \figuremode {
  r2 <6>4
  q q <\t>
  r <6>2
  q4 <7> q
  r2.
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
