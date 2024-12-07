\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*2
    g'2 a g4 c~
    c h c a g2
    r r4 c g' g
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c2 d c4 f~
    f e f d e c
    d e c f e2
    r r r4 c
    f f e8 f g e d4. d8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*2
    g'2 a g4 c~
    c h c a g2
    r r4 c g' g
  }
}

SopranoLyricsA = \lyricmode {
  Ex -- ul -- tet or --
  bis gau -- di -- is:
  Coe -- lum "re -"
}

SopranoLyricsB = \lyricmode {
  Qui tem -- pla coe --
  li clau -- di -- tis
  se -- ras -- que
}

SopranoLyricsC = \lyricmode {
  Pa -- tri, si -- mul --
  que Fi -- li -- o,
  ti -- bi -- que,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c2 d c4 f~
    f e f d e c
    d e c f e2
    r r r4 c
    f f e8[ f] g[ e] d4. d8
  }
}

AltoLyricsA = \lyricmode {
  Ex -- ul -- tet or --
  bis gau -- di -- is, or --
  _ bis gau -- di -- is:
  Coe --
  lum re -- sul -- tet lau -- "di -"
}

AltoLyricsB = \lyricmode {
  Qui tem -- pla coe --
  li clau -- di -- tis, coe --
  _ li clau -- di -- tis
  se --
  ras -- que ver -- bo sol -- "vi -"
}

AltoLyricsC = \lyricmode {
  Pa -- tri, si -- mul --
  que Fi -- li -- o, si --
  mul -- que Fi -- li -- o,
  ti --
  bi -- que, San -- cte Spi -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 g a
    g4 c2 h4 c a
    h c a4. h8 c2
    d4. d8 g,4 r r2
    r4 f c' c h8[ c] d[ h]
  }
}

TenoreLyricsA = \lyricmode {
  Ex -- ul --
  tet or -- bis gau -- di --
  is, or -- _ _ bis
  gau -- di -- is:
  Coe -- lum re -- sul -- tet
}

TenoreLyricsB = \lyricmode {
  Qui tem --
  pla coe -- li clau -- di --
  tis, coe -- _ _ li
  clau -- di -- tis
  se -- ras -- que ver -- bo
}

TenoreLyricsC = \lyricmode {
  Pa -- tri,
  si -- mul -- que Fi -- li --
  o, si -- mul -- _ que
  Fi -- li -- o,
  ti -- bi -- que, San -- cte
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.
    c2 d c4 f~
    f e f d e a
    g4. f8 e4 f2 e4
    d2 c r4 g'
  }
}

BassoLyricsA = \lyricmode {
  Ex -- ul -- tet or --
  bis gau -- di -- is, ex --
  ul -- tet or -- bis gau --
  di -- is: "Coe -"
}

BassoLyricsB = \lyricmode {
  Qui tem -- pla coe --
  li clau -- _ di -- tis,
  coe -- _ li clau -- _
  di -- tis "se -"
}

BassoLyricsC = \lyricmode {
  Pa -- tri, si -- mul --
  que Fi -- li -- o, si --
  mul -- _ que Fi -- _
  li -- o, "ti -"
}

Organo = {
  \relative c {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    << { c'2 d c4 f } \\ { r2 g, a } >>
    \clef bass c, d c4 f~
    f e f d e a
    g4. f8 e4 f2 e4
    d2 c r4 g'
  }
}

BassFigures = \figuremode {
  r1.
  <4>4 <3> <7> <6>2.
  <4 2>4 <6>2 <6 5>4 <6>2
  <4>4 <3> <6> <3> <2> <6>
  <7> <6> r1
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
