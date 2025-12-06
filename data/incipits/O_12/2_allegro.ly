\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Allegro"
    f'8.[ c16 a8. f16 a8. c16]
    f8.[ c16 a8. f16 a8. c16]
    f8 a16 g f8 e16 d c8. b16
    a8. g16 f4 r8 r16 g16\p
    a8. g16 f4 r8 r16 g\f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Allegro"
    a''8.[ f16 c8. a16 c8. f16]
    a8.[ f16 c8. a16 c8. f16]
    a8.[ f16 c8. b16 a8. g16]
    a8. b16 \tuplet 3/2 4 { c8 b c c b c }
    c4\p \tuplet 3/2 4 { c,8 b c c b c }
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Allegro"
    f,8.[ a16 c8. f16 c8. a16]
    f8.[ a16 c8. f16 c8. a16]
    f8.[ g16 a8. b16 c8. c,16]
    f8.[ g16 a8. g16 f8. e16]
    f8.[\p g16 a8. g16 f8. e16]
  }
}

BassFigures = \figuremode {
  r2.
  r
  r4 <6> <8>8. <7>16
  r4 <6>2
  r2.
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
