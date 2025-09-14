\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    \tuplet 3/2 4 { cis'8 a dis } \hA \grace dis e2
    \tuplet 3/2 4 { h8 e, dis' } \hA \grace dis e2
    \tuplet 3/2 4 { a8 a, h } cis8.\trill h32( cis) dis8.\trill cis32( \hA dis)
    \tuplet 3/2 4 { e8 gis, h } e,4 r
    fis'16( a8.) gis16( fis8.) e16( dis8.)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    \tuplet 3/2 4 { cis'8 a dis } \hA \grace dis e2
    \tuplet 3/2 4 { h8 e, dis' } \hA \grace dis e2
    \tuplet 3/2 4 { a8 a, h } cis8.\trill h32( cis) dis8.\trill cis32( \hA dis)
    \tuplet 3/2 4 { e8 gis, h } e,4 r
    fis'16( a8.) gis16( fis8.) e16( dis8.)
  }
}
BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    a'4 a a
    gis gis gis
    fis fis fis
    e e e
    d r h'
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  <5>4 <\t> <6\\>
  r2.
  r2 <4>8 <_+>
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
