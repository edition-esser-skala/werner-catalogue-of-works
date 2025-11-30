\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e16. e32 g16. g32 c16. c32 e16. e32 d2
    R1\fermata
    R1*2
    \pa e,8 e16 e e e e e e4 \pd r
    R1
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c16. c32 e16. e32 g16. g32 c16. c32 g2
    R1\fermata
    R1*2
    e8 e16 e e e e e e4 r
    R1
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e4.-\tutti e8 d2
    R1
    es4.\p es8 d4 r
    r gis2\f a4~
    a gis a r
    r ais2 h4
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    g4.-\tutti g8 g2
    R1
    g4.\p g8 g4 r
    r h2\f c8 a
    e'2 e4 r
    r cis cis gis
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    g''4. g8 g2
    R1\fermata
    g4.\p g8 g4 r
    r h\f gis a~
    a gis a r
    r ais ais h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e'4. e8 d2
    R1\fermata
    es4.\p es8 d4 d\f
    d2. c4
    h2 a4 e'
    e2 e4 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    c'4.^\tutti c8 h2
    R1\fermata
    c4.\p c8 h4 d\f
    d2 d4 c
    h2 a4 e'
    e2 e4 d
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e e --
  lei -- son, e --
  lei -- son, e --
  lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    e4.^\tutti e8 d2
    R1\fermata
    es4.\p es8 d4 r
    r gis\f gis a~
    a gis a r
    r ais ais h
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e
  e -- lei -- _
  _ son,
  e -- lei \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    g4.^\tutti g8 g2
    R1\fermata
    g4.\p g8 g4 r
    r h h c8 a
    e'2 e4 r
    r cis cis gis8 gis
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e
  e -- lei -- son, e --
  lei -- son,
  e -- lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    c4.^\tutti c8 g'2
    R1\fermata
    c,4.\p c8 g4 r
    r f'\f e dis8 dis
    e2 a,4 r
    r g'! fis eis8 eis
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e,

  Ky -- ri -- e
  e -- lei -- son, e --
  lei -- son,
  e -- lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c4.-\tutti c8 g'2
    R1\fermata
    c,4.\p c8 g4 r
    r f'\f e! dis
    e2 a,4 r
    r g'! fis eis8 eis
  }
}

BassFigures = \figuremode {
  r1
  r
  <_->
  r4 <6 4 2\+> <7 _+> <7 5>
  <4> <_+>2.
  r4 <4\+> <7 _+> <7 5>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff \with { \smallStaffDistance } <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
      \new GrandStaff <<
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
