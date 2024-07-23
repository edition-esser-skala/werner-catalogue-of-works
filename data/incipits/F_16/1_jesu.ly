\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    b'1 a2 f
    g c b2. b4
    a2 d g, c
    f, b c a
    \time 2/2 b g4 a
    \time 4/2 b c d2 c2. c4
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key b \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    es1 d2 b
    c f es2. es4
    d2 g c, f
    \time 2/2 b, es
    \time 4/2 f d es c4 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b'1 a2 f
    g c b2. b4
    a2 d g, c
    f, b c a
    \time 2/2 b g4 a
    \time 4/2 b c d2 c2. c4
  }
}

SopranoLyricsA = \lyricmode {
  Je -- su Dul --
  cis me -- mo -- ri --
  a, dans ve -- ra
  cor -- dis gau -- di --
  a, gau -- _
  _ _ _ _ "di -"
}

SopranoLyricsB = \lyricmode {
  Nec lin -- gua
  va -- let di -- ce --
  re, nec lit -- te --
  ra, nec lit -- te --
  ra ex -- _
  pri -- _ _ _ "me -"
}

SopranoLyricsC = \lyricmode {
  Sis Je -- su
  no -- strum gau -- di --
  um, qui es fu --
  tu -- rum prae -- mi --
  um, prae -- _
  _ _ _ _ "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    es1 d2 b
    c f es2. es4
    d2 g c, f
    \time 2/2 b, es
    \time 4/2 f d es c4 d
  }
}

AltoLyricsA = \lyricmode {
  Je -- su Dul --
  cis me -- mo -- ri --
  a, dans ve -- ra
  cor -- dis
  gau -- di -- a, "gau -"
}

AltoLyricsB = \lyricmode {
  Nec lin -- gua
  va -- let di -- ce --
  re, nec lit -- te --
  ra ex --
  pri -- me -- re, "ex -"
}

AltoLyricsC = \lyricmode {
  Sis Je -- su
  no -- strum gau -- di --
  um, qui es fu --
  tu -- rum
  prae -- mi -- um, "prae -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    b1 a2 f
    \time 2/2 g c
    \time 4/2 b2. b4 a1
  }
}

TenoreLyricsA = \lyricmode {
  Je -- su Dul --
  cis me --
  mo -- ri -- a,
}

TenoreLyricsB = \lyricmode {
  Nec lin -- gua
  va -- let
  di -- ce -- re,
}

TenoreLyricsC = \lyricmode {
  Sis Je -- su
  no -- strum
  gau -- di -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*4
    \time 2/2 es1
    \time 4/2 d2 b c f
  }
}

BassoLyricsA = \lyricmode {
  Je --
  su Dul -- cis "me -"
}

BassoLyricsB = \lyricmode {
  Nec
  lin -- gua va -- let
}

BassoLyricsC = \lyricmode {
  Sis
  Je -- su no -- strum
}

Organo = {
  \relative c {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    b''1 a2 f
    << {
      g c b1
      a2 d g, c
    } \\ {
      es,1 d2 b
      c f es1
    } >>
    \clef tenor b a2 f
    \time 2/2 \clef bass es1
    \time 4/2 d2 b c f
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r
  <5>2 <6>
  <6>1 q
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
