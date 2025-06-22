\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    r4 a'' a, r
    r8 d e fis16 g a4 a,
    r8 d d fis16 g a8 d a, cis'
    d4 d, r e
    e, h'' cis, e~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    r4 a'' a, r
    r8 d e fis16 g a4 a,
    r8 d d fis16 g a8 d a, cis'
    d4 d, r e
    e, h'' cis, e~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 a'^\tutti
    a4 a a2
    a a
    a r
    e e4 e
  }
}

SopranoLyrics = \lyricmode {
  Cre --
  do in u --
  num De --
  um,
  cre -- do in
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 a'^\tutti
    a4 a a2
    a a
    a r
    e e4 e
  }
}

AltoLyrics = \lyricmode {
  Cre --
  do in u --
  num De --
  um,
  cre -- do in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 a^\tutti e'8 d cis d16[ e]
    fis4 fis, r8 a cis d16[ e]
    fis8[ cis] d d d4 cis
    d d8 d cis8. cis16 cis4
    h4. h8 cis4 e8 d16[ cis]
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae, vi -- si -- bi -- li -- um
  o -- mni -- um et "in -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d'4^\tutti d, r8 a' a h16[ cis]
    d4 d, r8 a' a h16[ cis]
    d8[ a] fis d a'[ g a a,]
    d4 r a'8 h cis h16[ a]
    gis8 fis16 fis e8 fis16[ \hA gis] a8 h cis h16 a
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, et in u -- num
  Do -- mi -- num Je -- sum Chri -- stum, Fi -- li -- um
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    d8-\tutti e fis e16 d cis8 h a h16 cis
    d8 e fis e16 d cis8 h a h16 cis
    d8 e fis e16 d a'8 g a a,
    d e fis e16 d a'8 h cis h16 a
    gis8 fis e fis16 \hA gis a8 h cis h16 a
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <4>4 <3>
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
