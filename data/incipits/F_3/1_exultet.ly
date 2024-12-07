\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    a'2 h g4 h
    c4. c8 d4 c h4. h8
    a4 h c d e d
    d4. d8 e4 e d e
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    e2 d4 e2 f4
    g f f e d e
    e g2 f4 e a
    g4. g8 g4 g g g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    a'2 h g4 h
    c4. c8 d4 c h4. h8
    a4 h c d e d
    d4. d8 e4 e d e
  }
}

SopranoLyricsA = \lyricmode {
  Ex -- ul -- tet, ex --
  ul -- tet or -- bis gau -- di --
  is: Coe -- lum re -- sul -- tet
  lau -- di -- bus: A -- po -- "sto -"
}

SopranoLyricsB = \lyricmode {
  Qui tem -- _ pla,
  tem -- pla coe -- li clau -- di --
  tis se -- ras -- que ver -- bo
  sol -- vi -- tis nos a "re -"
}

SopranoLyricsC = \lyricmode {
  Pa -- tri, Pa -- tri,
  si -- _ mul -- que Fi -- li --
  o, ti -- bi -- que, San -- cte
  Spi -- ri -- tus, si -- cut "fu -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    e2 d4 e e f
    g f f e d e
    e g g f e a
    g4. g8 g4 g g g
  }
}

AltoLyricsA = \lyricmode {
  Ex -- ul -- _ tet, ex --
  ul -- tet or -- bis gau -- di --
  is: Coe -- lum re -- sul -- tet
  lau -- di -- bus: A -- po -- "sto -"
}

AltoLyricsB = \lyricmode {
  Qui tem -- _ pla, tem --
  _ pla coe -- li clau -- di --
  tis se -- ras -- que ver -- bo
  sol -- vi -- tis nos a "re -"
}

AltoLyricsC = \lyricmode {
  Pa -- tri, Pa -- tri, si --
  mul, si -- mul -- que Fi -- li --
  o, ti -- bi -- que, San -- cte
  Spi -- ri -- tus, si -- cut "fu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 c d h c d
    e a, a a h4. h8
    c4 d e a,8[ h] c4 c
    c h c c d a
  }
}

TenoreLyricsA = \lyricmode {
  Ex -- ul -- _ tet, ex --
  ul -- tet or -- bis gau -- di --
  is: Coe -- lum re -- sul -- tet
  lau -- di -- bus: A -- po -- "sto -"
}

TenoreLyricsB = \lyricmode {
  Qui tem -- _ pla, tem --
  _ pla coe -- li clau -- di --
  tis se -- ras -- que ver -- bo
  sol -- vi -- tis nos a "re -"
}

TenoreLyricsC = \lyricmode {
  Pa -- tri, Pa -- _ _
  tri, si -- mul -- que Fi -- li --
  o, ti -- bi -- que, San -- cte
  Spi -- ri -- tus, si -- cut "fu -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    a4 a'2 g8[ f] e4 d
    c f d a'2 gis4
    a g8[ f] e4 d c f
    g4. g8 c,4 c h cis
  }
}

BassoLyricsA = \lyricmode {
  Ex -- ul -- _ _ tet
  or -- bis gau -- _ di --
  is: Coe -- lum re -- sul -- tet
  lau -- di -- bus: A -- po -- "sto -"
}

BassoLyricsB = \lyricmode {
  Qui tem -- _ _ pla
  coe -- li clau -- _ di --
  tis se -- ras -- que ver -- bo
  sol -- vi -- tis nos a "re -"
}

BassoLyricsC = \lyricmode {
  Pa -- _ _ tri, si --
  mul -- que Fi -- _ li --
  o, ti -- bi -- que, San -- cte
  Spi -- ri -- tus, si -- cut "fu -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    a4 a'2 g8 f e4 d
    c f d a'2 gis4
    a g!8 f e4 d c f
    g g, c2 h4 cis
  }
}

BassFigures = \figuremode {
  r4 <3> <2> r <6> q
  r2. <3>4 <2> r
  r2 <6>4 <5>8 <6>4. <6 5>4
  <4> <3> r2 r4 <6 5>
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
