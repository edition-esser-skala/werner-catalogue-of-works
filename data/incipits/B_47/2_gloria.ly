\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace moderato"
    e16 e32 e e16 e e8 r g16 g32 g g16 g g8 r
    c16 c32 c c16 c c8 r g'16 g32 g g16 g g8.\trill a32 h
    c4 r8 g a4 r8 a
    h d c8. c16 h4 r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace moderato"
    c16 c32 c c16 c c8 r e16 e32 e e16 e e8 r
    g16 g32 g g16 g g8 r d'16 d32 d d16 d d8 g
    e4 r8 e c4 r8 f
    d g e8. e16 d4 r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace moderato"
    c16 c32 c c16 c c8 r c16 c32 c c16 c c8 r
    c16 c32 c c16 c c8 r g16 g32 g g16 g g g32 g g16 g
    c4 r8 c16 c c4 r
    g8 g16 g c g c c g4 r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace moderato"
      \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
    c16 c32 c c16 c e g c g e e32 e e16 e g c e c
    g g32 g g16 g c e g e \sbOn \tuplet 3/2 8 { d c d g f g h a h g f g } \sbOff
    c h32 a g16 f e d c h a a'32 b a16 g f e d c
    h! d8 g16 e g8 c16 h d32 c h16 a g f e d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace moderato"
    r2 c16 c32 c c16 c e g c g
    e e32 e e16 e g c e c \sbOn \tuplet 3/2 8 { d c d g f g d c d g f g } \sbOff
    e32 c' h a g16 f e d c h a a'32 g f16 g f e d c
    h! d8 g16 e g8 c16 h d32 c h16 a g f e d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace moderato"
    g'4^\tutti r8 g g e r c'
    c g r e' d4. g8
    e4 r8 e c4 r8 f
    d g e8. e16 d4 r
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra
  pax, pax, pax, pax,
  pax ho -- mi -- ni -- bus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace moderato"
    e4^\tutti r8 e e c r g'
    g e r g g4. g8
    g4 r8 g a4 r8 a
    g g g8. g16 g4 r
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra
  pax, pax, pax, pax,
  pax ho -- mi -- ni -- bus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace moderato"
    c4^\tutti r8 c c g r e'
    e c r c d4 h
    c r8 c a4 r8 d
    h d c8. c16 h4 r
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra
  pax, pax, pax, pax,
  pax ho -- mi -- ni -- bus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace moderato"
    c'4^\tutti r8 c c c, r c'
    c c, r c' h16[ d32 c h16 a] g[ f] e[ d]
    c4 r8 c f4 r8 d
    g h c8. c16 g4 r
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- _ ra
  pax, pax, pax, pax,
  pax ho -- mi -- ni -- bus
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace moderato"
    c'4-\tutti r8 c c c, r c'
    c c, r c' h16 d32 c h16 a g f e d
    c4 r8 c f4 r8 d
    g h c c, g'4 r
  }
}

BassFigures = \figuremode {
  r1
  r
  r
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
        \set Staff.instrumentName = "b"
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
}
