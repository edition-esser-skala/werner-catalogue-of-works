\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro non molto"
    r8 c16 e g e c' g e'8 e,16 g c g e' c
    g'8 g,16 c e c g' e c' g e g c, g e g
    d g h g d' h g' d r e \tuplet 3/2 8 { e[\trillE d e] } r h \tuplet 3/2 8 { h[\trill a h] }
    r c \tuplet 3/2 8 { c[\trill h c] } r g! \tuplet 3/2 8 { g[\trill f g] } r a \tuplet 3/2 8 { a[\trill g a] } r e \tuplet 3/2 8 { e[\trill d e] }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro non molto"
    r8 g16 c e c g' e c'8 c,16 e g e c' g
    e'8 e,16 g c g e' c g' e c e c g e g
    h, d g d h' g d' h r g \tuplet 3/2 8 { g[\trill f g] } r gis \tuplet 3/2 8 { gis[\trill fis? gis] }
    r a \tuplet 3/2 8 { a[\trill gis a] } r e \tuplet 3/2 8 { e[\trill d e] } r f \tuplet 3/2 8 { f[\trill e f] } r cis \tuplet 3/2 8 { cis[\trill h cis] }
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro non molto"
    c'4. c8 c g r c
    g e r g e c g' c
    h8. h16 h4 c8 r h r
    a r g! r a r a r
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus, pax, pax,
  pax, pax, pax, pax,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro non molto"
    c'4.^\tutti c8 c g r c
    g e r g e c g' e
    d8. d16 d4 e8 r e r
    e r e r f r e r
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus, pax, pax,
  pax, pax, pax, pax,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro non molto"
    c4.^\tutti c8 c g r c
    g e r g e c g' g
    g8. g16 g4 g8 r gis r
    c r c r c r cis r
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus, pax, pax,
  pax, pax, pax, pax,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro non molto"
    c'4.^\tutti c8 c g r c
    g e r g e c e c
    g'8. g,16 g4 c8 r e r
    a, r c r f r a r
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus, pax, pax,
  pax, pax, pax, pax,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro non molto"
    c4-\tutti r c r
    c r c8 c' e, c
    g' g, g g c r e r
    a, r c r f, r a r
  }
}

BassFigures = \figuremode {
  r1
  r
  r2. <_+>4
  r2. <_+>4
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
