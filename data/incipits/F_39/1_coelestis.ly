\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r8 a' a a d4 f
    e4. d8 c a c4~
    c h c r
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    r8 e e e a4 c
    h a4. gis16 fis \hA gis4
    a8 e4 fis8 gis gis a a
    h a gis16 a h8 e,8. f16 g8 a
    g4. g8 g g g g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r8 a' a a d4 f
    e4. d8 c a c4~
    c h c r
  }
}

SopranoLyricsA = \lyricmode {
  Coe -- le -- stis urbs Je --
  ru -- sa -- lem, Je -- ru --
  sa -- lem,
}

SopranoLyricsB = \lyricmode {
  De -- cus pa -- ren -- ti
  de -- bi -- tum, pa -- ren --
  _ ti
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r8 e e e a4 c
    h a4. gis16[ fis] \hA gis4
    a8 e4 fis8 gis gis a a
    h[ a] gis16[ a h8] e,8.[ f16] g8[ a]
    g4. g8 g g g g
  }
}

AltoLyricsA = \lyricmode {
  Coe -- le -- stis urbs Je --
  ru -- _ _ sa --
  lem, Je -- _ ru -- sa -- lem, coe --
  le -- _ stis __ Je --
  ru -- sa -- lem, be -- a -- ta
}

AltoLyricsB = \lyricmode {
  De -- cus pa -- ren -- ti
  de -- _ _ bi --
  tum, de -- _ cus pa -- ren -- ti
  de -- bi -- tum, __ de --
  _ bi -- tum sit us -- "que -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r8 a a a
    d4 f e4. d8
    c4 e d4. c8
    h4 r r2
    r8 d d d e e c4
  }
}

TenoreLyricsA = \lyricmode {
  Coe -- le -- stis
  urbs Je -- ru -- sa --
  lem, Je -- ru -- sa --
  lem,
  be -- a -- ta pa -- cis, "pa -"
}

TenoreLyricsB = \lyricmode {
  De -- cus pa --
  ren -- ti de -- bi --
  tum, __ _ de -- bi --
  tum
  sit us -- que -- qua -- que, sit
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r2 r8 e e e
    a4 c h a
    gis e a8[ g16 f] e8[ f]
    g4. g8 c,4 r
  }
}

BassoLyricsA = \lyricmode {
  Coe -- le -- stis
  urbs Je -- ru -- sa --
  lem, Je -- ru -- _
  _ sa -- lem,
}

BassoLyricsB = \lyricmode {
  De -- cus pa --
  ren -- ti de -- bi --
  tum, pa -- ren -- ti
  de -- bi -- tum
}

Organo = {
  \relative c {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    r8 << {
      e' e e a4 c
      h a4.
    } \\ {
      s4. r8 a, a a
      d4 f e8
    } >> \clef bass e, e e
    a4 c h a
    gis e a8 g16 f e8 f
    g2 c,8 \clef alto << { g''[ g g] } \\ { e8 c4 } >>
  }
}

BassFigures = \figuremode {
  r1
  r2 r8 <_+>4.
  r4 <6 3>8 <\t 4\+> <6\\>4 <6>
  <6>2. q4
  <4> <3>2.
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
