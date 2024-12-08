\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Largo"
    e'4 c'8( h) a( gis)
    a( e) e2~
    e8 a, e'( g!) f( e)
    f2.~
    f8 d h( a) g( f)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Largo"
    R2.
    e4 c'8( h) a( gis)
    a2.~
    a8 d, a' c! h a
    h2 h'4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Largo"
    a'4 a, h
    c a h
    c cis a
    d2.
    g4 g,2
  }
}

BassFigures = \figuremode {
  r2 <6\\>4
  <6>2 <6\\>4
  <6>2.
  r2 <6>8 <5>
  <7>4 <\t>2
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
