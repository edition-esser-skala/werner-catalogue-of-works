\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    r8 a'\p b c
    \sbOn \tuplet 3/2 8 { d16 c b f' es d } c4 \sbOff
    R2
    r4 a'32( f16.) f32( c16.)
    a4 \tuplet 3/2 8 { a'16 g f } f8
    r4 \tuplet 3/2 8 { g,16 f e } e8
    r16 f' e( f) r f, e( f)
    \sbOn \tuplet 3/2 8 { e16\f-! c-! e-! g-! e-! g-! c-! g-! c-! e-! c-! e-! \sbOff }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    r8 f\p g a
    \sbOn \tuplet 3/2 8 { b16 c d d c b } a4 \sbOff
    R2
    r4 f'32( c16.) c32( a16.)
    f4 \tuplet 3/2 8 { c'16 b a } a8
    r4 \tuplet 3/2 8 { e16 d c } c8
    r16 d' c( d) r h a( h)
    \tuplet 3/2 8 { \sbOn c16\f e, c e c e g e g c g c \sbOff }
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 2/4 \tempoMarkup "Allegro" \autoBeamOff
    c'2^\solo
    d8.[\trill e32 f] c4
    r8 f, \tuplet 3/2 8 { g16[ a b] a[ b c] }
    b4\trill a
    \tuplet 3/2 8 { a16[ b c] } c4 \tuplet 3/2 8 { f16[ e d] }
    c8[ g] e[ c]
    h'4. h8
    c4 r
  }
}

SopranoLyrics = \lyricmode {
  Sal --
  _ ve,
  sal -- ve Re --
  gi -- na,
  ma -- ter mi --
  se -- ri --
  cor -- di --
  ae,
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f,4\p r
    b f'8 f,
    g a b c
    d e f f,
    f f' f f
    e e e e
    d d d d
    c4 r
  }
}

BassFigures = \figuremode {
  r2
  r
  <6>8 q q q
  q2
  r
  r
  <6!>
  r
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
