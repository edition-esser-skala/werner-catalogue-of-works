\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    b'1 c2 d
    es1 d2 b
    f'2. es4 d c d2
    c1 b2 a
    d1 c
    r b2 b
    c2. c4 d1
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key b \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 f1
    g2 a b1
    a2 f b1~
    b2 a g c
    f,1 r
    R\breve
    r1 f2 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b'1 c2 d
    es1 d2 b
    f'2. es4 d c d2
    c1 b2 a
    d1 c
    r b2 b
    c2. c4 d1
  }
}

SopranoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _ _ _
  _ rum, coe --
  lo -- rum,
  a -- ve
  Do -- mi -- na
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 f1
    g2 a b1
    a2 f b1~
    b2 a g c
    f,1 r
    R\breve
    r1 f2 f
  }
}

AltoLyrics = \lyricmode {
  A --
  ve Re -- gi --
  na coe -- lo --
  _ _ _
  rum,

  a -- ve
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 b
    c2 d es1
    d2 b f'2. es4
    d c b c d2 g,
    es'1 d
  }
}

TenoreLyrics = \lyricmode {
  A -- %3
  ve Re -- gi --
  na coe -- lo -- _
  _ _ _ _ rum, coe --
  lo -- rum,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    f1 g2 a
    b1 a2 f
    b2. a4 g f es d
    c1 b
  }
}

BassoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _ _ _ _
  _ rum,
}

Organo = {
  \relative c {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    << {
      b''1 c2 d
      es1 d2 b
      f'2. es4
    } \\ {
      r1 f, %1
      g2 a b1
      a2 f
    } >> \clef tenor b,1
    \clef bass f g2 a
    b1 a2 f
    b2. a4 g f es d
    c1 b
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  <5 4>2 <6 3> <6> <\t>
  r\breve
  r
  <7>2 <6>1.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
