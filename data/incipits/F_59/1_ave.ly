\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \tempoMarkup "Molto andante"
      \set Staff.timeSignatureFraction = 3/2
    R1.*2
    r2 g'2. a4
    h g a h c8 b a4
    g8 c, c' b a2 r
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \tempoMarkup "Molto andante"
      \set Staff.timeSignatureFraction = 3/2
    r2 c2. d4
    e c d e f2~
    f4 e8 d e4 d c e
    f e8 d c4 d c2
    r f4. f8 g4 b
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \tempoMarkup "Molto andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    R1.*2
    r2 g'2. a4
    h g a h c8[ b] a4
    g8[ c, c' b] a2 r
  }
}

SopranoLyricsA = \lyricmode {
  A -- ve
  ma -- ris, a -- ve ma -- ris
  stel -- la,
}

SopranoLyricsB = \lyricmode {
  Su -- mens
  il -- lud, su -- mens il -- lud
  A -- ve
}

SopranoLyricsC = \lyricmode {
  Sit laus
  De -- o, sit laus De -- o
  Pa -- tri,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \tempoMarkup "Molto andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    r2 c2. d4
    e c d e f2~
    f4 e8[ d] e4 d c e
    f e8[ d] c4 d c2
    r f4. f8 g4 b
  }
}

AltoLyricsA = \lyricmode {
  A -- ve
  ma -- ris stel -- la, a --
  _ _ ve ma -- ris
  stel -- _ _ _ la,
  De -- i ma -- ter,
}

AltoLyricsB = \lyricmode {
  Su -- mens
  il -- lud A -- ve, su --
  _ _ mens il -- lud
  A -- _ _ _ ve
  Ga -- bri -- e -- lis,
}

AltoLyricsC = \lyricmode {
  Sit laus
  De -- o, sit laus De --
  _ _ o, De -- o
  Pa -- _ _ _ tri,
  Chri -- sto sum -- mo
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \tempoMarkup "Molto andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    f,2. g4 a f
    g a b g a h
    c8[ g] c2 h8[ a] g4 c
    f,8[ d' c b] a4 f r2
    c'4. c8 d4 f e d
  }
}

TenoreLyricsA = \lyricmode {
  A -- ve ma -- ris
  stel -- la, ma -- ris, a -- ve
  ma -- _ ris stel -- la,
  stel -- _ la,
  De -- i ma -- ter, De -- i
}

TenoreLyricsB = \lyricmode {
  Su -- mens il -- lud
  A -- ve, su -- mens il -- lud
  A -- _ ve, il -- lud
  A -- _ ve
  Ga -- bri -- e -- lis o -- re,
}

TenoreLyricsC = \lyricmode {
  Sit laus De -- o
  Pa -- tri, sit laus De -- o
  Pa -- _ tri, De -- o
  Pa -- _ tri,
  Chri -- sto sum -- mo de -- cus,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Molto andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    R1.*2
    c2. d4 e c
    d e f d e f~
    f e f2 r
  }
}

BassoLyricsA = \lyricmode {
  A -- ve ma -- ris,
  a -- ve ma -- ris stel -- _
  _ la,
}

BassoLyricsB = \lyricmode {
  Su -- mens il -- lud,
  su -- mens il -- lud A -- _
  _ ve
}

BassoLyricsC = \lyricmode {
  Sit laus De -- o,
  sit laus De -- o Pa -- _
  _ tri,
}

Organo = {
  \relative c {
    \clef tenor
    \key f \major \time 3/2 \tempoMarkup "Molto andante"
      \set Staff.timeSignatureFraction = 3/2
    << {
      r2 c'2. d4
      e c d e f2
    } \\ {
      f,2. g4 a f
      g a b g a h
    } >>
    \clef bass c,2. d4 e c
    d e f d e f~
    f e f \clef tenor f' e d
  }
}

BassFigures = \figuremode {
  r1.
  r
  <4>2 <3>4 <6!> <6> q
  <6!> <6> <3> <6!> <6> <3>
  <5 2> <6> q <3> q <6>
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
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
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
