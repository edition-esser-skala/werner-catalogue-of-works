\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Larghetto"
    g'2 a
    g4 c, c'2~
    c b
    a2. b?8[ a]
    g2 c~
    c b
    a4 d, d'2~
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  _ _ _
  _
  _ _
  ctus, san --
  _
  _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Larghetto"
    e2 f~
    f e4 d
    e f g2~
    g f~
    f es
    d1~
    d2. c4
  }
}

AltoLyrics = \lyricmode {
  San -- _
  ctus, _
  san -- _ _
  _
  _
  _
  \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Larghetto"
    R1
    c~
    c
    c2 c~
    c g
    fis g~
    g f4 a
  }
}

TenoreLyrics = \lyricmode {
  San --

  ctus, san --
  ctus,
  san -- _
  ctus, _
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Larghetto"
    c1~
    c~
    c~
    c
    c
    d~
    d
  }
}

BassoLyrics = \lyricmode {
  San --

  ctus,
  "san -"
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Larghetto"
    c1~
    c~
    c~
    c~
    c
    d~
    d
  }
}

BassFigures = \figuremode {
  <5 3>2 <6 4>
  <5 \t> <8 3>4 <\t 2>
  <8 3> <\t 4> <7- 5>2
  <6 \t> <\t 4>
  <5 \t> <8 _->
  <7 _+> <6- 4>
  <5 \t> <8 _!>
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
