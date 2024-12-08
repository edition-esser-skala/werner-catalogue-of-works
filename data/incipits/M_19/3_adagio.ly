\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \dorian \time 3/2 \tempoMarkup "Adagio"
    f'2 b,2. c4
    des2. es4 c2
    f4( des) b2 es~
    es2. f4 des2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \dorian \time 3/2 \tempoMarkup "Adagio"
    as'1 g2
    f g as2~
    as1 g2
    a4( c) b( a) b2
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \dorian \time 3/2 \tempoMarkup "Adagio"
    f2 es1
    b2 es f
    des es1
    f2 f, b
  }
}

BassFigures = \figuremode {
  <_->2 <5 4> <\t 3>4 <6 \t>
  <_->2 <7-> <5>
  <6 5> <4> <3>
  <7 _!>1 <_->2
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
