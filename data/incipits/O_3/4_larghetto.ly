\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto e sempre piano"
    d'2-\conSord d16( g8.)
    es8( d) d4~ d16( b'8.)
    a16([ g8.) fis16( es!8.) d16( c8.)]
    \tuplet 3/2 4 { b8 a g } g4 r
    f!2~ f16( b8.)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto e sempre piano"
    b'2.-\conSord
    c8( b) b4 b16( g'8.)
    fis16([ es!8.) d16( c8.) b16( a8.)]
    g8 d b4 r
    r d2
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Larghetto e sempre piano"
    r4 g' g,
    r g' g,
    r d' d,
    g g' f!8 es
    d c b4 b'
  }
}

BassFigures = \figuremode {
  r2.
  r
  r4 <_+> <7>
  r2.
  <6>
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
