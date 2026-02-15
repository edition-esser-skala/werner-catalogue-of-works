\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    R1*3
    r2 d'
    b'4 r8 d, d( cis) r a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    g'2 es'4 r8 g,
    g( fis) r d' d( cis) r f,
    f( e) r c' c( h) r es,
    es( d) g2 fis4
    g16 d d'8 c b a16 d, a''8 g f!
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    g8 g'16 f es8 d c es16 d c8 es
    d d' c b a e a h
    c c, e fis g d g, a
    b b' es, d16 c b g b c d8 d,
    g4 r r2
  }
}

BassFigures = \figuremode {
  r1
  <4>8 <_+> <\t> <6> <4> <6\\> <6!> <\t>
  <4> <_!> <6> <\t> <4> <6!> <6-> <\t>
  <4> <3>4. <6>4 <_+>
  r1
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
