\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 a'
    h c2. \hA h4
    a2 d1 c2
    h1 e,2 e'
  }
}

SopranoLyrics = \lyricmode {
  Ky --
  ri -- e __ _
  _ e -- _
  lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 d
    e f2. e4
    d2 g2. f4 e2
    f2. g4 a e a2~
    a gis a1
  }
}

AltoLyrics = \lyricmode {
  Ky --
  ri -- e __ _
  _ e -- _ _
  lei -- _ _ _ _
  _ son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a1 h
    c2. h4 a2 d~
    d cis d2. c4
    h2 e2. d4 c2
    d1 e2 e
    d1 c2 a4 h?
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e __ _ _ e --
  _ lei -- _
  son, e -- _ _
  lei -- son, e --
  lei -- son, e -- \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1 e
    f2. e4 d2 g4 f
    e2 a4 g f e f2
    e1 d
    R\breve
    r1 a
    h c2. \hA h4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e __ _ _ e -- _
  _ _ _ _ _ _
  lei -- son,

  Ky --
  ri -- e __ _
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    d1-! e-!
    << {
      a h
      c2. h4 a2
    } \\ {
      f2. e4 d2 g4 f
      e2 a4 g f e f2
      e1 d2
    } >> \clef tenor d'4 c!
    h2 e2. d4 c2
    d1 \clef bass a,
    h c2. \hA h4
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r1. <6>2
  <7> <6\\> r1
  <6>2 <5> <6> q
  <5> <8> <4> <3>
  <7> <6\\> <6>1
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
