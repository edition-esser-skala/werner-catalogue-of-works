\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 b
    a2 d1 cis2
    d e f d~
    d cis d1~
    d e
    d r
    R\breve
    r2 d1 cis2
    f2. f4 e1
    d2 c!4 b a1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    r1 d
    f e2 a~
    a g f2. d4
    e2 a2. g4 f2~
    f4 e d f g2 a~
    a f e1
    d2 g1 fis2
    b2. b4 a2. g4
    f!2 d1 cis2
    d\breve
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'1 b
    a2 d1 cis2
    d e f d~
    d cis d1~
    d e
    d r
    R\breve
    r2 d1 cis2
    f2. f4 e1
    d2 c!4 b a1
  }
}

SopranoLyrics = \lyricmode {
  A -- _
  ve Re -- _
  gi -- _ na coe --
  _ lo --
  _
  rum,

  a -- ve
  Do -- mi -- na
  An -- ge -- _ "lo -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 d
    f e2 a~
    a g f2. d4
    e2 a2. g4 f2~
    f4 e d f g2 a~
    a f e1
    d2 g1 fis2
    b2. b4 a2. g4
    f!2 d1 cis2
    d\breve~
  }
}

AltoLyrics = \lyricmode {
  A --
  _ ve Re --
  _ gi -- _
  na coe -- _ lo --
  _ _ _ _ _
  _ _
  rum, a -- ve
  Do -- mi -- na __ _
  An -- _ ge --
  "lo -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    a1 b
    a2 d1 cis2
    d1. c2
    b2. b4 a2 d
    d1 r
    R\breve*2
  }
}

TenoreLyrics = \lyricmode {
  A -- _
  ve Re -- _
  gi -- _
  na coe -- lo -- _
  rum,
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 r2 d
    f1 e2 a4 g
    f2 d a a'~
    a g d1
    g r
    R\breve
    r2 g1 fis2
  }
}

BassoLyrics = \lyricmode {
  A --
  _ ve Re -- _
  gi -- _ na coe --
  _ lo --
  rum,

  a -- ve
}

Organo = {
  \relative c {
    \clef soprano
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    << {
      a''1 b
      a2 d1 cis2
      d e f d
    } \\ {
      r1 d,
      f e2 a~
      a g f2. d4
    } >>
    \clef tenor a1 b2 \clef bass d,
    f1 e2 a4 g
    f2 d a a'~
    a g d1
    g \clef soprano << {
      d''2 cis
      f2. f4 e1
      d2
    } \\ {
      a2. g4
      f!2 d1 cis2
      d
    } >> \clef bass g,1 fis2
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  <5 4>2 <\t _+> <7>4 <6> <6->2
  <6>1 <7>2 <_+>
  r1 <5 4>2 <\t _!>
  <4 2-> <\t \t> <4> <_+>
  <_->\breve
  r
  r2 <4!>4 <_-> <5 2>2 r
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
