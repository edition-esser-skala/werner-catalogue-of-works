\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "[no tempo]"
    a''4. g16( f) e4
    f8( d) \grace d cis2
    a4.\p g16( f) \tuplet 3/2 4 { e8 f g
    f e d } \grace d cis2
    d16(\f c'!8.) c16( b8.) a'16( c,8.)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "[no tempo]"
    a''4. g16( f) e4
    f8( d) \grace d cis2
    a4.\p g16( f) \tuplet 3/2 4 { e8 f g
    f e d } \grace d cis2
    d16(\f c'!8.) c16( b8.) a'16( c,8.)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "[no tempo]"
    d8 e f4 cis
    d a' g
    f8 e d4 cis
    d a' g
    fis\f g  \hA fis
  }
}

BassFigures = \figuremode {
  r4 <6> q
  r <_+> <\t>
  <6>2 q4
  r <_+>2
  <6>4 <_->2
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
