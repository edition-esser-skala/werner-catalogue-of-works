\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    fis'16 d g d a'8 h16 g a8 d, r h'
    a16 d, h' d, a'8 g fis16 e d8 cis h
    a g fis e d16 a e' a, fis' a' g fis
    e a, d a cis8 h a fis'16 a, e' a, d a
    cis8 a' gis fis e d cis h
    a16 cis e cis d a e' a, fis' d g d a'8 h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    fis'16 d g d a'8 h16 g a8 d, r h'
    a16 d, h' d, a'8 g fis16 e d8 cis h
    a g fis e d16 a e' a, fis' a' g fis
    e a, d a cis8 h a fis'16 a, e' a, d a
    cis8 a' gis fis e d cis h
    a16 cis e cis d a e' a, fis' d g d a'8 h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d'2^\tutti d
    d d,8 d' cis h
    a g fis e d4 a'8 a
    e'[ d] cis[ h] a16[ gis] a4 h8
    cis a[ h] cis16[ d] e8[ h e d]
    cis16[ a h cis] d8[ e] a,4 a8 h
  }
}

SopranoLyrics = \lyricmode {
  Et in
  ter -- ra, in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- _ _
  tis, vo -- lun -- ta --
  _ _ tis, bo -- nae
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    r2 a'^\tutti
    a a
    a,8 a' gis fis e d cis h
    a e' a g fis[ e] d4
  }
}

AltoLyrics = \lyricmode {
  Et %3
  in ter --
  ra, in ter -- ra pax ho -- mi -- ni --
  bus, in ter -- ra pax "ho -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*5
    r2 d^\tutti
  }
}

TenoreLyrics = \lyricmode {
  Et
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*6
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Allegro"
    d8-\tutti e fis g fis h a g
    fis g fis e d d' cis h
    a g fis e d e fis e16 d
    cis8 fis e d cis d cis h
    a a' gis fis e d cis h
    << { a' g fis e } \\ { a,4 s } >> d8 e fis g
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r8 <6> q q q2
  r1
  r
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
