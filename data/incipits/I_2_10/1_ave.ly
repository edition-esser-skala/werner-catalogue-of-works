\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 a2 a
    a1 f2 d
    b'2. a4 g f d e
    f g a h c2. h4
    a h c d e2 c4 h
    a2. g4 f d d' c
    b1 a2 a
    f'2. e4 d c b a
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 d~
    d2 d1 d2
    d1 c2 a
    f' e4 d c a a'2~
    a4 g f e d2 d~
    d d1 d2~
    d d b'4 a g fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 a2 a
    a1 f2 d
    b'2. a4 g f d e
    f g a h c2. h4
    a h c d e2 c4 h
    a2. g4 f d d' c
    b1 a2 a
    f'2. e4 d c b a
  }
}

SopranoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _ _ _ _
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  _ rum, coe --
  lo -- _ _ _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 d~
    d2 d1 d2
    d1 c2 a
    f' e4 d c a a'2~
    a4 g f e d2 d~
    d d1 d2~
    d d b'4 a g fis
  }
}

AltoLyrics = \lyricmode {
  A -- %2
  ve Re --
  gi -- na coe --
  lo -- _ _ _ _ _
  _ _ _ rum, Re --
  gi -- na __
  coe -- lo -- _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 a
    a2 a a1
    f2 d b'2. a4
    g f d e f e f g
    a1 d
  }
}

TenoreLyrics = \lyricmode {
  A --
  ve Re -- gi --
  na coe -- lo -- _
  _ _ _ _ _ _ _ _
  _ rum,
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*6
    r1 d~
    d d
  }
}

BassoLyrics = \lyricmode {
  A --
  ve
}

Organo = {
  \relative c {
    \clef soprano
    \key d \dorian \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a''1 a2 a
    a1 << {
      f2 d
      b'2. a4 g f d e
      f g a h
    } \\ {
      d,1
      d2 d d1
      d
    } >> \clef tenor a1
    a2 a a1
    f2 d b'2. a4
    g f d e \clef bass d1~
    d~ d~
  }
}

BassFigures = \figuremode {
  <1>\breve
  r
  r
  r1 <3 5>
  <6>2 <5>1.
  <6>1 <5>
  <_->2 <6> <5 3>1
  r <#(dotbfflat 6) #(dotbf 4)>2. <5 _+>4
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
