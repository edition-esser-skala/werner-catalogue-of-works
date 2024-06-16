\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f'4 c~
    c8 c' b a
    g4 c,~
    c8 b' a g
    a4 f,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    a'8 c16 b a8 g
    f4 d'
    e,8 f g a
    g4 e'
    c8 b c d
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f8 g a b
    a4 b
    << { c s } \\ { c,8 d e f } >>
    e4 c
    f8 g a b
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
