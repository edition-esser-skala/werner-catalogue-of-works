\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Molto allegro"
    f'32( e) f8. a32( g) a8.
    f4. e16 d
    c8 b a b
    c b a4
    c8\p b a b
    c b a4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Molto allegro"
    a'32 g a8. c32 b c8.
    a8 f16 g a8 b
    a g f g
    a g f4
    a8\p g f g
    a g f4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Molto allegro"
    f8 f f f
    f f f f
    f g a g
    f g a g
    f\p g a g
    f g a g
  }
}

BassFigures = \figuremode {
  r2
  r
  r4 <6>
  r q
  r2
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
