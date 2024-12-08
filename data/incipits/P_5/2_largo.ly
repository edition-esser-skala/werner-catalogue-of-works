\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
    b'2.~
    b4 a \tuplet 3/2 4 { c8 d es }
    d2.~
    d4 c b'!
    a2.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
    g'2.~
    g4 fis8 e fis4
    g g' f!
    es!2 d4
    cis4. d8 e4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Largo"
    g'4 f es
    d2 c4
    b h2
    c r4
    r a' g
  }
}

BassFigures = \figuremode {
  <\l \l>2 \once \bassFigureExtendersOn q4
  <6 4> <5 _+> <\t \t>
  <6> <\t> <5!>
  <9> <8>2
  r4 <_+> <6!>
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
