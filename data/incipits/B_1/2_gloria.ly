\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace passato"
    \pa e'8 g4 c8 h4 r
    g8 e g c h4 r8 h
    c g c c \pd a8. a16 a4
    r8 a4 a8 h8. h16 h4
    r8 h4 h8 c a c4~
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace passato"
    c'4 r8 e d d4 g8
    e c r4 d8 g, d' g
    e4 r8 e c8. c16 c4
    r8 fis4 d8 d8. d16 d4
    r8 e4 e8 e4. c8
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace passato"
    c8 g16 c c16. c64 c g16 c g8. g32 g g8 g
    c8. c32 c c16 c g c g8. g32 g g16 g g g
    c8. c32 c c16 c g c c8 c r4
    R1*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace passato"
    c'16\f e d e g8 c h d g,4
    c,,16 e d e g8 c h d g,4
    r8 e' \sbOn e16 g g16.\trill f64 g a8 f, f4\trill
    r8 fis' fis16 a a16.\trill g64 a h8 g, g4\trill
    r8 gis' gis16 h h16.\trill a64 h c8 a, c'4~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace passato"
    r2 g'16 h a h d8 g
    e g r4 g,,16 h a h d8 g
    e g c,4 r8 a'~ \sbOn a16 c c16.\trill h64 c
    d8 d, d4\trill r8 h'~ h16 d d16.\trill c64 d \sbOff
    e8 e, e4\trill r8 c' e e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace passato"
    e'4^\tutti r8 e d4. d8
    e4 r8 c h4. h8
    c g4 g8 a8. a16 a4
    r8 a4 a8 h8. h16 h4
    r8 h4 h8 c8. c16 c4
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace passato"
    g'4^\tutti r8 g g4. g8
    g4 r8 e d4. d8
    e e4 e8 f8. f16 f4
    r8 fis4 fis8 g8. g16 g4
    r8 gis4 gis8 a8. a16 a4
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace passato"
    c4^\tutti r8 c h4. h8
    c4 r8 g g4. g8
    g c4 c8 c8. c16 c4
    r8 d4 d8 d8. d16 d4
    r8 e4 e8 e8. e16 e4
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace passato"
    c4^\tutti r8 c' g4. g8
    c,4 r8 c' g4. g8
    c, c'4 c,8 f8. f16 f4
    r8 d4 d8 g8. g16 g4
    r8 e4 e8 a8. a16 a4
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus,
  pax ho -- mi -- ni -- bus
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace passato"
    c16-\tutti c' h c c, c' h c g, g' f g g, g' f g
    c, c' h c c, c' h c g, g' f g g, g' f g
    c, c' h c c, c' h c f,, f' e f f, f' e f
    d d' cis d d, d' cis d g,, g' f g g, g' f g
    e e' dis e e, e' dis e a,, a' g a a, a' g a
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <_+>
  q
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
