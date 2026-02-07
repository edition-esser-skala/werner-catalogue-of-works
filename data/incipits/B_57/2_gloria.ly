\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 a'2 a
    b f g2. g4
    a2 a h cis
    d1 r2 a~
    a g f2. f4
  }
}

SopranoLyrics = \lyricmode {
  Et in
  ter -- ra, ter -- ra
  pax, in ter -- ra
  pax, pax __
  ho -- mi -- "ni -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 d~
    d2 d f c
    d2. c4 b2 b
    a1 r2 g'~
    g f e2. e4
    d1 r2 d
  }
}

AltoLyrics = \lyricmode {
  Et __
  in ter -- ra,
  ter -- _ _ ra
  pax, pax __
  ho -- mi -- ni --
  bus, pax
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 a~
    a2 a b f
    g2. g4 a1
    R\breve*2
    r2 d1 c2
    b2. b4 a1
  }
}

TenoreLyrics = \lyricmode {
  Et __
  in ter -- ra,
  ter -- ra pax,

  pax ho --
  mi -- ni -- bus
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1. d2
    f c d2. c4
    b2 b a1
    r r2 g'~
    g f e2. e4
    d1 r
    r d
  }
}

BassoLyrics = \lyricmode {
  Et in
  ter -- ra, ter -- _
  _ ra pax,
  pax __
  ho -- mi -- ni --
  bus
  "bo -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    << {
      s1 a'
      a2 a
    } \\ {
      d,1.^! d2
      f c d2. c4
    } >>
    b1 a
    \clef soprano << { b''2 f g } \\ { d2. c4 b2 } >> \clef bass g~
    g f e1
    d2 \clef tenor d'1 c2
    b1 \clef bass d,
  }
}

BassFigures = \figuremode {
  r\breve
  r1 <6->2 <5>
  <6>1 <6 _!>2 <5>
  r1. <_->2
  <2>1 <5>2 <6\\>
  <4> <3> <5 2> <6>
  <7> <6>1.
}

\score {
  <<
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
