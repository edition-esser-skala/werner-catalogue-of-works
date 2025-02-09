\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    cis'16 e a,8~ a16 d cis h cis e a,8~ a16 fis' e d
    cis a' gis fis e cis' h a gis fis e dis e h' a h
    cis e d e cis d h cis a cis h cis a h g a
    fis d fis a d e cis d h cis a h gis a fis gis
    e fis d e cis d h cis a8 e' a cis16( a)
    fis8 d'16( h) \grace a8 gis8.\trill gis16 a8 cis,16 e fis8 h,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    cis'16 e a,8 a16 h a gis a cis8 a16~ a d cis h
    cis a' gis fis e cis' h a gis fis e dis e h' a h
    cis e d e cis d h cis a cis h cis a h g a
    fis d fis a d e cis d h cis a h gis a fis gis
    e fis d e cis d h cis a8 e' a cis16( a)
    fis8 d'16( h) \grace a8 gis8.\trill gis16 a8 cis,16( e) fis8 h,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    cis'8^\tutti d4 h8 cis cis d[ cis16 h]
    cis8 d e d16[ cis] h4 e,8 e'
    cis cis cis e a, h16 cis d8 e
    fis4 d8 fis e[ h]~ h16[ cis] d8
    e d cis e a,16[ h cis d] e8 cis
    fis[ d] h[ e] cis4 r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um o -- mni --
  um et in -- vi -- si --
  bi -- li -- um, in -- vi -- _ si --
  bi -- li -- um.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    e8^\tutti fis4 gis8 a e fis[ gis]
    a gis16[ fis] e[ cis'] h[ a] gis8 a16 a h8[ gis]
    e e8.[ fis16] g8 a4. g8
    fis fis8.[ gis16] a8 h[ a] gis[ fis]
    e4 e8 e fis4 e8[ a]
    a4. gis8 a4 r
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et ter --
  rae, vi -- si -- bi -- li --
  um o -- _ _ mni --
  um et in -- vi -- si --
  bi -- li -- um.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    a4^\tutti h8 e e cis h4
    a a8 h h[ a] gis h16 h
    a8 a a16[ h] cis8 d a4 h16[ cis]
    d8 d4 cis8 h[ a] gis16[ a] h[ cis]
    a4 a8 h cis4 a8[ cis]
    h4. h8 a4 r
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- _
  um o -- mni -- um, o -- mni --
  um et in -- vi -- si --
  bi -- li -- um.
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    a'8[^\tutti fis] d e a, a' d,[ e]
    a, h cis d e[ fis] gis e
    a a, a' g fis4. e8
    d d'16[ cis] h8[ a] gis[ fis] e[ d]
    cis[ h] a[ gis'] fis[ e16 d] cis8[ a]
    d[ h] e8. e16 a,4 r
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li --
  um o -- _ mni -- um __
  et __ in -- vi -- si --
  bi -- _ li -- um.
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    a'8 fis d e a, a' d, e
    a, h cis d e fis gis e
    a a, a' g fis fis, fis' e
    d d'16 cis h8 a gis fis e d
    cis h a gis fis' e16 d cis8 a
    d h e e, a a' d, e
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
}
