\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    b'2 c a4 f
    r b c d es4. es8
    d4 f es es c4. c8
    b2 r r
    r r r4 b
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    r2 es f
    d4 b r f' g a
    b4. b8 g4 g a a
    f2 r r
    r4 f g a b4. b8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    b'2 c a4 f
    r b c d es4. es8
    d4 f es es c4. c8
    b2 r r
    r r r4 b
  }
}

SopranoLyricsA = \lyricmode {
  Tri -- stes e -- rant,
  e -- rant A -- po -- sto --
  li, e -- rant A -- po -- sto --
  li,
  "e -"
}

SopranoLyricsB = \lyricmode {
  Ga -- li -- lae -- ae
  ad al -- ta mon -- ti --
  um, ad al -- ta mon -- ti --
  um,
  ad
}

SopranoLyricsC = \lyricmode {
  De -- o Pa -- tri,
  Pa -- tri sit glo -- ri --
  a, Pa -- tri sit glo -- ri --
  a
  "Pa -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 es f
    d4 b r f' g a
    b4. b8 g4 g a a
    f2 r r
    r4 f g a b4. b8
  }
}

AltoLyricsA = \lyricmode {
  Tri -- stes
  e -- rant, e -- rant A --
  po -- sto -- li, A -- po -- sto --
  li,
  e -- rant A -- po -- "sto -"
}

AltoLyricsB = \lyricmode {
  Ga -- li --
  lae -- ae ad al -- ta
  mon -- ti -- um, mon -- _ ti --
  um,
  ad al -- ta mon -- "ti -"
}

AltoLyricsC = \lyricmode {
  De -- o
  Pa -- tri, Pa -- tri sit
  glo -- ri -- a, sit glo -- ri --
  a,
  Pa -- tri sit glo -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*2
    b2 c a4 f
    r b c d es4. es8
    d2 c b
  }
}

TenoreLyricsA = \lyricmode {
  Tri -- stes e -- rant,
  e -- rant A -- po -- sto --
  li, tri -- stes
}

TenoreLyricsB = \lyricmode {
  Ga -- li -- lae -- ae
  ad al -- ta mon -- ti --
  um, al -- ta,
}

TenoreLyricsC = \lyricmode {
  De -- o Pa -- tri,
  Pa -- tri sit glo -- ri --
  a, De -- o
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*2
    r2 es f
    d4 b r f' g a
    b4. b8 a2 g
  }
}

BassoLyricsA = \lyricmode {
  Tri -- stes
  e -- rant, e -- rant A --
  po -- sto -- li, "tri -"
}

BassoLyricsB = \lyricmode {
  Ga -- li --
  lae -- ae ad al -- ta
  mon -- ti -- um, "al -"
}

BassoLyricsC = \lyricmode {
  De -- o
  Pa -- tri, Pa -- tri sit
  glo -- ri -- a, "Pa -"
}

Organo = {
  \relative c {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    << {
      b''2 c a4 f
      r b c d es2
    } \\ {
      r es, f
      d4 b r f' g a
    } >>
    \clef tenor b,2 \clef bass es, f
    d4 b r f' g a
    b4. b8 a2 g
  }
}

BassFigures = \figuremode {
  r1.
  r
  r2 <6>1
  q2. \bo <[6]>4 <6> \bc <[\t]>
  r2 <6> <5>4 <6!>
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
