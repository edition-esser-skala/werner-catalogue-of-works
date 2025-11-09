\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \sbOn c''16.\f c,64 d e16 \tuplet 3/2 16 { e32 d c } g'16. g,64 a h16 \tuplet 3/2 16 { h32 a g } \sbOff c16 c'-! c-! c-! c4~
    c32( h16.) h32( a16.) a32( g16.) g32( f16.) e32( g16.) g32( c16.) e4 \gotoBar "10"
    \sbOn c,16\ff g' \tuplet 3/2 8 { g\trill f g } r d \tuplet 3/2 8 { d\trill c d } \sbOff r e d c \sbOn \tuplet 3/2 8 { h a g a g f }
    e g \tuplet 3/2 8 { g\trill f g } r d \tuplet 3/2 8 { d\trill c d } r g \tuplet 3/2 8 { g\trill f g } c4
    r16 a \tuplet 3/2 8 { a\trill g a } d4 r16 h \tuplet 3/2 8 { h\trill a h } e4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \sbOn c''16.\f c,64 d e16 \tuplet 3/2 16 { e32 d c } g'16. g,64 a h16 \tuplet 3/2 16 { h32 a g } \sbOff c16 e-! e-! e-! g8 a~
    a32( g16.) g32( f16.) f32( e16.) e32( d16.) c32( e16.) e32( g16.) c4 \gotoBar "10"
    \sbOn c,16\ff e \tuplet 3/2 8 { e\trill d e } r h \tuplet 3/2 8 { h\trill a h } \sbOff r c h a \sbOn \tuplet 3/2 8 { g f e f e d }
    c e \tuplet 3/2 8 { e d e } r h \tuplet 3/2 8 { h a h } r4 r16 e \tuplet 3/2 8 { e d e }
    a4 r16 f \tuplet 3/2 8 { f\trill e f } h4 r16 g \tuplet 3/2 8 { g f g }
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "10"
    e'4^\tutti d e r
    c h c8 g c4~
    c8[ a] d4. h8 e4
  }
}

SopranoLyrics = \lyricmode {
    Ky -- ri -- e,
  Ky -- ri -- e e -- lei --
  _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "10"
    g'4^\tutti g g r
    g g g r8 e
    c f r f d g r g
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e,
  Ky -- ri -- e e --
  lei -- son, e -- lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "10"
    c4^\tutti h c r
    e d e r8 g,
    a4. f8 h4. g8
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e,
  Ky -- ri -- e e --
  lei -- _ son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "10"
    c'4^\tutti g c, r
    c' g c, r8 c
    f4. d8 g4. e8
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e,
  Ky -- ri -- e e --
  lei -- _ son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \mvTr c8\f-\solo c' h h, a a' e f
    g4 r8 h, c4 r8 c \gotoBar "10"
    c-\tutti r g' r c, r r4
    c8 r g' r c,4 r8 c
    f4 r8 d g4 r8 e
  }
}

BassFigures = \figuremode {
  r1
  <9 4>8 <8 3>2..
  r
  r
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

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
