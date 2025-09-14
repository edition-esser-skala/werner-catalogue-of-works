\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    g''2 r4 g g d
    e2 g1
    r4 fis e2. e4
    fis a,2 h4 c! d
    e8 fis e fis g2. fis8 e
    d2. c8 h a2
    h4 d-\solo e fis g a
    h8 a g2 e4 h a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    d'2 r4 h d h
    g2 h e
    r4 d d2 cis4.\trill cis8
    d4 fis,2 g4 a h
    c!2. h8 a g2~
    g4 g fis g2 fis4
    g h a c h c
    d4. d8 e4 g,2 fis4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    d'2^\tutti r4 h d h
    g2 h e
    r4 d d2 cis4. cis8
    d4 a2 h4 c d
    e8[ fis e fis] g2. fis8[ e]
    d2. c8[ h] a2
    h r r
    R1.
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax, pax, pax
  ho -- mi -- _ ni --
  bus bo -- nae vo -- lun --
  ta -- _ _
  _ _ _
  tis.
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    g'2^\tutti r4 g g d
    e2 g1
    r4 fis e2. e4
    fis fis2 g4 a h
    c!2. h8[ a] g2~
    g4 g fis g g fis
    g2 r r
    R1.
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, pax
  ho -- mi -- ni --
  bus bo -- nae vo -- lun --
  ta -- _ _
  tis, vo -- lun -- ta -- _
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    h2^\tutti r4 d g, g
    h1 a2
    r4 a a2. a4
    a2 r r
    r4 g2 a4 h c
    d1.
    d2 r r
    R1.
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax, pax
  ho -- mi -- ni --
  bus
  bo -- nae vo -- lun --
  ta --
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    g'2^\tutti r4 g h g
    e1 cis2
    r4 d a2. a4
    d2 r r
    r4 e2 fis4 g a
    h8[ c h c] d4 g, d2
    g, r r
    R1.
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, pax
  ho -- mi -- ni --
  bus
  bo -- nae vo -- lun --
  ta -- _ _ _
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    g'2-\tutti r4 g h g
    e1 cis2
    r4 d a1
    d r2
    r4 e2 fis4 g a
    h8 c h c d4 g, d2
    g, c4-\solo a e' d8 c
    h2 c d
  }
}

BassFigures = \figuremode {
  r1.
  <5>1 <6 5>2
  r <4> <_+>
  r1.
  r4 <6> r1
  r <4>4 <_+>
  r2 r4 <6> <5>2
  <6>1 <6 4>4 <5 _+>
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
