\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \dorian \time 4/2 \tempoMarkup "Pars prima · [no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    b'\breve~
    b2 a4 g a1\fermata \bar "||"
    b\breve~
    b2 a4 g a1\fermata \bar "||"
    r2 a2. h4 c2
    d1. d2
    d c b!1~
    b2 a r d
  }
}

SopranoLyrics = \lyricmode {
  Ec --
  _ _ ce,
  ec --
  _ _ ce
  quo -- mo -- do
  mo -- ri --
  tur __ _ iu --
  stus, et
}

Alto = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/2 \tempoMarkup "Pars prima · [no tempo]"
    g'\breve~
    g2 fis4 e \hA fis1\fermata \bar "||"
    f\breve
    f\fermata \bar "||"
    r2 f2. f4 g2
    as1. as2
    g1 g~
    g2 fis r \hA fis
  }
}

AltoLyrics = \lyricmode {
  Ec --
  _ _ ce,
  ec --
  ce
  quo -- mo -- do
  mo -- ri --
  tur iu --
  stus, et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \dorian \time 4/2 \tempoMarkup "Pars prima · [no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d\breve
    d\fermata \bar "||"
    d~
    d2 c4 b c1\fermata \bar "||"
    r2 d2. d4 es2
    f1. f2
    es1 e
    d r2 a
  }
}

TenoreLyrics = \lyricmode {
  Ec --
  ce,
  ec --
  _ _ ce
  quo -- mo -- do
  mo -- ri --
  tur iu --
  stus, et
}

Basso = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/2 \tempoMarkup "Pars prima · [no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g'\breve
    d\fermata \bar "||"
    b'
    f\fermata \bar "||"
    r2 d2. d4 c2
    h1. h2
    c1 cis
    d r2 d
  }
}

BassoLyrics = \lyricmode {
  Ec --
  ce,
  ec --
  ce
  quo -- mo -- do
  mo -- ri --
  tur iu --
  stus, et
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
