\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \dorian \time 3/4 \tempoMarkup "Adagio"
      \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    c'4 d! e
    f g as8( h,)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \dorian \time 3/4 \tempoMarkup "Adagio"
      \override Staff.TimeSignature.style = #'single-digit
    f4 g a
    b c des8( e,)
    f( b) as!4 g\trill
    f b as8 g
    as4 c, r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \dorian \time 3/4 \tempoMarkup "Adagio"
      \override Staff.TimeSignature.style = #'single-digit
    f4 e es
    des a b8 c
    des4 c c'8 b
    as4 g2
    f4 e f8 g
  }
}

BassFigures = \figuremode {
  r4 <6> <4!>
  <6> q <_->8 <_!>
  <6>4 <6- 4> <5 _!>
  r <5!> <6!>
  r r4. <_!>8
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
