\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 a'~
    a2 g a h
    c a g1
    a c~
    c2 c a1
    f'1. f2
    d1 r2 d~
  }
}

SopranoLyrics = \lyricmode {
  San --
  ctus, san -- _
  _ ctus, san --
  ctus Do --
  mi -- nus,
  Do -- mi --
  nus "De -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    f1. e2
    f e4 d c2 d
    e f1 e2
    f1 r
    a1. a2
    a1 f~
    f2 f g1
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- _ _ _ ctus,
  san -- _ _
  ctus
  Do -- mi --
  nus, Do --
  mi -- nus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    a2. g4 f g a2~
    a4 b c1 f,2
    g a4 b c1
    c r
    c1. c2
    d1 d~
    d2 d b1
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _ _ _
  _ _ ctus,
  san -- _ _ _
  ctus
  Do -- mi --
  nus, Do --
  mi -- nus
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1. c2
    d e f d
    c\breve
    f,1 r
    f'1. f2
    d1 b'~
    b2 b g1
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- _ _ ctus,
  san --
  ctus
  Do -- mi --
  nus, Do --
  mi -- nus
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1. c2
    d e f d
    c\breve
    f,1 r
    f'1. f2
    d1 b'~
    b2 b g1
  }
}

BassFigures = \figuremode {
  r1. <6>2
  r q1 <6!>2
  <5 3> <6 4> <5 \t> <\t 3>
  r\breve
  r
  <5>
  r
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
