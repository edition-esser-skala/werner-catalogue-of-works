\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \dorian \time 3/8 \tempoMarkup "Allegro"
    R4.*6
    d'16 e f g e f
    d e f8 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \dorian \time 3/8 \tempoMarkup "Allegro"
    g'16 a b c a b
    g a b8 r
    a16 b c d b c
    a b c8 r
    b a d~
    d cis16 d e8
    a, d c
    b a h
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \dorian \time 3/8 \tempoMarkup "Allegro"
    R4.*8
  }
}

BassFigures = \figuremode {
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
