\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \twotwotime \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    e'2. e4 a,2 d
    c1 h2 h
    a a4 h c d e d8 e
  }
}

ViolaII = {
  \relative c' {
    \clef soprano
    \twotwotime \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 a'2. a4
    e2 g f2. g4
    a1 g
    r2 f g2. g4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    e'2. e4 a,2 d
    c1 h2 h
    a a4 h c d e d8[ e]
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma Re -- dem --
  pto -- ris, quae
  per -- vi -- a coe -- li por -- ta
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 a'2. a4
    e2 g f2. g4
    a1 g
    r2 f g g4 g
  }
}

AltoLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- ris
  Ma -- ter,
  quae per -- vi -- a
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 e2. e4
    a,2 d c1
    h2 e~ e4 d a h
    c d e1 d2
    e e2. e4 d2
    c2. d4 g, g c2~
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto --
  ris Ma -- _ _ _
  _ _ _ ter,
  quae per -- vi -- a
  coe -- li por -- ta "ma -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'2. a4 e2 g
    f1 e4 a, a'2~
    a g f1
    c2 c d d4 d
    a h c d e f g2~
    g f e4 d c h
  }
}

BassoLyrics = \lyricmode {
  Al -- ma Re -- dem --
  pto -- ris _ Ma --
  ter, Ma --
  ter, quae per -- vi -- a
  coe -- _ _ _ _ _ _
  li por -- _ ta _
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key a \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    \mvTr a'2. a4 << {
      e'2. e4
      a,2 d c1
      h2 e
    } \\ {
      e,2 g
      f1 e4 a, a'2~
      a g
    } >> f1
    c2 c d1
    a4 h c d e f g2~
    g f e4 d c h
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r1 <3 7>4 <_ 6>2.
  r1 <9>2 <8>
  r1 <5>
  <4 2>2 <5 3>4 <6 4> <6>1
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
