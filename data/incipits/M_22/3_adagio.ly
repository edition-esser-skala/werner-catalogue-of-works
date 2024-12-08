\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'8( es) b!4 \tuplet 3/2 4 { f8( g as) }
    as( g) g'4 f\trill
    e2 f8( g)
    c,4 as' g
    fis2 g8( a)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    es4\fE f8( b!) d( f)
    b,2.~
    b4 c8 b as g
    as b c2~
    c4 d8 c b a
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4 d2
    es4 es' des
    c c,2
    f es!4
    d2.
  }
}

BassFigures = \figuremode {
  r4 <6-> <5>
  <4->8 <3>4. <6 3>4
  <7 _!> <_!>8 <7 \t> <6-> <5>
  <_->2 <6 3>4
  <7 _+>2.
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
