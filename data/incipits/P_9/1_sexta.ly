\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro non troppo"
    d'16( g) h4 c8
    d g,4 \tuplet 3/2 8 { a16 h c }
    h8 g, r c\p
    d g,4 \tuplet 3/2 8 { a16 h c }
    h8 g, r \tuplet 3/2 8 { g''16\f a h }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro non troppo"
    h'8 g'4 fis16 e
    d8 e d fis,
    g d'16(\p c) c( h) h( a)
    g8 e' d fis,
    g d g\f h
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro non troppo"
    g'8 g, g' a
    h c h a
    g h16 a g8 a
    h c h a
    g h16 a h8 g
  }
}

BassFigures = \figuremode {
  r2
  r4. <6>8
  r2
  r4. <6>8
  r2
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
