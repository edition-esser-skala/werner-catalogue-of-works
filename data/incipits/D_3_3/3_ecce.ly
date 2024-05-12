\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d'1. d2
    c2. c4 b1
    b1. es2
    a,1 b2 h
    c c c b
    a b1 b2
  }
}

SopranoLyrics = \lyricmode {
  Ec -- ce
  vi -- di -- mus
  e --
  um non ha --
  ben -- tem spe -- ci --
  em, ne -- que "de -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 f2 b~
    b a1 g2
    g1. fis4 e?
    fis2 fis1 f?2
    g f! f2. f4
    f2 d f g
  }
}

AltoLyrics = \lyricmode {
  Ec -- ce vi --
  di -- mus
  e -- _ _
  um non ha --
  ben -- tem spe -- ci --
  em, ne -- que "de -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b1 b
    c2 d d1
    es cis
    d2 d1 d2
    es c d2. d4
    c2 b d c
  }
}

TenoreLyrics = \lyricmode {
  Ec -- ce
  vi -- di -- mus
  e -- _
  um non ha --
  ben -- tem spe -- ci --
  em, ne -- que "de -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b1 b'1
    f2 fis g1
    es\breve
    d2 d1 g2
    c, f! b2. b4
    f2 g d es
  }
}

BassoLyrics = \lyricmode {
  Ec -- ce
  vi -- di -- mus
  e --
  um non ha --
  ben -- tem spe -- ci --
  em, ne -- que "de -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    b1 b'
    f2 fis g1
    es\breve
    d2 d1 g2
    c, f! b2. b4
    f2 g d es
  }
}

BassFigures = \figuremode {
  r\breve
  <4>2 <3> <9> <8>
  <5->1 <6\\>
  <_ _+>1 <6 \t>2 <_!>
  r1 <9>2 <8>
  r1 <6>
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
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
