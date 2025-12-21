\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    R1*2 \gotoBar "7"
    c'4 r r2
    r r8 c4\p h8
    c g16 g' g( f) f( e) d( fis,) g8 r4
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'2\f \sbOn \tuplet 3/2 8 { e16 d c } h a \tuplet 3/2 8 { c h a } g f \sbOff
    e8 c g''8.\trill f32 e d16( fis,) g( h) c( e,) fis( a) \gotoBar "7"
    c4 r r2
    r r8 c4\p h8
    c g16( g') g( f) f( e) d( fis,) g8 r4
    R1
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "7"
    c'2^\solo \sbOn \tuplet 3/2 8 { e16[ d c } h a] \tuplet 3/2 8 { c[ h a } g f]
    e8 c c'8.[\trill h32 a] g8 f16[ e] f4\trill
    e r r2
    R1
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _ _
  _ ve, sal -- ve Re -- gi --
  na,
}

Alto = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "7"
    R1*2
    r2 g'^\solo
    \sbOn \tuplet 3/2 8 { h16[ a g } fis e] \tuplet 3/2 8 { g16[ \hA fis e } d c] \sbOff h8 g g'8.[ f16]
  }
}

AltoLyrics = \lyricmode {
  Sal --
  _ _ _ ve, "sal -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c8-\solo d e f e f g g,
    c d e c h e a, d \gotoBar "7"
    c d e f g c, g' g,
    c d e f e a d, g
    c, e d c h g'16 a h8 c
    h c d d, g a h g
  }
}

BassFigures = \figuremode {
  r2. <4>8 <3>
  r2. <7>8 <_+>
  r2. <4>8 <3>
  r2 r8 <7> q q
  r1
  r4 <4>8 <_+> r2
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

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
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
