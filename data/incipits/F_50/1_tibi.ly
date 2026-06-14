\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    R1.
    r2 r c'
    h4 e2 d4 c8 h c4~
    c8 d c h a2 g
    R1.
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    R1.
    r2 g' e4 a~
    a g f2 e4 e
    a g2 fis4 g2
    r r4 g2 d4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    R1.
    r2 r c'
    h4 e2 d4 c8[ h] c4~
    c8[ d] c[ h] a2 g
    R1.
  }
}

SopranoLyricsA = \lyricmode {
  Ti --
  bi Chri -- ste splen -- _
  dor Pa -- tris

}

SopranoLyricsB = \lyricmode {
  Quo
  cu -- sto -- de pro -- _
  cul pel -- le
}

SopranoLyricsC = \lyricmode {
  Glo --
  ri -- am Pa -- tri me --
  _ lo -- dis
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    R1.
    r2 g' e4 a~
    a g f2 e4 e
    a g2 fis4 g2
    r r4 g2 d4
  }
}

AltoLyricsA = \lyricmode {
  Ti -- bi Chri --
  ste splen -- dor, splen --
  dor Pa -- _ tris
  vi -- ta
}

AltoLyricsB = \lyricmode {
  Quo cu -- sto --
  de pro -- cul, pro --
  cul pel -- _ le
  Rex "Chri -"
}

AltoLyricsC = \lyricmode {
  Glo -- ri -- am __
  Pa -- tri, Pa -- tri
  me -- lo -- _ dis
  per -- "so -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    r2 c h4 e~
    e d c8[ h] c2 a4
    r c a h g r
    r d'2 a4 h4. a8
    h[ c] d4 g,8[ a] h[ c] d4. d8
  }
}

TenoreLyricsA = \lyricmode {
  Ti -- bi Chri --
  ste splen -- _ dor
  Pa -- _ _ tris
  vi -- ta vir -- _
  _ tus, vir -- tus cor -- "di -"
}

TenoreLyricsB = \lyricmode {
  Quo cu -- sto --
  de pro -- _ cul
  pel -- _ _ le
  Rex Chri -- ste, __ _
  Chri -- _ ste pi -- is -- "si -"
}

TenoreLyricsC = \lyricmode {
  Glo -- ri -- am __
  _ Pa -- _ tri
  me -- lo -- _ dis
  per -- so -- ne -- _
  _ mus vo -- _ _ "ci -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 3/2
    g'2 e4 a2 g4
    f2 e a4 f
    g c, d2 e4 a
    fis g d2 g,4 g'~
    g d e2 h
  }
}

BassoLyricsA = \lyricmode {
  Ti -- bi Chri -- ste
  splen -- dor, ti -- bi
  Chri -- ste splen -- dor, splen --
  _ dor Pa -- tris vi --
  ta vir -- tus
}

BassoLyricsB = \lyricmode {
  Quo cu -- sto -- de
  pro -- cul, quo cu --
  sto -- de pro -- cul, pro --
  _ cul pel -- le Rex __
  Chri -- ste "pi -"
}

BassoLyricsC = \lyricmode {
  Glo -- ri -- am Pa --
  tri me -- lo -- dis,
  glo -- ri -- am Pa -- tri __
  _ me -- lo -- dis per --
  so -- ne -- mus
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    << {
      s2 c' h4 e~
      e d
    } \\ {
      g,2 e4 a2 g4
      f2
    } >> e a4 f
    g c, d2 e4 a
    fis g d2 g,4 << {
      g'8 a
      h c d4 g,8 a h c
    } \\ {
      g4~
      g d e2
    } >> h
  }
}

BassFigures = \figuremode {
  r1.
  r2 <3 6>2 <5 3>
  <9>4 <10 5> <9 5 3> <8 6> <6>2
  <6 5> <4>4 <_+>2.
  r1 <6 3>2
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
    \new ChoirStaff \with { \setGroupDistance #16 #18 } <<
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
