\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \major \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \major \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r4 r8 cis'^\solo
    a16[ h cis a] d8. d16 cis8 r r4
    r8 h h e dis16[ e cis dis] h[ cis dis h]
    e4. dis8 e4 r
  }
}

SopranoLyrics = \lyricmode {
  lau --
  da -- _ mus te,
  glo -- ri -- fi -- ca -- _
  _ mus te,
}

Alto = {
  \relative c' {
    \clef alto
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    h'8^\solo gis dis e fis gis16[ h] a8. a16
    gis8 r r4 r2
    d8 e fis gis16 gis a8 r r4
    r2 r8 e e a
    \sbOn \tuplet 3/2 8 { gis16[ a gis } fis e] \sbOff fis8. fis16 e4 r
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra pax ho -- mi -- ni --
  bus
  be -- ne -- di -- ci -- mus te,
  glo -- ri -- fi --
  ca -- _ mus te,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    gis16[^\solo ais] ais[ h] h8. h16 a16[ gis a h] gis4\trill
    fis8 r r4 a8 h cis dis!
    e4 r r2
    r gis,8 gis16 gis ais8 ais16 ais
  }
}

TenoreLyrics = \lyricmode {
  bo -- nae vo -- lun -- ta -- _
  tis, ad -- o -- ra -- mus
  te,
  gra -- ti -- as a -- gi -- mus
}

Basso = {
  \relative c {
    \clef bass
    \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 h'8^\solo gis dis e cis dis16[ fis]
    e8 e16 e dis[ eis] eis[ fis] fis8 fis fis[ eis]
    fis r h8. h16 e,[ fis gis e] a8. a16
    gis4 r r2
    r e8 e16 e cis8 fis16 fis
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus bo -- nae vo -- lun -- ta --
  tis, ad -- o -- ra -- _ mus
  te,
  gra -- ti -- as a -- gi -- mus
}

Organo = {
  \relative c {
    \clef bass
    \key e \major \time 4/4 \tempoMarkup "Andante"
    e4-\solo h'8 gis dis e cis dis
    e cis h gis fis d' h cis
    d cis h4 a8 gis fis4
    e8 e' dis cis << { h' } \\ { h, a' gis fis } >>
    e cis a h e, e' cis fis
  }
}

BassFigures = \figuremode {
  r4. <6>8 q4 q8 <\t>
  r <6\\>4 q8 r4 <6 5>8 <_+>
  r4 <5 _!>8 <6\\ \t>4. <5>8 <6\\>
  r4 r4. <\t>8 <6> <6\\>
  r4 <6 5>8 <_+>4. <6\\>8 <_+>
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
