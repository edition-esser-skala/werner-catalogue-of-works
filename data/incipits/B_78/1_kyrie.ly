\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    \pa r8 c e g c e, g c \pd
    e g, c e g g16 a g a g f
    e8 g e d16 c d4 r
    R1*3
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r2 r8 c e g
    c e, g c d d16 d d8 d
    g, e g g16 g g4 r
    R1*3
  }
}

TrombaI = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    g'4 r g r
    g r g8 g16 g g8 g
    g g16 g \pa g8 g16 e \pd g4 r
    R1*3
  }
}

TrombaII = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e4 r e r
    e r g,8 g16 g g8 g
    c c16 c c8 c g4 r
    R1*3
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1
    g'4. g8 g4 g
    g2 g
    r r4 g~
    g f e4. e8
    f4 g c, c
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1
    e4. e8 d4 d
    c2 h4 r8 g
    a4. h8 c4 g
    r d'2 c4
    a g f a
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c4 r c r
    c r g8 g16 g g8 g
    c c16 c c8 c g4 r
    R1*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1
    g''4. g8 g4 h
    g c h8 g, h d
    c a f' d g, c e g
    d g d' f, e c g' c
    f, d g b, a f a c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1
    c'4. c8 d4 d
    e2 d8 g, h d
    c a f' d g, c e g
    d g d' f, e c g' c
    f, d g b, a f a c
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1
    c'4. c8 d4 d
    e2 d
    R1
    r2 r4 c~
    c b a4. a8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son,

  e --
  _ lei -- son,
}

Alto = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1
    g'4. g8 g4 g
    g2 g
    r r4 g~
    g f e4. e8
    f4 g c, c
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son,
  e --
  _ lei -- son,
  Ky -- ri -- e "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1
    e4. e8 d4 d
    c2 h4 r8 g
    a4. h8 c4 g
    r d'2 c4
    a g f a
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e --
  lei -- _ _ son,
  e -- _
  lei -- _ son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1
    c4. c8 h4 h
    c2 g4 g'~
    g f e2
    h c4. c8
    d4 e f f
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e --
  _ lei --
  _ son, e --
  lei -- _ son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c4 r c r
    c4. c8 h2
    c g4 g'~
    g f e2
    h c4. c8
    d4 e f2
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <2>2 <6>
  q4 <5> <9> <8>
  <7> <5->2.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
      \new Staff \with { \smallStaffDistance } <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "tr" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \TrombaI \TrombaII
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
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
      \Timpani
    }
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
