\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'16. f32 g8 g e r g g e
    r \pa e16 f g8 g g g g fis
    g d d d \pd r \pa d d d \pd
    r \pa e f! g \pd a h c g
    g g4 e8 \pa e4. c8
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'16. d32 e8 e c r e e c
    r c d d e8. d16 c8 c
    d g,16 g g8 g r g16 g g8 g
    r c4 e8 c f e d
    e e4 c8 c4 r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8. c32 c c8 c r c16 c c8 c
    r c g g16 g c4 r
    r8 g16 g g8 g r g16 g g8 g
    c8. c32 c c4 r r8 g
    c c16 c c8 c r c16 c c8 c
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'16.\trill d64( e f32 g a h) c16 g e g c,16.\trill d64( e f32 g a h) c16 g e g
    c, c32 d e16 f \sbOn g a h16.\trill a64( h) \sbOff c16 d e d c8.\trill h32 a
    h16 d g, h d, g h, d g, h' g h d, g h, d
    e8.\trill d32 e f16 a g c \sbOn \tuplet 3/2 8 { a h c h c d } c16. h64 a g16 f \sbOff
    e e8 e16 e e e e c c8 c16 c c c c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'16.\trill d64( e f32 g a h) c16 g e g c,16.\trill d64( e f32 g a h) c16 g e g
    c, c32 d e16 f \sbOn g a h16.\trill a64( h) \sbOff c16 d e d c8.\trill h32 a
    h16 d g, h d, g h, d g, h' g h d, g h, d
    e8.\trill d32 e f16 a g c \sbOn \tuplet 3/2 8 { a h c h c d } c16. h64 a g16 f \sbOff
    e e8 e16 e e e e c c8 c16 c c c c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e'4^\tutti r8 g g e r g
    g e r h c16[ d] e[ d] c8.\trill c16
    h4 r8 d d h r d
    e, e r g a h c d
    e e4 e8 c4. c8
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra, ter -- ra
  pax, in ter -- ra, in
  ter -- ra pax, pax ho -- mi -- ni --
  bus bo -- nae vo -- "lun -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'4^\tutti r8 c c g r c
    c g r g g4. fis8
    g4 r8 h h g r h
    c c, r c c f g8. g16
    g8 g4 e8 e4. c8
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra
  pax, in ter -- ra, in
  ter -- ra pax, pax ho -- mi -- ni --
  bus bo -- nae, bo -- nae
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti r8 e e c r e
    e c d4 c16[ h] c[ d] e8 a,
    d4 r8 g g g, r4
    r8 e' c e a, d c g
    g4 c4. a8 r a~
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra pax, pax ho -- mi -- ni --
  bus, in ter -- ra,
  in ter -- ra pax ho -- mi -- ni --
  bus bo -- nae, "bo -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c8^\tutti c' c c, r c' c c,
    r c' h16[ a g f] e[ d c h] a8 d
    g, g' g g, r g' g g,
    r c' a e f d e h
    c c[ e] c r a[ c] a
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, in ter -- ra,
  in ter -- _ _ ra
  pax, in ter -- ra, in ter -- ra,
  in ter -- ra pax ho -- mi -- ni --
  bus bo -- nae, bo -- nae,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c' c c, r c' c c,
    r c' h16 a g f e d c h a8 d
    g, g' g g, r g' g g,
    r c' a e f d e h
    c c'16. g32 e8 c r a'16. e32 c8 a
  }
}

BassFigures = \figuremode {
  r1
  r2. <7>8 <_+>
  r1
  r4 <6>4. <6>8 q4
  r1
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
