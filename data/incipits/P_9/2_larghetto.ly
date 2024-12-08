\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Larghetto"
    h'16( e) e4. dis16( e) e4.
    e16( c') h( a) g( fis) e( dis) dis( e) e,4.
    gis4~ gis16( a) h( a) a8~ a16 e' e( d) c( h)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Larghetto"
    g'4~ g16 e g8 a h~ h16 e, h'8
    c8. c16 h( a) g( fis) g4~ g16 h h( e,)
    f2 e8( a) c( e)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "Larghetto"
    e8 e e e fis g g g
    a a h h e, e e e
    d! d d d c c c c
  }
}

BassFigures = \figuremode {
  r2 <6\\>8 <6>4.
  r4 <6 4>8 <5 _+> r2
  <4+ _!> <6>
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
