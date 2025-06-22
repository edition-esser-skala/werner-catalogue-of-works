\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Menuet[to] Cancrizante"
    g'2.
    fis8( g) g( a) a( h)
    g( h) d4 \tuplet 3/2 4 { e8 fis g
    fis e d c h a } h4
    h \tuplet 3/2 4 { a8 h c d e fis }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Menuet[to] Cancrizante"
    g'2.
    fis8( g) g( a) a( h)
    g( h) d4 \tuplet 3/2 4 { e8 fis g
    fis e d c h a } h4
    h \tuplet 3/2 4 { a8 h c d e fis }
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Menuet[to] Cancrizante"
    g4 h8 d g4
    d d' c
    \tuplet 3/2 4 { h8 a g } fis4 e
    d fis g~
    g fis d
  }
}

BassFigures = \figuremode {
  r2.
  r2 <6>4
  q q <3>
  r2.
  r4 <6>2
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
