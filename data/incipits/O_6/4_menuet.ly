\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "[no tempo]"
    h'8( cis) d( \hA cis) d4
    d,2.\trill
    e'8( fis) g( fis) g4
    g,2.\trill
    a'8 h c4 a
    g( fis) e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "[no tempo]"
    h'8( cis) d( \hA cis) d4
    d,2.\trill
    e'8( fis) g( fis) g4
    g,2.\trill
    a'8 h c4 a
    g( fis) e
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "[no tempo]"
    g'4 g g
    fis fis fis
    e e e
    h h h
    c2 r4
    h2 c4
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  r
  q
  q
  q4 <5> <3>
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
