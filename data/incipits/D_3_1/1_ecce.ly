\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    b'\breve~
    b2 a4 g a1\fermata
    b\breve~
    b2 a4 g a1\fermata
    r2 a2. h4 c2
    d1. d2
  }
}

SopranoLyrics = \lyricmode {
  Ec --
  _ _ ce,
  ec --
  _ _ ce
  quo -- mo -- do
  mo -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/2
    g'\breve~
    g2 fis4 e fis1\fermata
    f\breve
    f\fermata
    r2 f2. f4 g2
    as1. as2
  }
}

AltoLyrics = \lyricmode {
  Ec --
  _ _ ce,
  ec --
  ce
  quo -- mo -- do
  mo -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    d\breve
    d\fermata
    d~
    d2 c4 b c1\fermata
    r2 d2. d4 es2
    f1. f2
  }
}

TenoreLyrics = \lyricmode {
  Ec --
  ce,
  ec --
  _ _ ce
  quo -- mo -- do
  mo -- "ri -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    g'\breve
    d\fermata
    b'
    f\fermata
    r2 d2. d4 c2
    h1. h2
  }
}

BassoLyrics = \lyricmode {
  Ec --
  ce,
  ec --
  ce
  quo -- mo -- do
  mo -- "ri -"
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
