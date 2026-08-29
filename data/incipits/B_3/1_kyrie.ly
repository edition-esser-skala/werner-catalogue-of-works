\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    g''4. g8 fis2
    R1\fermata
    g4.\p g8 fis4 d\f
    dis2 e4 e
    e2. d4~
    d c2 h4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    h'4. h8 a2
    R1\fermata
    b4.\p b8 a4 r
    r a a2~
    a4 g fis gis~
    gis fis2 g4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'4.^\tutti d8 d2
    R1\fermata
    d4.\p d8 d4 d\f
    dis2 e4 e
    e2. d4~
    d c2 h4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e e --
  lei -- son, e --
  lei -- son, __
  e \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    g'4.^\tutti g8 fis2
    R1
    g4.\p g8 fis4 r
    r a\f a2~
    a4 g fis gis
    gis fis2 g4
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e
  e -- lei --
  _ son, e --
  lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    h4.^\tutti h8 a2
    R1\fermata
    b4.\p b8 a4 r
    r c2\f h8[ a]
    h2 ais4 h~
    h a2 g4~
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e
  e -- _
  lei -- son, e --
  lei \hy
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    g'4.^\tutti g8 d2
    R1\fermata
    g4.\p g8 d4 r
    r fis\f e2~
    e fis4 eis
    e dis d e
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e
  e -- lei --
  son, e --
  lei -- _ son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    g'2-\tutti d
    R1\fermata
    g2\p d4 r
    r fis\f e2~
    e fis4 eis
    e dis d e
  }
}

BassFigures = \figuremode {
  r1
  r
  <_->
  r4 <6\\ 5> <8 6 4>2
  <5 4>4 <\t _!> <7 _+> <7 5>
  <7 _+> <7 5> <7> <5 _!>
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
