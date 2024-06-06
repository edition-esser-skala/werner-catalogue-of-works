\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 2/1 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 a'~
    a2 f c'1
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \dorian \time 2/1 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1. c2
    f1. e2
    d1. cis2
    d f1 e4 d
    c2 a a' g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 2/1 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 a'~
    a2 f c'1
  }
}

SopranoLyricsA = \lyricmode {
  A --
  ve "ma -"
}

SopranoLyricsB = \lyricmode {
  Su --
  mens "il -"
}

SopranoLyricsC = \lyricmode {
  Sit __
  laus "De -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 2/1 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1. c2
    f1. e2
    d1. cis2
    d f1 e4 d
    c2 a a' g
  }
}

AltoLyricsA = \lyricmode {
  A -- ve
  ma -- ris
  stel -- _
  la, ma -- ris __ _
  stel -- la, ma -- ris
}

AltoLyricsB = \lyricmode {
  Su -- mens
  il -- lud
  A -- _
  ve, il -- lud __ _
  A -- ve, il -- lud
}

AltoLyricsC = \lyricmode {
  Sit laus
  De -- o
  Pa -- _
  tri, De -- o __ _
  Pa -- tri, De -- o
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 2/1 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 a~
    a2 f c'1~
    c2 b a2. g4
    f e d1 e2
    f1. g2
  }
}

TenoreLyricsA = \lyricmode {
  A --
  ve ma --
  ris stel -- _
  la, __ _ De -- i
  ma -- ter
}

TenoreLyricsB = \lyricmode {
  Su --
  mens il --
  lud A -- _
  ve, __ _ su -- mens
  il -- lud
}

TenoreLyricsC = \lyricmode {
  Sit __
  laus De --
  o Pa -- _
  _ _ _ tri,
  De -- o
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 2/1 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    d1. c!2
    f1. e2
  }
}

BassoLyricsA = \lyricmode {
  A -- ve
  ma -- ris,
}

BassoLyricsB = \lyricmode {
  Su -- mens
  il -- lud,
}

BassoLyricsC = \lyricmode {
  Sit laus
  De -- o,
}

Organo = {
  \relative c {
    \clef tenor
    \key d \dorian \time 2/1 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    << {
      d'1. c2
      f1. e2
      d1. cis2
    } \\ {
      r1 a~
      a2 f c'1~
      c2 b a2. g4
    } >>
    \clef bass d1. c!2
    f1. e2
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r1. <6>2
  r\breve
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
    \new ChoirStaff \with { \setGroupDistance #18 #18 } <<
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
