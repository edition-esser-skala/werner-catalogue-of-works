\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*3
    a'2. f4 b2
    a c2. b4
    a2 d2. cis4
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*3
    r2 d2. b4
    f'2 e g~
    g4 f8 g a4 g8 f e4 a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    R1.*3
    a'2. f4 b2
    a c2. b4
    a2 d2. cis4
  }
}

SopranoLyricsA = \lyricmode {
  A -- ve ma --
  ris stel -- _
  _ _ \hy
}

SopranoLyricsB = \lyricmode {
  Su -- mens il --
  lud A -- _
  _ _ \hy
}

SopranoLyricsC = \lyricmode {
  Sit laus De --
  o, De -- o
  Pa -- _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    R1.*3
    r2 d2. b4
    f'2 e g~
    g4 f8[ g] a4 g8[ f] e4 a
  }
}

AltoLyricsA = \lyricmode {
  A -- ve
  ma -- ris stel --
  _ _ la, ma -- ris
}

AltoLyricsB = \lyricmode {
  Su -- mens
  il -- lud A --
  _ _ ve, il -- lud
}

AltoLyricsC = \lyricmode {
  Sit laus
  De -- o Pa --
  _ _ tri, De -- o
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    a2. f4 b2
    a c2. b4
    a2 d2. cis4
    d2 r r
    R1.
    r2 r r4 a
  }
}

TenoreLyricsA = \lyricmode {
  A -- ve ma --
  ris stel -- _
  _ _ _
  la,

  "De -"
}

TenoreLyricsB = \lyricmode {
  Su -- mens il --
  lud A -- _
  _ _ _
  ve

  "Ga -"
}

TenoreLyricsC = \lyricmode {
  Sit laus De --
  o Pa -- _
  _ _ _
  tri,

  sit
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    r2 d2. b4
    f'2 e g~
    g4 f2 b4 a4. g8
    f4 e d2 g
    d a' e
    f2. e8[ d] a'2
  }
}

BassoLyricsA = \lyricmode {
  A -- ve
  ma -- ris stel --
  _ la, stel -- _
  _ _ la, ma --
  ris stel -- la,
  ma -- ris "stel -"
}

BassoLyricsB = \lyricmode {
  Su -- mens
  il -- lud A --
  _ ve, A -- _
  _ _ ve, su --
  mens il -- lud,
  il -- lud "A -"
}

BassoLyricsC = \lyricmode {
  Sit laus
  De -- o Pa --
  _ tri, De -- o
  Pa -- _ tri, sit
  laus De -- o,
  De -- o "Pa -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    << {
      a'2. f4 b2
      a c2. b4
      a2 d2. cis4
    } \\ {
      r2 d,2. b4
      f'2 e g~
      g4 f2 b4 a4. g8
    } >>
    f4 e d2 g
    d a' e
    f2. e8 d a'2
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  <6 3>
  r1 <6>4 <5>
  <9> <8> <6>2 <4>4 <_+>
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
