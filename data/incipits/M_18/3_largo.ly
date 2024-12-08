\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \dorian \time 3/4 \tempoMarkup "Largo"
    d'4 es r8 es
    es( cis) d4 r
    a' b r8 b
    b( a) a4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \dorian \time 3/4 \tempoMarkup "Largo"
    b'8 g b4 r8 b
    a2 r4
    fis' g r8 g
    g4 fis r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \dorian \time 3/4 \tempoMarkup "Largo"
    g4 g' r8 g
    fis2 r4
    d d' r8 d
    cis4 d r
  }
}

BassFigures = \figuremode {
  <5>4 <6->4. <\t>8
  <7->4 <6>2
  <_+>4 <6 4>4. <\t \t>8
  <7 5>4 <_+>2
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
