\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \tempoMarkup "Tempo giusto"
    \partial 4 d'4 g,2 a4
    h2 cis4
    d2 e4
    d8( a) fis d d'4
    g,2 a4
    h2 cis4
    d2 e4
    d a8 fis d4
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \tempoMarkup "Tempo giusto"
    \partial 4 d'4 g,2 a4
    h2 cis4
    d2 e4
    d8( a) fis d d'4
    g,2 a4
    h2 cis4
    d2 e4
    d a8 fis d4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    \partial 4 d'4 g,2 a4
    h2 cis4
    d2 e4
    d2 d4
    g,2 a4
    h2 cis4
    d2 e4
    d2 r4
  }
}

SopranoLyricsA = \lyricmode {
  In dul -- ci
  ju -- bi --
  lo, __ _
  _ nun
  ſin -- get
  und seydt
  froh, __ _
  _
}

SopranoLyricsB = \lyricmode {
  Ô Je -- su
  Par -- vu --
  le, __ _
  _ nach
  dir iſt
  mir ſo
  weh, __ _
  _
}

SopranoLyricsC = \lyricmode {
  Ma -- ter et
  Fi -- li --
  a __ _
  _ iſt
  Jung -- frau
  Ma -- ri --
  a, __ _
  _
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    \partial 4 r4 r r fis
    g2 e4
    a( fis) e
    fis2 r4
    r r fis
    g g e
    a fis e
    fis2 r4
  }
}

AltoLyricsA = \lyricmode {
  In
  dul -- ci
  ju -- bi --
  lo,
  nun
  ſingt und seydt
  froh, und seydt
  froh,
}

AltoLyricsB = \lyricmode {
  Ô
  Je -- su
  Par -- vu --
  le,
  nach
  dir iſt mir,
  iſt mir ſo
  weh,
}

AltoLyricsC = \lyricmode {
  Ma --
  ter et
  Fi -- li --
  a
  iſt
  Jung -- _ frau
  Ma -- _ ri --
  a,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    \partial 4 r4 r r d
    d( e) cis8[ h]
    a4( d) cis
    d2 r4
    r r d
    d e cis
    a d cis
    d2 r4
  }
}

TenoreLyricsA = \lyricmode {
  In
  dul -- ci
  ju -- bi --
  lo,
  nun
  ſingt und seydt
  froh, und seydt
  froh,
}

TenoreLyricsB = \lyricmode {
  Ô
  Je -- su
  Par -- vu --
  le,
  nach
  dir iſt mir,
  iſt mir ſo
  weh,
}

TenoreLyricsC = \lyricmode {
  Ma --
  ter __ et
  Fi -- li --
  a
  iſt
  Jung -- _ frau
  Ma -- _ ri --
  a,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    \partial 4 r4 r r d'
    g,( e) a
    fis( d) a'
    d,2 r4
    r r d'
    g, e a
    fis d a
    d2 r4
  }
}

BassoLyricsA = \lyricmode {
  In
  dul -- ci
  ju -- bi --
  lo,
  nun
  ſingt und seydt
  froh, und seydt
  froh,
}

BassoLyricsB = \lyricmode {
  Ô
  Je -- su
  Par -- vu --
  le,
  nach
  dir iſt mir,
  iſt mir ſo
  weh,
}

BassoLyricsC = \lyricmode {
  Ma --
  ter __ et
  Fi -- li --
  a
  iſt
  Jung -- _ frau
  Ma -- _ ri --
  a,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 3/4 \tempoMarkup "Tempo giusto"
    \partial 4 d''4-! g,2-! \clef bass d4
    g, e a
    fis d a'
    d,2 \clef soprano d''4-!
    g,2-! \clef bass d4
    g, e a
    fis d a'
    d,2 r4
  }
}

BassFigures = \figuremode {
  r4 r2.
  r2 <_+>4
  <6>2 <_+>4
  r2.
  r
  r2 <_+>4
  <6>2 <_+>4
  r2.
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
