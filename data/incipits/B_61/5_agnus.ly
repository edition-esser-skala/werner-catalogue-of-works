\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    h'1 c
    h2. h4 e2 d~
    d cis dis e
    fis1. e2~
    e e1 dis4 cis
    dis2 fis1 a,2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol --
  _ lis pec --
  ca -- ta __
  mun -- _ _
  di: Mi -- "se -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    g'1. a2~
    a g1 fis2
    e e a c!
    h a g1~
    g2 g g1
    fis r
  }
}

AltoLyrics = \lyricmode {
  A -- gnus __
  De -- _
  i, qui tol -- _
  lis pec -- ca --
  ta mun --
  di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    d2. d4 e2 d
    d r a1
    a2 a1 g2
    fis fis' h,1
    c2 e cis1~
    cis2 h r1
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui
  tol -- lis pec --
  ca -- ta, pec --
  ca -- ta mun --
  di:
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    g'1. fis2
    g e cis d
    a'2. g4 fis2 e
    dis1 e
    c ais
    h r
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- _ i, qui
  tol -- _ lis pec --
  ca -- ta
  mun -- _
  di:
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    g'1. fis2
    g e cis d
    a'2. g4 fis2 e
    dis1 e
    c ais
    h r
  }
}

BassFigures = \figuremode {
  r1 <6 4>2 <6 5>
  <9> <10 5> <6 5>1
  <4>2 <_+> <6\\> <8 6>
  <6> <5> <9> <8>
  <5>1 <7 5>
  <9\\ _+>2 <8 \t>1.
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
