\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    R1*4
    e'8 g4 g8 a8. a16 a4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    R1*4
    c'8 e4 e8 c8. c16 c4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    R1*4
    c8. c32 c c16 c c c c8. c32 c c4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r16 c' c16. e32 e16. g32 g16. c32 c4 r
    r16 f,, a16. c32 e16. g32 f16. e32 f4~ f16. f32 e16. d32
    e8.\trill d32( e) f16. c32 a16. f32 \sbOn d'16. f,32 \tuplet 3/2 8 { f16\trill e f } d'16. f,32 \tuplet 3/2 8 { f16\trill e f } \sbOff
    e( c') h( d) c( f) e( a) \sbOn g( c) c32( h) h( a) a( g) g( f) f( e) e( d) \sbOff
    c16-! g'-! e-! c-! g-! c-! g-! e-! r a'-! f-! c-! a-! c-! a-! f-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r2 r16 e e16. a32 a16. c32 c16. f32
    f4 r r16 d, f16. a32 b4~
    b16. b32 a16. g32 a4( as8) as as as
    g16( e) d( f) e( a) g( f) \sbOn e( e') e32( d) d( c) c( h) h( a) a( g) g( f) \sbOff
    e16-! e'-! c-! g-! e-! g-! e-! c-! r c'-! a-! f-! c-! f-! c-! a-!
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'2^\tutti c
    c4 cis d2
    e4 f4. d8 f4
    e8 r r4 r2
    r8 c4 c8 c8. c16 c4
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- _ ctus,
  san -- _ _ _
  ctus,
  san -- ctus Do -- mi -- nus,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e2.^\tutti f4
    a g f2
    g4 a as2
    g8 r r4 r2
    r8 e4 e8 f8. f16 f4
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- _ ctus,
  san -- ctus, san --
  ctus,
  san -- ctus Do -- mi -- nus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g2^\tutti a4 c~
    c e a, b~
    b a d4. h8
    g8 r r4 r2
    r8 g4 g8 a8. a16 a4
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san --
  ctus, san -- _
  ctus, san -- _
  ctus,
  san -- ctus Do -- mi -- nus,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c4^\tutti c' a4. a8
    f4 e d2
    c4 f h,!2
    c8 r r4 r2
    c4. c8 f8. f16 f4
  }
}

BassoLyrics = \lyricmode {
  San -- ctus, san -- ctus,
  san -- _ _
  _ ctus, san --
  ctus,
  san -- ctus Do -- mi -- nus,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c2-\tutti a4 a'
    f e d2
    c4 f h,!2
    c2.-\tasto r4
    c4.-\tutti c8 f4 f,
  }
}

BassFigures = \figuremode {
  r2 <5>4 <6>
  r <6\\> <8 5> <\t 6->
  <7->2 <7- 5>
  r1
  r
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
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
