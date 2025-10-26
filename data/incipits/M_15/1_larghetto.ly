\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    h'8.\trill c32 d a4 r8 d
    h g'16( fis) g4\trill r8 d\p
    e16( fis) g8 g32( fis16.) fis32( e16.) e32( d16.) d32( c16.)
    c8( h) h4 g'8(\f e)
    cis( d) e4 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'8. a32 h fis4 r8 fis
    g( h) d4\trill r8 g,\p
    g( e') e32( d16.) d32( c16.) c32( h16.) h32( a16.)
    a8(\trill g) g( h) h(\f g)
    e4 a fis\trill
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    g4 d' r8 h
    e4 h r8 h\p
    c4 r r8 d
    g,4 g' e\f
    a cis, d
  }
}

BassFigures = \figuremode {
  r2.
  r4 <6>2
  r2.
  r
  <_+>
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
