\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g16\ff g32 g g16 h g d' h g'32( d) h16 h32 h h16 d h g' d h'32 g
    d16 d32 d d16 g d h' g d'32( h) g g' g g g g g g fis16-! g-! fis-! e-!
    d32 c' c c c c c c h16-! c-! h-! a-! \sbOn g16.\trill fis64( g) g16. h32 g16.\trill fis64( g) g16. h32
    gis16.\trill fis64( \hA gis) gis16. h32 \hA gis16.\trill fis64( \hA gis) gis16. h32 a16.\trill gis64 a a16. c32 a16.\trill \hA gis64 a a16. c32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r2 g16\ff g32 g g16 h g d' h g'32( d)
    h16 h32 h h16 d h g' d h'32( g) d g' g g g g g g fis16-! g-! fis-! e-!
    d32 c' c c c c c c h16-! c-! h-! a-! g16. d32 h16. d32 \sbOn h16.\trill a64( h) h16. d32
    h16.\trill a64( h) h16. d32 h16.\trill a64 h h16. d32 \sbOff e e e e e e e e e e e e e e e e
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    h4\ff r d r
    g r h8 r16 g fis-! g-! fis-! e-!
    d8 r16 c' h-! c-! h-! a-! g32 d d d d d d d d d d d d d d d
    e e e e e e e e e e e e e e e e a a a a a a a a g! g g g e e e e
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g4\ff r g r
    g r g8 r16 g' fis-! g-! fis-! e-!
    d8 r16 c' h-! c-! h-! a-! g32 g g g g g g g f f f f f f f f
    e e e e e e e e d d d d d d d d c c c c c c c c cis cis cis cis cis cis cis cis
  }
}

BassFigures = \figuremode {
  r1
  r
  r2. <4 2>4
  <_+> <4\+> <6> <6\\>
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
