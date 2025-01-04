\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r8 c' c d e4 r
    e8 e g e d4 r
    R1*3
    r8 g g fis g4 r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r8 e e g c4 r
    c8 c d c g4 r
    R1*3
    r8 e' d4 d r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r8 c c g c4 r
    c8. c16 g8 c g4 r
    R1*3
    r2 g8. g16 g8 g
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r2 r16 c''  g e \tuplet 3/2 8 { \sbOn c e c g c g \sbOff }
    e4 r r16 h'' g d \tuplet 3/2 8 { \sbOn h d h g h g \sbOff }
    d4 r r16 a'' e c \tuplet 3/2 8 { \sbOn a c a e a e \sbOff }
    c4 r r16 d'' a fis d a fis d
    h'8 d g fis r d h' a
    g16 d e c a8 fis' g16 d' h g \tuplet 3/2 8 { \sbOn d g d h d h \sbOff }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r2 r16 g'' e c \tuplet 3/2 8 { \sbOn g c g e g e \sbOff }
    c4 r r16 g'' d h \tuplet 3/2 8 { \sbOn g h g d g d \sbOff }
    h4 r r16 e' c a \tuplet 3/2 8 { \sbOn e a e c e c \sbOff }
    a4 r r16 a'' fis d a fis8 a16
    d,8 g h a r g g' fis
    g16 d e c a8 fis' g16 h g d \tuplet 3/2 8 { \sbOn h d h d, g d \sbOff }
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 c'^\tutti c d e8. e16 e4
    e8 e16 e g8 e16 e d8. d16 d4
    r8 d e e e8. e16 e4
    r8 e d d d8. d16 d8 d
    d4. d8 d4. d8
    d e d4 d r
  }
}

SopranoLyrics = \lyricmode {
  Plau -- den -- tes vir -- gi -- ni,
  pro -- di -- te, pro -- di -- te po -- pu -- li,
  psa -- len -- tes can -- ti -- bus,
  ad -- e -- ste plau -- si -- bus et
  ve -- ne -- ra -- mi --
  ni Ma -- ri -- am,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 e^\tutti g g g8. g16 g4
    g8 g16 g g8 g16 g g8. g16 g4
    r8 g g gis a8. a16 a4
    r8 a a g fis8. fis16 a8 \hA fis
    g d g[ fis] g[ d] g \hA fis
    g g g[ fis] g4 r
  }
}

AltoLyrics = \lyricmode {
  Plau -- den -- tes vir -- gi -- ni,
  pro -- di -- te, pro -- di -- te po -- pu -- li,
  psa -- len -- tes can -- ti -- bus,
  ad -- e -- ste plau -- si -- bus et
  ve -- ne -- ra -- _ _ mi --
  ni Ma -- ri -- am,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 g^\tutti c h c8. c16 c4
    c8 c16 c d8 c16 c h8. h16 h4
    r8 h c h c8. c16 c4
    r8 c c h a8. a16 a8 a
    h[ d16 c] h8 a h[ d16 c] h8 a
    g c a4 h r
  }
}

TenoreLyrics = \lyricmode {
  Plau -- den -- tes vir -- gi -- ni,
  pro -- di -- te, pro -- di -- te po -- pu -- li,
  psa -- len -- tes can -- ti -- bus,
  ad -- e -- ste plau -- si -- bus et
  ve -- _ ne -- ra -- _ mi --
  ni Ma -- ri -- am,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 c'^\tutti e, g c,8. c16 c4
    c'8 c16 c h8 c16 c g8. g16 g4
    r8 g c, e a,8. a16 a4
    r8 a' fis g d8. d16 d8 d
    g[ h16 a] g8 d g[ h16 a] g8 d
    h c d4 g, r
  }
}

BassoLyrics = \lyricmode {
  Plau -- den -- tes vir -- gi -- ni,
  pro -- di -- te, pro -- di -- te po -- pu -- li,
  psa -- len -- tes can -- ti -- bus,
  ad -- e -- ste plau -- si -- bus et
  ve -- _ ne -- ra -- _ mi --
  ni Ma -- ri -- am,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\tutti c' e, g c,4 r
    c8 c' h c g4 r
    g,8 g' c, e a,4 r
    a8 a' fis g! d4 \hA fis8 d
    g h16 a g8 d g h16 a g8 d
    h c d d, g4 r
  }
}

BassFigures = \figuremode {
  r1
  r
  r4. <_+>8 r2
  r4 <6 5> <_+>2
  r4. q2 q8
  r4 <4>8 <_+> r2
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
}
