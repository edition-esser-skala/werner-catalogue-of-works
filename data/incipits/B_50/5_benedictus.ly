\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Larghetto"
    r2 r8 f'16\p c \tuplet 3/2 8 { c b a } a8
    \sbOn \tuplet 3/2 8 { d16 c b a g f e d c b a g } \sbOff a4 r8 c'~
    c g'16( f) e\trill d c8~ c h16 a \hA h4\trill
    c8 r g16( h) d( f) e8 r g,,16( h) d( f)
    e8 r g'16( d) h( g) c,8 r r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Larghetto"
    r2 r8 a'\p \tuplet 3/2 8 { a16 g f } f8~
    f d g, c a4 r8 f'
    e4 a d,4. d8
    c16( e) g( c) d8 r c,16( e) g( c) d8 r
    c16( g) e( c) d8 r r2
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    c16[^\solo f] a[ c] c,[ e] g b \tuplet 3/2 8 { a[ g f] } f8 r c
    \sbOn d16[ b' \tuplet 3/2 8 { a g f] e[ d c b a g] } \sbOff a8 c f16[ a] a c
    g8.[\trill a32 h] c8 a \grace g f4.\trill f8
    e c g'2.~
    g4~ g8.[ a32 h] c16[ g] a[ c,] \grace e8 d8.\trill c16
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui ve -- nit, qui
  ve -- _ nit, qui ve -- nit in
  no -- mi -- ne Do -- mi --
  ni, in no --
  mi -- ne Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Larghetto"
    f,8-\solo f' e c f4 r8 f
    b,4 c f, r
    R1
    r8 c'' h g r c, h g
    r c' h g e f g g,
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r2. <6 4>8 <5 _!>
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
