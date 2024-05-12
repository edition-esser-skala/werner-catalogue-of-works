\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    g'1 c
    h2 e1 d2
    c c h1
  }
}

SopranoLyrics = \lyricmode {
  O sa --
  lu -- ta -- ris
  ho -- sti -- a,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2  \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1 g'
    e2 a1 g2
    f f e1
    d2 g1 e2
    e4 f g2 a2. a4
    g2 g d e
  }
}

AltoLyrics = \lyricmode {
  O sa --
  lu -- ta -- ris
  ho -- sti -- a,
  o sa -- lu --
  ta -- _ ris ho -- sti --
  a, quae coe -- li
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 g
    c h2 e~
    e d c c
    h1 r
    r2 e a, h
    c c, g'2. g4
  }
}

TenoreLyrics = \lyricmode {
  O
  sa -- lu -- ta --
  ris ho -- sti --
  a,
  quae coe -- li
  pan -- dis o -- "sti -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 c
    g' e2 a~
    a g f f
    e1 r2 g
  }
}

BassoLyrics = \lyricmode {
  O
  sa -- lu -- ta --
  ris ho -- sti --
  a, quae
}

Organo = {
  \relative c {
    \clef tenor
    \key c \major \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    << {
      c'1 g'
      e2 a1 g2
      f1
    } \\ {
      r1 g,
      c h2 e~
      e d
    } >> \clef bass c,1
    g' e2 a~
    a g f1
    e r2 g
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r1 <6>2 <3>
  <5 2> <6> <7 3> <6 4>
  <6>\breve
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
