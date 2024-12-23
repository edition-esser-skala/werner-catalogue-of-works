\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Spirituoso"
    e'8.\f\trill d32 c h16 fis dis h \tuplet 3/2 8 { g' fis e } e8 g4 \gotoBar "5"
    e4 r r8 h''16(\p g) e4~
    e8 \tuplet 3/2 8 { a16 g fis } e8 dis e16 e,32 fis g16 a \tuplet 3/2 8 { \sbOn h a h c d e \sbOff }
    d4 r r16 h d g h a h8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Spirituoso"
    e'8.\f\trill d32 c h16 fis dis h \tuplet 3/2 8 { g' fis e } e8 g4 \gotoBar "5"
    e4 r r8 h''16(\p g) e4~
    e8 \tuplet 3/2 8 { a16 g fis } e8 dis e16 e,32 fis g16 a \tuplet 3/2 8 { \sbOn h a h c d e \sbOff }
    d4 r r16 g, h d g fis g8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Spirituoso"
    R1 \gotoBar "5"
    e'8.[\trill^\solo d32( c)] h8. a16 \tuplet 3/2 8 { g[ fis e] } e8 r e'
    c8.[\trill h32( a)] g8 fis \tuplet 3/2 8 { g16[ fis e] } e8 r4
    g'8.[\trill fis32( e)] d8. c16 \tuplet 3/2 8 { h[ a g] } g8 d' g
  }
}

SopranoLyrics = \lyricmode {
  Be -- _ ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit,
  be -- _ ne -- di -- ctus, qui "ve -"
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "Spirituoso"
    e8-\solo g dis h e g16 fis e8 h \gotoBar "5"
    e g dis h e g c g
    a a, h4 e,8 e' d! c
    h16 e d c h8 fis g g' g16 d h g
  }
}

BassFigures = \figuremode {
  r1
  r
  r4 <6 4>8 <5 _+>4. <6>8 q
  q2 r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
