\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/8 \tempoMarkup "Allegro assai"
    g''4.
    a8( h c)
    c( h a)
    g4.~
    g8 a d,~
    d g c,~
    c f e
    d4 r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/8 \tempoMarkup "Allegro assai"
    e'8 d c
    c4 a'8
    d,4 h'8
    c4 r8
    a,4 f'8
    g,4 e'8
    a,( h c)
    h4 a8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 3/8 \tempoMarkup "Allegro assai"
    c8 d e
    f4 r8
    g4 f8
    e( d c)
    f4.
    e
    d4 c8
    g' g, a
  }
}

BassFigures = \figuremode {
  r4.
  r
  r
  r
  <7>8 <6>4
  <7>8 <6>4
  <7>8 <6>4
  r4.
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
