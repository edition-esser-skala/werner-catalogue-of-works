\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Cantabile"
    c'4. d16 e d4
    g8( g,) \grace g f2
    e4 e'2
    d8( e) \grace d c2\trill
    h4 c8.\trill h32( c) d4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Cantabile"
    c'4. d16 e d4
    g8( g,) \grace g f2
    e4 e'2
    d8( e) \grace d c2\trill
    h4 c8.\trill h32( c) d4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Cantabile"
    c4 c' h8 g
    e4 a h
    c2 c,4
    d e fis
    g e h
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r q <\t>
  r2.
  r4 <6> <\t>
  r <6> q
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
