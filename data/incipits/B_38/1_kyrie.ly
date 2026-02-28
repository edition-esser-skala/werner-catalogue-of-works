\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \pa e'4~ e8 e16. f32 \pd g8 g r g
    \pa a a g8.\trill g16 \pd g8 r r d \gotoBar "9"
    \pa e8 g~ g4 \pd g8 e r g
    \pa a16(\trill g a8) r a h16(\trill a h8) r h
    c h16 a g8 g \pd g e r4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'4. c8 c c r e
    c f e d e r r g, \gotoBar "9"
    c8 e d16 c d8 c c r c
    c4 d16( c) d8 r d e16 d e8
    r e d d e c r4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8. c32 c c8 c c c r c16 c
    c8 r g8. g32 g c8 r r g \gotoBar "9"
    c8. c32 c g8 g c c r c16 c
    c8 c r4 g8 g r g
    c c g g16 g c8 c r4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \sbOn c''16.\ff c,32 c( d64 e f g a h) c16. c,32 c( d64 e f g a h) \sbOff c16. c,32 c8 r16 g c e
    a,( a') a( g) g( f) f( e32 d) e16(\p a) a( g) g( f) f( e32 d) \gotoBar "9"
    c,4 r \sbOn c''16. c,32 c( d64 e f g a h) c16. c,32 c64( d e f) g16 \sbOff
    a16. f,32 f8\trill f'16. d,32 d8\trill h''16. g,32 g8\trill g'16. h,32 h8\trill
    c16 c' h a g d g f e32 c d e f g a h c a, h c d e f g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \sbOn c''16.\ff c,32 c( d64 e f g a h) c16. c,32 c( d64 e f g a h) \sbOff c16. c,32 c8 r16 g c e
    a,( f') f( e) e( d) d( c32 h) c16(\p f) f( e) e( d) d( c32 h) \gotoBar "9"
    c,4 r \sbOn c''16. c,32 c( d64 e f g a h) c16. c,32 c64( d e f) g16 \sbOff
    a16. f,32 f8\trill f'16. d,32 d8\trill h''16. g,32 g8\trill g'16. h,32 h8\trill
    c16 c' h a g d g f e32 c d e f g a h c a, h c d e f g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "9"
    c'8.^\tutti e16 d8 d e e r c
    c4 d2 e4~
    e8[ f d g] e4 r8 e
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ _
  son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "9"
    g'8.^\tutti g16 g8 g g g r g
    a f4 a8 h g4 h8
    c8.[ h32 a] g4 g8 e4 a8~
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- _ son, e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "9"
    e8.^\tutti e16 d8 h c c r e
    a,4. d8 h4. e8
    c4 d8[ h] g4 r8 c
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ son, e --
  lei -- _ son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2 \gotoBar "9"
    c8^\tutti c' h g e c r e
    f[ a] d, f g[ h] e, g
    a[ a, h g] c c' a4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- "lei -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\solo c' a, a' e, e'16. d32 e8 c
    f d g g, c r r g\p \gotoBar "9"
    c-\tutti c' h g e c r e
    f a d, f g h e, g
    a a, h g c4 a'
  }
}

BassFigures = \figuremode {
  r1
  r4 <6 4>8 <5 3>2 <7>8
  r1
  r4. <6>8 r2
  <5>8 <6>2..
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
      \Timpani
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
