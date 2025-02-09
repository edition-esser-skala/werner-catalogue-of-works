\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    fis'16 a d, fis e a, e' a fis a8 d a fis16
    e8 a, cis e fis16 g a g fis8 e
    fis16 g a g fis8 e d h' e, a
    fis4 r r8 cis' h a
    gis4. gis8 a8. h16 cis8 h
    a a4 gis8 a16 cis e, a cis, a e a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    fis'16 a d, fis e a, e' a fis a8 d a fis16
    e8 a, cis e d16 e fis e d8 cis
    d16 e fis e d8 cis d4. cis8
    d a' g fis e16 d e4 fis8
    h,4. h8 e4. e8
    cis fis h, e cis16 e a, cis a e cis e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'4^\tutti cis8 e fis e d[ fis]
    e a, cis e fis16[ e] d4 e8
    fis16[ e] d4 cis8 d4. cis8
    d fis[ e] d cis16[ d] e4 fis8
    h,8. h16 h4 e e
    cis8 d h8. h16 cis4 r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, et ter -- _
  rae, vi -- si -- bi -- li -- um
  o -- mni -- um et in --
  vi -- si -- bi -- li -- um.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    fis4^\tutti e8 a a a a4
    a r8 a a4 a
    a a8 a fis g e4
    fis8 a[ g] fis e4 e8 dis
    e8. e16 e4 e8 gis a[ gis]
    a[ fis] e8. e16 e4 r
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem
  coe -- li, coe -- li et ter --
  rae, vi -- si -- bi -- li -- um
  o -- mni -- um et in -- vi --
  si -- bi -- li -- um.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    a4^\tutti cis8 cis d e a,[ d]
    cis4 r8 cis d4. cis8
    d4 d8 e d h a4
    a r r8 cis[ h] a
    gis4. gis8 a h cis h
    a a a gis a4 r
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem
  coe -- li, coe -- li et ter --
  rae, et __ in --
  vi -- si -- bi -- li -- um, in --
  vi -- si -- bi -- li -- um.
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d4^\tutti a'8 a d a fis[ d]
    a'4 r r8 d, fis a
    d[ d,] fis a h g a[ a,]
    d4 r r8 a'[ gis] fis
    e h' e d! cis[ h] a e
    fis d e8. e16 a,4 r
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem
  coe -- li, coe -- li et ter --
  rae, et __ in --
  vi -- si -- bi -- li -- um, et in --
  vi -- si -- bi -- li -- um.
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    d8-\tutti fis16 d a'8 cis16 a d8 a fis d
    a'4 r8 a, d4 fis8 a
    d,4 fis8 a h g a a,
    d4 r r8 a' gis fis
    e h' e d! cis h a e
    fis d e e, a4 r
  }
}

BassFigures = \figuremode {
  r1
  r
  r2. <4>8 <3>
  r2.. <6\\>8
  <_+>4. <\t>8 r2
  r4 <4>8 <_+> r2
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
