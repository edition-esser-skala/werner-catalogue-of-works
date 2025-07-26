\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/8 \tempoMarkup "Vivace"
    d''8. cis32 h a16 g
    f e d c! b! a
    g f e d cis b!
    a4 r8
    b'!4.
    cis,16 d d4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/8 \tempoMarkup "Vivace"
    d''8. cis32 h a16 g
    f e d c! b! a
    g f e d cis b!
    a4 r8
    r \tuplet 3/2 8 { e'16 d e cis[ h? \hA cis] }
    a4.
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/8 \tempoMarkup "Vivace"
    d16 e f8 cis
    d d'16-! c!-! b-! a-!
    g f e d cis b!
    a a'\p a a a a
    a( g) g g g g
    g( f) f f f f
  }
}

BassFigures = \figuremode {
  r8 <6> q16 <5>
  r4.
  r
  r8 <_+>4
  r16 <6 4\+ _-> r4
  <4\+ 2>16 <6> r4
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
