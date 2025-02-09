\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    a'16 fis d a d' a fis d fis' d a fis a' fis d a
    d' a g a fis a fis d g e h' g e g cis, e
    fis d8 fis16 a fis8 a16 c d,8 g16 h g d h'
    a d8 a16~ a d, fis a g e8 e'16~ e cis8 a16~
    a fis8 a16 d, d'8 d16 d h8 gis16 d h'8 d,16
    cis( d) e( fis) e( fis) gis( a) e4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    fis16 a8 fis16~ fis d8 fis16 a fis8 d'16 fis d a d
    fis d8 a16 d fis d a h g g' e cis e a, cis
    d a8 d16 fis a8 fis16 d g8 h16 g d h g'~
    g fis d e fis a fis d e g8 h,16 cis e8 g16
    fis d8 a16 h h'8 h16 h gis8 h,16~ h d8 h16
    a( h) cis( d) cis( d) e( d) cis4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d'4^\tutti d d d,
    d' fis h, cis
    d c2 h4
    a4. a8 g2
    fis f
    e4 r a^\solo \sbOn \tuplet 3/2 8 { cis16[ d cis } h a] \sbOff
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae
  vo -- lun -- ta --
  _ _
  tis. Lau -- "da -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    fis4^\tutti fis fis fis
    fis8[ g] a4 g4. g8
    fis4 fis g g~
    g fis e2~
    e4 d2.
    cis4 r r2
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae vo --
  lun -- ta --
  _
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a4^\tutti a a a
    a d e4. e8
    a,4 a g h
    d a h e
    a, h4. h8 h4
    e, r r2
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- _ nae
  vo -- lun -- ta -- _
  tis, vo -- lun -- ta --
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d4.^\tutti d8 d4 d
    d d d4. d8
    d4 r d d
    d2. cis4
    d h gis2
    a4 r r2
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae
  vo -- lun --
  ta -- _ _
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d8-\tutti d d d d d d d
    d d d d d d d d
    d d d d d d d d
    d d d d d d cis cis
    d d h h gis gis gis gis
    a4 r a8-\solo a' a a
  }
}

BassFigures = \figuremode {
  r1
  r2 <6 4 2>4 <7 \t \t>
  r <7!> <\t 4> <6 \t>
  <5 4> <\t 3> <4 2> r
  <9> <5> <7! 5>2
  r1
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
