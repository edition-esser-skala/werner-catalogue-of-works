\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 r2 e'
    a,4 c h a g fis e2~
    e dis e1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a'1 e4 f e d
    c h a1 gis2
    a a'1 g!2
    fis2. fis4 h,2 g'
    fis1 h,2 g'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 r2 e'
    a,4 c h a g fis e2~
    e dis e1
  }
}

SopranoLyrics = \lyricmode {
  Lau --
  da -- _ te __ _ Do -- _ _
  mi -- num,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a'1 e4 f e d
    c h a1 gis2
    a a'1 g!2
    fis2. fis4 h,2 g'
    fis1 h,2 g'
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- _ te __ _
  Do -- _ _ mi --
  num, o -- mnes
  gen -- tes, o -- mnes
  gen -- tes, "gen -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    r2 a a gis
    a4 h c a h2 h4 h
    a2. h8[ c] h2. h4
    c d e d8[ c] h1
    r r2 e
    a,4 c h a g fis e2~
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te
  Do -- _ _ _ _ mi -- num,
  o -- mnes gen -- tes,
  gen -- _ _ _ tes,
  lau --
  da -- _ te __ _ Do -- _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 e4 f e d
    c h a1 gis2
    a f'4 e d2 e
    a,4 h c d e h e2~
    e dis e1
    r r2 e
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- _ te __ _
  Do -- _ _ mi --
  num, o -- mnes gen -- _
  tes, _ o -- _ mnes _ gen --
  _ tes,
  "lau -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1 e4 f e d
    c h a1 gis2
    a f'4 e d2 e
    a,4 h c d e h e2~
    e dis e \clef tenor e'
    a,4 c h a g fis \clef bass e2
  }
}

BassFigures = \figuremode {
  r1 <4>2 <_+>
  r <3> <5 2>1
  r <6 5>2 <_+>
  r1 <4>4 <\t> <3>2
  <2\+> <6>1.
  <6\\ 5>4 <\t \t> <_+>1.
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
