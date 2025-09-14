\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8 \tempoMarkup "Allegro"
    a'16( h) cis8 d %70
    e cis16( a) fis'8
    e( a) fis
    e cis16( a) fis'8
    e( a) fis
    e cis16( a) a'8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8 \tempoMarkup "Allegro"
    a'8 e16( a) h8
    cis a16( cis) d8
    cis16( e) cis( a) d8
    cis a16( cis) d8
    cis16( e) cis( a) d8
    cis a16( cis) a'8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 3/8 \tempoMarkup "Allegro"
    a8(-.-\tasto a-. a-.)
    a(-. a-. a-.)
    a(-. a-. a-.)
    a(-. a-. a-.)
    a(-. a-. a-.)
    a4 a'8
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
