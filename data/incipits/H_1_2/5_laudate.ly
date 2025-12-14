\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Alla capella"
    f2 a
    c c4. c8
    c2 c4 c
    d2 c
    R1
    r2 r4 c
    c8 a b c d4. d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Alla capella"
    R1
    c2 e
    f f4 f8 f
    f4 f a2
    g r
    r4 g g8 e f g
    a4 f2 g4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Alla capella"
    f2^\tutti a
    c c4. c8
    c2 c4 c
    d2 c
    R1
    r2 r4 c
    c8[ a] b[ c] d4. d8
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da --
  te Do -- mi --
  num, o -- mnes
  gen -- tes,

  lau --
  da -- te e -- um,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Alla capella"
    R1
    c2^\tutti e
    f f4 f8 f
    f4 f a2
    g r
    r4 g g8[ e] f[ g]
    a4 f f g
  }
}

AltoLyrics = \lyricmode {
  Lau -- da --
  te Do -- mi -- num,
  o -- mnes gen --
  tes,
  lau -- da -- te
  e -- um, o -- mnes
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Alla capella"
    R1*3
    r2 r4 f^\tutti
    e8[ c] d[ e] f4. e8
    d c b2 b4
    a4. a8 d4. b8
  }
}

TenoreLyrics = \lyricmode {
  Lau -- %4
  da -- te e -- um,
  o -- mnes po -- pu --
  li, lau -- da -- te
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Alla capella"
    R1*4
    r4 c'^\tutti a8[ f] g[ a]
    b[ a] g[ f] e4. e8
    f8. f16 g8 a b[ a b g]
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te
  e -- um, o -- mnes
  po -- pu -- li, lau -- "da -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Alla capella"
    f8-\tutti g a g f a g f
    e f e d c b a g
    f f' a g f f g a
    b b, d e f g a b
    c c, c' b a f g a
    b a g f e c d e
    f f g a b a b g
  }
}

BassFigures = \figuremode {
  r1
  <6>
  r
  r
  r1
  r2 <6>
  r <5>4 <6>
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
