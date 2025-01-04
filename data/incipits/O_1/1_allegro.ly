\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/8 \tempoMarkup "Allegro"
    \tuplet 3/2 8 { c'16 c c e[ e e] g g g c[ c c]
    h h h g[ g g] e e e c[ c c]
    h h h g[ g g] e e e c[ c c]
    g' g, g g[ g g] g g g g[ g g] }
    g4 r\fermata
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/8 \tempoMarkup "Allegro"
    \tuplet 3/2 8 { c16 c c e[ e e] g g g c[ c c]
    h h h g[ g g] e e e c'[ c c]
    h h h g[ g g] e e e c[ c c]
    g' g, g g[ g g] g g g g[ g g] }
    g4 r\fermata
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/8 \tempoMarkup "Allegro"
    \tuplet 3/2 8 { c16 c c e[ e e] g g g c[ c c]
    h h h g[ g g] e e e c[ c c]
    h h h g'[ g g] e e e c[ c c]
    g' g, g g[ g g] g g g g[ g g] }
    g4 r\fermata
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
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
