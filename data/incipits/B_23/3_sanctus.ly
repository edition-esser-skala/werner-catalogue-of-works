\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "Larghetto"
      \set Staff.timeSignatureFraction = 2/2
    g'2 a g4 c, c'2~
    c b a2.\trill \hA b8[ a]
    g2 c1 b2
    a4 d, d'1 c2
    h!1\trill a2 c~
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _ _ _
  _ _ _
  ctus, san -- _
  _ _ _ ctus,
  san -- ctus "Do -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "Larghetto"
      \set Staff.timeSignatureFraction = 2/2
    e2 f1 e4 d
    e f g1 f2~
    f es d1~
    d2. c4 h!2 e
    e1 e
  }
}

AltoLyrics = \lyricmode {
  San -- _ ctus, _
  san -- _ _ _
  _ _
  _ _ ctus,
  san -- ctus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "Larghetto"
      \set Staff.timeSignatureFraction = 2/2
    r1 c~
    c c2 c~
    c g fis g~
    g f4 a gis2 a~
    a gis a1
  }
}

TenoreLyrics = \lyricmode {
  San --
  ctus, san --
  ctus, san -- _
  ctus, _ san -- _
  _ ctus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "Larghetto"
      \set Staff.timeSignatureFraction = 2/2
    c\breve~
    c
    c1 d~
    d e~
    e a,
  }
}

BassoLyrics = \lyricmode {
  San --

  ctus, san --
  _
  ctus
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 4/2 \tempoMarkup "Larghetto"
      \set Staff.timeSignatureFraction = 2/2
    c1~ c~
    c~ c~
    c d~
    d e~
    e a,
  }
}

BassFigures = \figuremode {
  <5 3>2 <6 4> <5 \t> <8 3>4 <\t 2>
  <8 3> <\t 4> <7- 5>2 <6 \t> <\t 4>
  <5 \t> <8 _-> <7 _+> <6- 4>
  <5 \t> <8 _!> <7 _+> <6 4>
  <5 \t> <\t _+>1.
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
