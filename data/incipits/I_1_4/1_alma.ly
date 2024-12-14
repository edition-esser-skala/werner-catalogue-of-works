\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    c'1 c2 c
    d h c c~
    c h4 c d1
    d2 d e d4 c
    h2 c1 d2
    g,2 g a g4 f
    e1 d
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    e1 e2 f~
    f d g e
    fis g1 \hA fis2
    g1 r
    r2 g a g4 f!
    e2 e c d~
    d c h1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1 c2 c
    d h c c~
    c h4 c d1
    d2 d e d4 c
    h2 c1 d2
    g,2 g a g4 f
    e1 d
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma Re --
  dem -- pto -- ris Ma --
  _ _ _
  ter, quae per -- vi -- a
  coe -- _ _
  li, quae per -- vi -- a
  coe -- li
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e1 e2 f~
    f d g e
    fis g1 \hA fis2
    g1 r
    r2 g a g4 f!
    e2 e c d~
    d c h1
  }
}

AltoLyrics = \lyricmode {
    Al -- ma Re --
  dem -- pto -- ris
  Ma -- _ _
  ter,
  quae per -- vi -- a
  coe -- li por -- ta __
  ma -- nes
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a1 a
    a2 g g c
    a g a1
    h2 h c h4 a
    g1 f2 g
    g c1 h4 a
    g1 g2 h
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma,
  al -- ma Re -- dem --
  pto -- ris Ma --
  ter, quae per -- vi -- a
  coe -- li por --
  ta ma -- _ _
  _ nes et
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'1 a2 f~
    f g e c
    d\breve
    g,1 r
    r2 e' f e4 d
    c2. c4 a2 h
    c1 g2 g'
  }
}

BassoLyrics = \lyricmode {
  Al -- ma Re --
  dem -- pto -- ris
  Ma --
  ter,
  quae per -- vi -- a
  coe -- li por -- ta
  ma -- nes et
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1. f2~
    f g e c
    d\breve
    g,2 \clef tenor h' c h4 a
    g2 \clef bass e f e4 d
    c2. c4 a2 h
    c1 g2 g'
  }
}

BassFigures = \figuremode {
  r1. <5>2
  <6>1 q
  <7 _+>2 <6 4> <5 \t> <\t _+>
  r <10> q q4 q
  q\breve
  r1. <6>2
  <9> <8>1.
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
