\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro passato"
    a''8 a, r cis' h a16 gis a8 h
    e,16( cis) h( a) r8 cis' h a16 gis a8 h
    e,16 a, cis e a( g) g( fis) fis a32( g) fis16 e d fis e d
    cis e8 a cis e16 h gis8 e h gis16
    r e8 a c e16 h gis8 e h e16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro passato"
    a''8 a, r cis' h a16 gis a8 h
    e,16( cis) h( a) r8 cis' h a16 gis a8 h
    e,16 a, cis e a( g) g( fis) fis a32( g) fis16 e d fis e d
    cis e8 a cis e16 h gis8 e h gis16
    r e8 a c e16 h gis8 e h e16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro passato"
    e'4.^\tutti e8 e4 e,
    r r8 e' e4 e,
    r8 cis' d e fis8. e16 d4
    cis8 cis cis cis h h r4
    c8 c e c h h r4
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra,
  in ter -- ra
  pax, pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta -- tis,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro passato"
    a'4^\tutti r8 e e4. e8
    e4 r8 e e4. e8
    e4 fis8 g fis8. g16 a4
    e8 e e e e e r4
    e8 e e e e e r4
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta -- tis,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro passato"
    cis4^\tutti r8 cis h[ a16 gis] a8[ h]
    cis4 r8 cis h[ a16 gis] a8[ h]
    cis e d cis d8.\trill a16 a4
    a8 a a a gis! gis r4
    a8 a a a gis gis r4
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax, pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta -- tis,
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro passato"
    a'4^\tutti r8 a gis[ fis16 e] fis8[ gis]
    a4 r8 a gis[ fis16 e] fis8[ gis]
    a g fis e d4 fis8 d
    a' e cis a e' e r4
    a8 e c a e' e r4
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae,
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta -- tis,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Allegro passato"
    a'8-\tutti h16 cis h8 a gis fis16 e fis8 gis
    a h16 cis h8 a gis fis16 e fis8 gis
    a g fis e d e fis d
    a' e cis a e' h gis! e
    a' e c a e' h gis e
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r8 <\t>4. <_+>8 <\t>4.
  <_!>8 <\t>4. <_+>8 <\t>4.
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
