\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \dorian \time 4/4 \tempoMarkup "Allegro"
    \partial 8 f'8~
    f e f c16 d es8 es r es~
    es d es b16 c des8 des r des
    c b16 as b8 c as16 c e, g f as g b
    as c e, g f as g b as8 g16 f as8. as16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \dorian \time 4/4 \tempoMarkup "Allegro"
    \partial 8 r8
    R1*3
    r2 r4 r8 c'
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \dorian \time 4/4 \tempoMarkup "Allegro"
    \partial 8 r8 r4 as'4. g16 f g8 a
    b4 g4. f16 es f8 g
    as! g16 f g8 e f g as e
    f g as e f4. es16 d
  }
}

BassFigures = \figuremode {
  r8 r4 <6> <5 2> <6>8 <\t>
  <4> <3> <6>4 <5- 2-> <6->8 <\t>
  r4. <6>4 <6!>8 <6> r
  r <6!> <6> r r2
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
