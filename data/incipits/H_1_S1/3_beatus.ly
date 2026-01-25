\version "2.24.2"
\include "header.ly"

Cornetto = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    b'2 b a
    b2. a4 b2
    c b2. b4
    a2 b4 b b b
    b2 b b
    c c c
    d d d
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    f2-\tutti g f
    f2. f4 f2
    f f e
    f f4 f f f
    g2 g f
    g f1
    f2 r r
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    d2-\tutti c c
    d2. c4 d2
    c d c4 b
    c2 d4 d d d
    b2 b b
    b b a
    b r r
  }
}

Fagotto = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    b'2 es, f
    b,2. f'4 b2
    a g1
    f2 d1
    es d2
    es f1
    b,2 r r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    b'2 b a
    b2. a4 b2
    c b2. b4
    a2 b4 b b b
    b2 b b
    c c1
    d2 d d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    f2 g f
    f2. f4 f2
    f f e
    f f4 f f f
    g2 g f
    g f1
    d'2 d d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    b'2^\tutti b a
    b2. a4 b2
    c b2. b4
    a2 b4 b b b
    b2 b b
    c c c
    d d d
  }
}

SopranoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui ti --
  met Do -- mi --
  num: In man -- da -- tis
  e -- ius vo --
  let ni -- mis.
  Po -- tens in
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    f2^\tutti g f
    f2. f4 f2
    f f e
    f f4 f f f
    g2 g f
    g f1
    f2 r r
  }
}

AltoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui ti --
  met Do -- mi --
  num: In man -- da -- tis
  e -- ius vo --
  let ni --
  mis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    d2^\tutti c c
    d2. c4 d2
    c d c4 b
    c2 d4 d d d
    b2 b b
    b b a
    b r r
  }
}

TenoreLyrics = \lyricmode {
  Be -- a -- tus
  vir qui ti --
  met Do -- mi -- _
  num: In man -- da -- tis
  e -- ius vo --
  let ni -- _
  mis.
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    b'2^\tutti es, f
    b,2. f'4 b2
    a g2. g4
    f2 d4 d d d
    es2 es d
    es f1
    b,2 r r
  }
}

BassoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui ti --
  met Do -- mi --
  num: In man -- da -- tis
  e -- ius vo --
  let ni --
  mis.
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
    b'2-\tutti es, f
    b,2. f'4 b2
    a g1
    f2 d1
    es d2
    es f1
    b,2 r r
  }
}

BassFigures = \figuremode {
  r2 <6 5>1
  r1.
  <6>2 <7> <6!>
  r <6>1
  r1.
  r2 <4> <3>
  r1.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff \with { \smallStaffDistance } {
        \set Staff.instrumentName = "cnto"
        \Cornetto
      }
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "fag"
        \Fagotto
      }
    >>
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
