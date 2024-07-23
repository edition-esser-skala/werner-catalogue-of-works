\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    a''8 a, r \times 4/5 { a32( h cis h a) } e'8 e, r \times 4/5 { e'32( fis gis fis e) }
    a16( cis) cis( h) h( a) a( gis) gis( fis) fis( e) e( d) d( cis)
    cis8\trill d32( e fis g) a16( g) g( fis) fis8.\trill gis32 a h16( a) a( gis)
    gis8.\trill a32 h cis16( h) h( a) a h cis8 cis16( h) h( a)
    gis( a) gis( a) \tuplet 3/2 8 { gis^\critnote a h } a8 gis e' fis, dis'\trill
    e, gis16(\p fis) fis( e) e( dis) dis8.\trill e32 fis h,4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    a''8 a, r \times 4/5 { a32( h cis h a) } e'8 e, r \times 4/5 { e'32( fis gis fis e) }
    a16( cis) cis( h) h( a) a( gis) gis( fis) fis( e) e( d) d( cis)
    cis8\trill d32( e fis g) a16( g) g( fis) fis8.\trill gis32 a h16( a) a( gis)
    gis8.\trill a32 h cis16( h) h( a) a h cis8 cis16( h) h( a)
    gis( a) gis( a) \tuplet 3/2 8 { gis a h } a8 gis4 fis\trill
    e8 gis16(\p fis) fis( e) e( dis) dis8.\trill e32 fis h,4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    cis'4^\tutti r8 cis e4 h
    cis r8 a h8.[\trill cis32 d] e8[ d]
    cis4 a8[ h16 cis] d4 h8.[ cis32 d]
    e4 cis8.[ d32 e] fis8[ cis] fis dis
    h8.[ cis32 dis] e8[ fis] e4 dis\trill
    e r8 e,^\solo h'4~ h16[ cis] \tuplet 3/2 8 { dis[ cis h] }
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae, bo --
  nae, bo -- nae, bo -- nae
  vo -- lun -- ta -- _
  tis. Lau -- da -- mus
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a'4^\tutti r8 a h[ a] gis[ h]
    a4 r8 a gis[ h] a[ gis]
    a4 a8[ g] fis4 h8[ a]
    gis4 cis8[ h] a[ cis] h4~
    h8 a h a gis4 fis
    gis r r2
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra __
  pax ho -- mi -- ni --
  bus bo -- nae, bo --
  nae, bo -- nae, bo --
  nae vo -- lun -- ta -- _
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e4^\tutti r8 e h[ cis16 d] e4
    e r8 a, e'[ gis,] a[ h]
    cis cis[ d e] a, d[ e fis]
    h, e4 e,8 a4. a8
    gis[ e'] h[ cis] h2
    h4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae, bo --
  nae, bo -- nae, bo --
  nae vo -- lun -- ta --
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a'4^\tutti r8 a gis[ fis] e[ d]
    cis4 r8 fis e[ d] cis[ h]
    a a'16[ g] fis8[ e] d h'16[ a] gis8[ fis]
    e cis'16[ h] a8 gis fis[ e] dis[ h]
    e[ cis'] gis[ a] h[ a h h,]
    e4 r r2
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra __
  pax ho -- mi -- ni --
  bus bo -- _ nae, bo -- _
  nae, bo -- _ nae, bo --
  nae vo -- lun -- ta --
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    a8-\tutti cis' h a gis fis e d
    cis a' gis fis e d cis h
    a a'16 g fis8 e d h'16 a gis8 fis
    e cis'16 h a8 gis fis e dis h
    e cis gis a h a h h
    e e' dis cis h a gis fis
  }
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
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
