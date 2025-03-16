\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "[no tempo]"
    d'2 \tuplet 3/2 4 { es8 d c }
    \grace c b2 a4
    d,16([ fis8.) a16( c8.)] \tuplet 3/2 4 { es8 d c }
    \grace c b2 a4
    g \tuplet 3/2 4 { g8 a b b c d }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "[no tempo]"
    d'2 \tuplet 3/2 4 { es8 d c }
    \grace c b2 a4
    d,16([ fis8.) a16( c8.)] \tuplet 3/2 4 { es8 d c }
    \grace c b2 a4
    g \tuplet 3/2 4 { g8 a b b c d }
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "[no tempo]"
    r4 g' fis
    g g, d'
    r fis d
    g g, d'
    r es d
  }
}

BassFigures = \figuremode {
  r2 <6>8 <5>
  r2 <_+>4
  r2 <_+>4
  <_->2 <_+>4
  r2 <6>4
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
