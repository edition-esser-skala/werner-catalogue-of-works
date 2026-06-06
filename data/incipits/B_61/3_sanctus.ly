\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    d'1 h2 g
    e'1 cis2 a
    fis'2. fis4 d h e2~
    e d1 c!2~
    c h1 a2
    h h2. h4 h2
  }
}

SopranoLyrics = \lyricmode {
  San -- _ ctus,
  san -- _ ctus,
  san -- ctus, san -- _ _
  _ _
  _ _
  ctus Do -- mi -- nus
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    r2 d g1~
    g4 e cis2 a'1~
    a4 fis d2 h'2. g4
    fis2 fis gis4 h a g
    fis a g fis e g fis e
    dis1 e2. e4
  }
}

AltoLyrics = \lyricmode {
  San -- _
  _ ctus, san --
  _ ctus, san -- _
  ctus, san -- _ _ _ _
  _ _ _ _ _ _ _ _
  ctus Do -- "mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    r2 h1 c2~
    c r cis d~
    d r d h
    ais h1 c!4 h
    a2 h g c
    fis,1 gis2. gis4
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, __
  san -- ctus, __
  san -- ctus,
  san -- _ _ _
  _ ctus, san -- _
  ctus Do -- "mi -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    r2 g'1 e2
    c a'1 fis2
    d h'2. h4 g e
    fis2 h e, a
    d, g c,1
    h e2. e4
  }
}

BassoLyrics = \lyricmode {
  San -- _
  ctus, san -- _
  ctus, san -- ctus, san -- _
  _ ctus, san -- ctus,
  san -- ctus, san --
  ctus Do -- "mi -"
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    d''2-! \clef bass g,,1 e2
    c a'1 fis2
    d h'1 g4 e
    fis2 h, e a,
    d g, c1
    h e2. e4
  }
}

BassFigures = \figuremode {
  r1. <6>2
  r <_+>1 <6>2
  r1. q2
  <7 _+>1 <7 _+>
  <7> <7>2 <6>
  <_+>1 q
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
