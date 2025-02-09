\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    R1
    r2 r8 e'4 e8
    cis a' e h' cis, d h4\trill
    cis r r2
    r r4 \sbOn \tuplet 3/2 8 { e16\f d cis } h a \sbOff
    fis' a d, fis cis e d fis e a, fis a cis, e d fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    R1
    r2 r8 cis' h16( a) h8~
    h16 a fis'8 h, gis' a,4. gis8
    a4 r r2
    r fis'16\f e32 d cis16 h a cis d e
    fis a d, fis cis e d fis e a, fis a cis, e d fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d'8^\solo a16[ g] fis8 e d a' g8. g16
    fis8 r r4 r2
    R1
    r8 a4 d8 cis[ e16 d] cis8 h
    ais h16 h h8[ ais] h4 r
    d8^\tutti d16 d cis8 d e d cis d
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax ho -- mi -- ni --
  bus,

  pro -- pter ma -- _ gnam
  glo -- ri -- am tu -- am.
  Do -- mi -- ne De -- us, Rex coe -- le -- stis,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    fis8^\solo e d d16 d cis4 r
    r2 r4 e~
    e8 d16 cis fis8 gis16 a e8 cis16[ d] e8 e
    e d16 d cis4 h r
    fis'8^\tutti fis16 fis e8 fis a fis e fis
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di -- ci -- mus te, %2
  gra --
  ti -- as a -- gi -- mus ti -- bi pro -- pter
  glo -- ri -- am tu -- am.
  Do -- mi -- ne De -- us, Rex coe -- le -- stis,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r8 d^\solo d cis
    d4 r r2
    R1
    cis8 h16 a d8 d,16 d a'8 a a g!
    fis g16 g e8[ fis] h4 r
    a8^\tutti a16 a a8 a cis a a a
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- mus %1
  te,

  gra -- ti -- as a -- gi -- mus ti -- bi pro -- pter
  glo -- ri -- am tu -- am.
  Do -- mi -- ne De -- us, Rex coe -- le -- stis,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 d8^\solo a' h fis e[ a]
    d, r r4 a16[ h] cis[ d] e[ fis] gis[ e]
    a8 gis16[ fis] e[ d] cis[ h] a[ a' fis d] e8. e16
    a,4 r r2
    R1
    d8^\tutti d16 d a'8 fis cis d a' fis
  }
}

BassoLyrics = \lyricmode {
  Bo -- nae vo -- lun -- ta --
  tis, ad -- o -- ra -- mus
  te, glo -- ri -- fi -- ca -- _ mus
  te.

  Do -- mi -- ne De -- us, Rex coe -- le -- stis,
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d8-\solo fis16 e d8 a' h fis e a
    d, e fis gis a4 gis8 e
    fis4 gis8 e fis d e e,
    a \clef tenor a'[ d d,] a'4. g8
    fis g e fis h \clef bass h,[ cis a!]
    d4-\tutti a'8 fis cis d a' fis
  }
}

BassFigures = \figuremode {
  r2 r8 <6> <7> <_+>
  r4 <6>8 <\t> r2
  <5>2. <4>8 <_+>
  r1
  <7 _+>8 <5> <6 5> <_+> r4 <6>
  r4. <6>8 r2
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
