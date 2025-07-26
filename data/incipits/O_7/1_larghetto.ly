\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    \grace { f'16[ g] } a2 a16( gis) e4.
    \grace { e,16[ f] } g!2\p g16( f) d4.
    a''8.\trill\f b32 c d16 d, c'8 \grace c b4 r
    g,8.\trill a32 b c16 c, b'8 \grace b a4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    \grace { d'16[ e] } f2 f16( e) cis4.
    \grace { cis,16[ d] } e2\p e16( d) f4.
    r8 f\f f'16 f, e'8 d4 r
    r8 c,\p e g g16( e) f8 r4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    \grace s8 r8 d d' d, r a' a, a'
    r a,\p a' a, r d d, d'
    r2 r8 g,\f g'16 g, f'8
    e4 r r8 f,\p a c
  }
}

BassFigures = \figuremode {
  r2 r8 <_+>4.
  r8 q2 <_!>4.
  r1
  <6>
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
