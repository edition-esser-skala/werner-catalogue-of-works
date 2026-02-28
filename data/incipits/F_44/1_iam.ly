\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 e'
    d2 h c1
    h2 e1 d2
    e1 r2 h
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    a'1 g2 e
    f1 e2 a~
    a g a1
    r2 e d2. e4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 e'
    d2 h c1
    h2 e1 d2
    e1 r2 h
  }
}

SopranoLyricsA = \lyricmode {
  Iam
  sol re -- ce --
  dit i -- gne --
  us, tu
}

SopranoLyricsB = \lyricmode {
  Te
  ma -- ne lau --
  dum car -- mi --
  ne, te
}

SopranoLyricsC = \lyricmode {
  Pa --
  tri si -- mul --
  que Fi -- li --
  o "ti -"
}

Alto = {
  \relative c' {
    \clef alto
    \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    a'1 g2 e
    f1 e2 a~
    a g a1
    r2 e d2. e4
  }
}

AltoLyricsA = \lyricmode {
  Iam sol re --
  ce -- dit i --
  gne -- us,
  tu lux "per -"
}

AltoLyricsB = \lyricmode {
  Te ma -- ne
  lau -- dum car --
  mi -- ne,
  te de -- "pre -"
}

AltoLyricsC = \lyricmode {
  Pa -- tri si --
  mul -- que Fi --
  li -- o
  ti -- bi -- que
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e1 d2 h
    c1 h2 e~
    e d e1
    a,2 d g, r
    r h a2. h4
    c1 h
  }
}

TenoreLyricsA = \lyricmode {
  Iam sol re --
  ce -- dit i --
  gne -- us,
  i -- gne -- us,
  tu lux per --
  en -- nis,
}

TenoreLyricsB = \lyricmode {
  Te ma -- ne
  lau -- dum car --
  mi -- ne,
  car -- mi -- ne,
  te de -- pre --
  ce -- mur,
}

TenoreLyricsC = \lyricmode {
  Pa -- tri si --
  mul -- que Fi --
  li -- o,
  Fi -- li -- o
  ti -- bi -- que
  San -- cte,
}

Basso = {
  \relative c {
    \clef bass
    \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r2 a' g e
    f1 e2 c
    d2. d4 c2. d4
    e2 e f2. f4
    e2 c g'1
  }
}

BassoLyricsA = \lyricmode {
  Iam sol re --
  ce -- dit i --
  _ gne -- us, re --
  ce -- dit i -- gne --
  us, tu lux
}

BassoLyricsB = \lyricmode {
  Te ma -- ne
  lau -- dum car --
  _ mi -- ne, __ _
  lau -- dum car -- mi --
  ne, te "de -"
}

BassoLyricsC = \lyricmode {
  Pa -- tri si --
  mul -- que Fi --
  _ li -- o, si --
  mul -- que Fi -- li --
  o ti -- "bi -"
}

Organo = {
  \relative c {
    \clef tenor
    \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    e'1 d2 h
    << { c1 h2 e } \\ { r2 a, g e } >>
    \clef bass f1 e2 c
    d1 c2. d4
    e1 f
    e2 c g'1
  }
}

BassFigures = \figuremode {
  r\breve
  r
  <3 7>2 <_ 6> <3 8>1
  <5>2 <6> <8> <6>
  <4> <3> <7 3> <6 \t>4 <\t 4>
  <6>1 <#(dotbf 5)>2. <6>4
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
    \new ChoirStaff \with { \setGroupDistance #16 #16 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB
      \new Lyrics \lyricsto Alto \AltoLyricsC

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
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
