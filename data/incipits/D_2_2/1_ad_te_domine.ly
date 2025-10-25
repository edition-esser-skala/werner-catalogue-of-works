\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key g \dorian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g'1 b
    a2. a4 f2 d
    d'2. c4 b g b c
    d a d2. c4 b a
    b g a b c1~
    c2 b4 c d1~
    d2 cis d1
    r2 d2. d4 c2
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    d1 es
    d2. d4 b2 g
    g'2. f4 es c \hA es f
    g d g2. f4 d2
    e! a2. g4 f e
    f d b' a g1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \dorian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    g'1 b
    a2. a4 f2 d
    d'2. c4 b g b c
    d a d2. c4 b a
    b g a b c1~
    c2 b4 c d1~
    d2 cis d1
    r2 d2. d4 c2
  }
}

SopranoLyrics = \lyricmode {
  Ad te,
  Do -- mi -- ne, le --
  va -- _ _ _ _ _
  _ _ _ _ _ _
  _ _ _ _ _
  _ _ _
  _ vi
  a -- ni -- mam
}

Alto = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    d1 es
    d2. d4 b2 g
    g'2. f4 es c \hA es f
    g d g2. f4 d2
    e! a2. g4 f e
    f d b' a g1
  }
}

AltoLyrics = \lyricmode {
  Ad te, %3
  Do -- mi -- ne, le --
  va -- _ _ _ _ _
  _ _ _ _ _
  _ _ _ _ _
  _ _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \dorian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*5
    g1 b
    a2. a4 f2 d
    d'2. c!4 b2 c
  }
}

TenoreLyrics = \lyricmode {
  Ad te, %6
  Do -- mi -- ne, le --
  va -- _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*7
    d1 es
  }
}

BassoLyrics = \lyricmode {
  Ad te,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \dorian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g''1 b
    a2. a4 f2 d
    << {
      d'2. c4 b g b c
      d a d2. c4 b a
      b g a b c1
    } \\ {
      d,1 es
      d2. d4 b2 g
      g'2. f4 es c \hA es f
    } >>
    \clef tenor g,1 b
    a2. a4 f2 d
    \clef bass d1 es
  }
}

BassFigures = \figuremode {
  <1>1 q
  r\breve
  r
  r
  r
  <4>2 <3> <6> <5>
  <4> <_+>1.
  <5>2 <6> <7> <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
