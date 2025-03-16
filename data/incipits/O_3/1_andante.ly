\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante non troppo"
    d'4.\f g16 g, g8( fis) r fis'\p
    g16 f32 es d16 c b8 a16.\trillE g32 g4 r
    a'8.\f\trill g32 a b16( b, es8) es( d) r4
    c8.\p d32 es f16 f, es8 es( d) r c'~\f
    c16 h as'8( g) \hA h, c16( \hA h) c8 r d~\p
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante non troppo"
    r8 b'16(\f a) a8 g16( cis) d8 es16(\p d) d( d,) c'8
    b a g fis16.(\trill g32) g4 r
    a'8.\f\trillE g32 a b16( b, es8) es( d) r4
    a8.\pE b32 c b16( a) a8 b b, r4
    r8 h'16(\f c) c( d) d( es) es( d) es8 r4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Andante non troppo"
    g8 g' f es d c b a
    g\p c d d, g b'\f a g
    f es d c b\p b' a g
    f es d c b f'\f b as
    g f es d c g' c b\p
  }
}

BassFigures = \figuremode {
  r4. <3>16 <6\\> <4> <_+> <\tllur>8 <6> <6\\>
  r <6 5> <6 4> <5 _+> r2
  <3>8 <\t> <6> q <4> <3>4.
  <3>8 <\t> <6> q r2
  <_!>8 <\t> <6> <6!> r2
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
