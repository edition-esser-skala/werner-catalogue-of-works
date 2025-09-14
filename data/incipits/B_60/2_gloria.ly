\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    R1
    r2 r16 e' gis, a h gis e'8
    r16 a cis, d e cis a'8 r16 h, gis a h gis cis h
    a e' a8 h, gis' a16 fis a8 gis16 cis, cis' h
    a fis cis fis cis a fis a fis a d fis e8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    R1
    r2 r16 gis' e fis gis e gis8
    r16 cis a h cis a cis8 r16 gis e fis gis e gis8
    a16 cis a8~ a16 gis h8 cis8. cis16 cis8 eis
    fis16 cis a cis a fis a cis d8 d,4 cis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    cis'8^\solo e e, gis a4 r
    r8 a d cis h8. h16 h4
    R1
    r2 r8 cis^\tutti cis8. cis16
    cis4 r d8 d d cis16 cis
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax,
  pax, pax ho -- mi -- ni -- bus

  Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r2 a'8^\solo cis cis, e
    fis4 gis8 a gis8. gis16 gis4
    R1
    r2 r8 fis^\tutti fis eis
    fis4 r fis8 fis e e16 e
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, pax ho -- mi -- ni -- bus

  Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    r2 e4.^\aTre e8
    e4. e8 e4 e,
    a8 fis16[ d] e4 a8 a^\tutti gis8. gis16
    a4 r a8 a a a16 a
  }
}

TenoreLyrics = \lyricmode {
  bo -- nae
  vo -- lun -- ta -- tis,
  vo -- lun -- ta -- tis. Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*3
    r2 r8 fis^\tutti cis8. cis16
    fis,4 r d'8 d a a16 a
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    a'4-\solo gis fis e
    d8. cis16 h8 a e'4 r
    \clef tenor e'^\aTre r e e,
    a8 fis16 d e4 a8 \noBeam \clef bass fis-\tutti cis4
    fis, r d8 d' a a
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r q2.
  <6 4>2 <5 _+>
  r4 <4>8 <_+>4. <4>8 <_+>
  r2. <4>8 <_+>
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
