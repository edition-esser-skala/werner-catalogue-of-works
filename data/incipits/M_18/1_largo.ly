\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \dorian \time 3/2 \tempoMarkup "Largo"
    d'4( g,) g2 r
    es'4( g,) g2 r
    a'4( d,) b'2. b,4
    a2 fis4. g8 a b c d
    b2 d4. c8 h a g f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \dorian \time 3/2 \tempoMarkup "Largo"
    b'2 r4 g b c8 d
    g,2 r4 g es' c
    d2 d4( d,) e!2
    fis d'4( d,) d2
    r h'4( d) g2
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \dorian \time 3/2 \tempoMarkup "Largo"
    g'2 b4. a8 g f es d
    c2 es'4. d8 c b a g
    fis2 g cis
    d4( d,) d2 r
    g4( g,) g2 r
  }
}

BassFigures = \figuremode {
  r1.
  r2 <6>1
  <6> <7 5>2
  <_+>1.
  <_->2 <_!>1
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
