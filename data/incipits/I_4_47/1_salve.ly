\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Ariose"
    b'8.\p a32 g f8 g
    f b, r a'
    \sbOn \tuplet 3/2 8 { b16 c d d es f } \sbOff \appoggiatura f8 es4\trill
    d f32 d16. c32 b16.
    c32 a16. g32 f16. d'32 b16. a32 g16.
    a8 f r16 d' \tuplet 3/2 8 { b'[ a g] }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Ariose"
    b'8.\p a32 g f8 g
    f b, r a'
    \sbOn \tuplet 3/2 8 { b16 c d d es f } \sbOff \appoggiatura f8 es4\trill
    d f32 d16. c32 b16.
    c32 a16. g32 f16. b32 g16. f32 e16.
    \sbOn f16 a \tuplet 3/2 8 { c b a } d8 \tuplet 3/2 8 { d16 c b }
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key b \major \time 2/4 \tempoMarkup "Ariose" \autoBeamOff
    b'4.^\solo \tuplet 3/2 8 { c16[ b a] }
    b4 \tuplet 3/2 8 { \sbOn b16[ c d c b a] \sbOff
    b[ c d] d[ es f] } \appoggiatura f8 es4\trill
    d f
    f16([ c)] b([ a)] b4
    a8 c d4
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _
  _ _
  ve Re -- gi --
  na, sal --
  ve ma --
  _ ter mi -- "se -"
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Ariose"
    b8-\solo c d es
    d g f es
    d b g a
    b c d b
    a d g, c
    f, a b g'
  }
}

BassFigures = \figuremode {
  r4 <6>8 q
  q4 <6 4>8 <6>
  <6>4 q
  r2
  r8 <7> q <7 _!>
  r2
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
