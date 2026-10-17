\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Vivace"
    c'4.-\tutti c8 d4 f e d
    c b8 c a2 r
    r r4 f8 g a4 h
    c c b4. b8 a4 h
    c2. c4 c2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Vivace"
    r2 f4.-\tutti f8 g4 b
    a g f a b8 a f g
    a4 f8 g a4. g8 f e f4
    e c d e f4. f8
    e4 f2 e4 f2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    c'4.^\tutti c8 d4 f e d
    c b8[ c] a2 r
    r r4 f a h
    c c b4. b8 a4 h
    c4. c8 c2 r4 a^\solo
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  _ _ son,
  Chri -- ste, __ _
  Chri -- ste au -- di nos, ex --
  au -- di nos. "Pa -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    r2 f^\tutti g4 b
    a g f a b8[ a f g]
    a4 f8[ g] a4. g8 f2
    e4 c d e f4. f8
    e4 f2 e4 f2
  }
}

AltoLyrics = \lyricmode {
  Chri -- ste e --
  lei -- _ son, e -- lei --
  son, e -- lei -- _ _
  son, Chri -- ste ex -- au -- di,
  ex -- au -- di nos.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.
    c4.^\tutti c8 d4 f e d
    c2. a2 d4
    g, a b2 c4 d
    g, a g4. g8 a2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son, e -- lei --
  son, Chri -- ste au -- di
  nos, ex -- au -- di nos.
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.
    r2 f4.^\tutti f8 g4 b
    a4. g8 f4. e8 d2
    c4 a' g2 f4 d
    c f c4. c8 f,2
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ _ _
  son, e -- lei -- son, Chri --
  ste ex -- au -- di nos.
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 3/2 \tempoMarkup "Vivace"
    << { c''4. c8 d4 f e d } \\ { r2-\tutti f,4. f8 g4 b } >>
    \clef tenor c,2 \clef bass f, g4 b
    a4. g8 f4. e8 d2
    c4 a g2 f4 d'
    c f c2 f,4 f'~-\solo
  }
}

BassFigures = \figuremode {
  r1.
  <6>4 <5> <6> <8> <6> <3>
  <6>1 <5>4 <6!>
  r <6> <5> <6>2 <6!>4
  r2 <4>4 <3>2.
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
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
