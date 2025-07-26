\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Vivace"
    r8 d''16. a32 f8. a32( f) d8. f32( d)
    a8 f'16.( d32) a8. d32( a) f8. a32( f)
    d8 f'16\p g a32( g f g) a8 a32( g f g) a8
    r8 g,16 a b32( a g a) b8 b32( a g a) b8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Vivace"
    r8 f' d8. f32( d) a8. d32( a)
    f8 f'16.( d32) a8. d32( a) f8. a32( f)
    d8 d'16\p e f32( e d e) f8 f32( e d e) f8
    r e,16 f g32( f e f) g8 g32( f e f) g8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Vivace"
    d4 r r
    d8.\f d'16 a8. d32( a) f8. a32( f)
    d32\ff d d d d d d d d d d d d d d d d d d d d d d d
    cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis cis
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <5 3>4 <7- 5 3> <\t \t \t>
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
