\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \autoBeamOff
    a'2 f' e
    d1 cis2
    d d,2. e4
    f2 e e
    d1 r2
    R1.
  }
}

SopranoLyrics = \lyricmode {
  Da pa -- cem,
  Do -- mi --
  ne, pa -- _
  cem, Do -- mi --
  ne,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \autoBeamOff
    R1.*2
    d1 a'2
    b a2. g4
    f2 d4 e f g
    a1 gis2
  }
}

AltoLyrics = \lyricmode {
  Da pa -- %3
  cem, Do -- _
  _ _ _ _ _
  _ "mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \autoBeamOff
    f2 d cis
    d e2. e4
    a,1 r2
    R1.
    a1 d2
    f e2. d4
  }
}

TenoreLyrics = \lyricmode {
  Da pa -- _
  cem, Do -- mi --
  ne,

  da pa --
  cem, "Do -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \autoBeamOff
    d1 a'2
    b a2. g4
    f2. g4 f e
    d1 cis2
    d f4 e d2~
    d c! e
  }
}

BassoLyrics = \lyricmode {
  Da pa --
  cem, Do -- _
  _ _ _ _
  _ mi --
  ne, pa -- _ cem, __
  Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2
    d1 a'2
    b a2. g4
    f2. g4 f e
    d1 cis2
    d f4 e d2~
    d c! e
  }
}

BassFigures = \figuremode {
  r1 <_+>2
  <5>4 <6> <5 4>2 <\t _+>
  <6>1 r4 r
  <6 3>2 <5 2> r
  r <6>1
  r2 <6> <_+>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "S" "vl 1" }
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "A" "vl 2" }
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
