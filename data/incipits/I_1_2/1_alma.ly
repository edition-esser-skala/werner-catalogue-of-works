\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 2/1 \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    d'1. c2
    b4 a b2 a a
    h cis d4 e f e
    d cis d1 cis2
    d1 r
  }
}

ViolaII = {
  \relative c' {
    \clef soprano
    \key d \minor \time 2/1 \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    r1 a'~
    a2 g f4 e f e
    d2 e f4 g a2
    g e f4 g a2~
    a g a1
    R\breve
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 2/1 \tempoMarkup "Moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    d'1. c2
    b4 a b2 a a
    h cis d4 e f e
    d cis d2 d cis
    d1 r
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma
  Re -- _ dem -- pto -- ris
  Ma -- ter, Re -- _ dem -- _
  pto -- _ ris Ma -- _
  ter,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 2/1 \tempoMarkup "Moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 a'~
    a2 g f4 e f e
    d2 e f4 g a2
    g e f4 g a2~
    a g a1
    R\breve
  }
}

AltoLyrics = \lyricmode {
  Al --
  ma Ma -- _ _ _
  ter, Ma -- ter, _ Re --
  dem -- pto -- ris _ Ma --
  _ ter,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 2/1 \tempoMarkup "Moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1. c2
    b4 a b2 a1
    r a2 d
    g,4 e'8[ d] cis4 h? a2. b8[ c]
    d[ e] f4 e d e2 a,
    f' f4 e d cis d f
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- ris,
  Re -- dem --
  pto -- _ _ ris Ma -- _
  _ _ _ _ ter, quae
  per -- vi -- a coe -- _ li
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 2/1 \tempoMarkup "Moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 a'~
    a2 g f4 e f2
    e a4 g f e d c!
    b1 a
    r2 d b' b4 a
  }
}

BassoLyrics = \lyricmode {
  Al --
  ma Re -- _ dem --
  pto -- ris _ Ma -- _ _ _
  _ ter,
  quae per -- vi -- a
}

Organo = {
  \relative c {
    \clef tenor
    \key d \minor \time 2/1 \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    << { r1 a'' } \\ { d,1.-! c2 } >>
    b4 a b2 \clef bass a1~
    a2 g f4 e f2
    e a4 g f e d c!
    b1 a
    r2 d b'2. a4
  }
}

BassFigures = \figuremode {
  r\breve
  <10 7>2 <\t 6> <6 4> <5 3>
  <4 2> <6> <8 5> <6>
  <8 5!> <_+> <6>1
  <7>2 <6> <5 4> <\t _+>
  r1.. <6>4
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
