\version "2.24.2"
\include "header.ly"

Clarino = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    r4 r8 g' c16 d e f \tuplet 3/2 8 { \sbOn g a g f e d }
    e8 c r g' a16 h \tuplet 3/2 8 { c h a } \grace g f8.\trill e16 \sbOff \gotoBar "6"
    e16 d c d d8.\trill c16 c4 r
    R1
    r8 c4 d e f8
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    R1*2 \gotoBar "6"
    R1*2
    r16 g''\f g,16. c32 a16. a'32 a,16. d32 h16. h'32 h,16. e32 c16. c'32 c,16. f32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    R1*2 \gotoBar "6"
    R1*2
    r16 g''\f g,16. c32 a16. a'32 a,16. d32 h16. h'32 h,16. e32 c16. c'32 c,16. f32
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "6"
    r2 r8 g'^\solo c e
    a, f'16 d h8 a16 h c[ d e f] \sbOn \tuplet 3/2 8 { g[ a g f e d] } \sbOff
    e8 c r4 r2
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae -- ta -- _
  _ re,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'8-\solo c,16. d32 e8 g e c h g
    c e16. d32 e8 c f e d g  \gotoBar "6"
    c, f g g, c c'16. g32 e8 c
    f d g f e c h g
    c e f f, g g' a, a'
  }
}

BassFigures = \figuremode {
  r1
  r2. <7>8 q
  r4 <4>8 <3> r2
  r1
  r4. <6>8 <5> <6> <5> <6>
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = \transposedNameShort "clno" "C" ""
      \Clarino
    }
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
    \new PianoStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
