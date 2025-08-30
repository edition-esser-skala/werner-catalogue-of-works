\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r16 h'' d c h8 a r16 g h a g8 fis
    r16 h, d c h8 a \tuplet 3/2 8 { \sbOn h16\trill a h d\trill c d g\trill fis g h\trill a h \sbOff }
    a( d) cis( d) a( h) fis( g) a8 d, r4
    d8 e f e16 d e8 fis16 g a4~
    a8 fis g e16 c h8 g' a, fis
    g16 d h' a g8 fis g4 r16 d c h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r16 g'' h a g8 fis r16 h, d c h8 a
    r16 g h a g8 fis \tuplet 3/2 8 { g16 fis g } d'8~ d \tuplet 3/2 8 { g16 fis g }
    fis( d') cis( d) a( h) fis( g) a8 d, r4
    g,16 a h8 a16( c) d( h) g8 a16 h c4~
    c8 d h c h8.\trill a32 g a4\trill
    g16 h d c h8 a h4 r16 h a g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'4^\tutti r8 d d d r d
    d h r a h a g h
    a8. a16 a4 a8 h c h16[ a]
    h[ a] h8 r4 g8 a16[ h] c4~
    c8 d h c h4 a\trill
    h r r8 g^\solo d'4~
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus bo -- nae vo -- lun --
  ta -- tis, bo -- nae, bo --
  nae vo -- lun -- ta -- _
  tis. Lau -- "da -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti r8 fis g g r fis
    g g r fis g fis g g
    fis8. fis16 fis4 fis8 d e fis
    g16[ fis] g8 r4 e8 fis!16([ g)] a4~
    a8 fis g2 fis4
    g r r2
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus bo -- nae vo -- lun --
  ta -- tis, bo -- nae vo --
  lun -- ta -- _
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    h4^\tutti r8 a h h r a
    h h r d d d d d
    d8. d,16 d4 r2
    d'8 e f e16[ d] e8 d c e
    d4. e8 d2
    d4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis, bo -- nae
  vo -- lun -- ta --
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti r8 d' h g r d
    h g r d' g d h g
    d'8. d16 d4 r2
    h'8 g a h c[ h] a[ g]
    fis d g c, d[ c] d4
    g, r r2
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta -- _
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g'4-\tutti r8 d' h g r d
    h g r d' g d h g
    d'4 r \clef soprano << { a''8 h c h16 a } \\ { fis8 d e fis } >>
    \clef bass h, g a h c h a g
    fis d g c, d c d d,
    g4 r8 d'-\solo g,4 r
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <6>8 q <6!> <6>2 q8
  q2 <6 4>4 <5 _+>
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
}
