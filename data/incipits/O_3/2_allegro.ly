\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/8 \tempoMarkup "Allegro"
    g''16. f64 es d16[ c b a]
    g8. fis16 g a
    b16.\trill a64 b c8[-! b]-!
    b-! a-! r
    g16.\p fis64 g a8[-! g]-!
    g fis r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/8 \tempoMarkup "Allegro"
    g''16. f64 es d16[ c b a]
    g8. a16 g fis
    g16.\trill fis64 g a8[-! g]-!
    g-! fis-! r
    b,16.\p c64 d c8[-! b]-!
    b[-! a]-! r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/8 \tempoMarkup "Allegro"
    R4.
    g'16. f64 e d16[ c b a]
    g8-! fis-! g-!
    d d'16.\p c32 b16. a32
    g8-! fis-! g-!
    \kneeBeam d d''16.\f c32 b16. a32
  }
}

BassFigures = \figuremode {
  r4.
  r8. <6>16 q <6\\>
  r8 <5 3>4
  <6 4>8 <5 _+>4
  r8 <5>4
  <6 4>8 <5 _+>4
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
