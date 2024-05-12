\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    h'1 h2 cis
    d f1 f2
    e1 r2 cis
    d d4 d d2 d
    d cis d1
    r2 d es d4 d
  }
}

SopranoLyrics = \lyricmode {
  Se -- pul -- to
  Do -- _ mi --
  no, si --
  gna -- tum est mo -- nu --
  men -- _ tum,
  si -- gna -- tum est
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    e1 e2 e
    f1 gis
    a r2 a
    d, fis4 a g2 fis
    g1 fis
    r2 fis g g4 g
  }
}

AltoLyrics = \lyricmode {
  Se -- pul -- to
  Do -- mi --
  no, si --
  gna -- tum est mo -- nu --
  men -- tum,
  si -- gna -- tum est
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    g1 g2 g
    a1 h
    cis r2 a
    b a4 a b2 a
    b a4 g a1
    r2 a c! d4 d
  }
}

TenoreLyrics = \lyricmode {
  Se -- pul -- to
  Do -- mi --
  no, si --
  gna -- tum est mo -- nu --
  men -- _ _ tum,
  si -- gna -- tum est
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    e1 e2 e
    d1. d2
    a1 r2 a'
    g fis4 fis g2 d
    g,1 d'
    r2 d c! h!4 h
  }
}

BassoLyrics = \lyricmode {
  Se -- pul -- to
  Do -- mi --
  no, si --
  gna -- tum est mo -- nu --
  men -- tum,
  si -- gna -- tum est
}

\score {
  <<
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
  >>
}
