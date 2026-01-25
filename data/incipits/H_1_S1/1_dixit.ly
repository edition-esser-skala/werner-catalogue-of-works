\version "2.24.2"
\include "header.ly"

Cornetto = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'4 c c c8 c
    d4 d8 d e4 d8 d
    c h r4 r2
    r4 h8 h h h h4
    c r r8 c c d
    d c16 c c8 h c4 r
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 g'8 g16 g g8 g
    g g r4 r2
    r4 g8 g g g g4
    g8 g g e c4 f
    f8 e16 e d4 e r
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 c8 c16 c d8 d
    e d r4 r2
    r4 d8 d d d d4
    e8 e e c a4 a
    g8 g16 g g4 g r
  }
}

Fagotto = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 c'16 h c8 h a a16 g a8 e
    f d g g, c c' h g
    c g g g g d h d
    g g, g'4 f2
    e4 r r8 f f d
    h c g' g, c4 r
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 g''8 g16 g g8 g
    g g r4 r \pa g,,8 g
    g g16 g g8 g g' g16 g g8 g
    g4 \pd r r8 f' f f
    f e d4 e r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 e'8 e16 e d8 d
    e d r4 r g,,8 g
    g g16 g g8 g g' g16 g g8 g
    g4 r r8 c c d
    g, g g4 g r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 c8 c16 c g8 g
    c g r4 r g8 g
    g g16 g g8 g c c16 c g8 g
    g4 r r8 c c g
    c c g4 g r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'1
    d2 e4 d
    c8 h r4 r2
    r4 h8 h h h h4
    c r r8 c c d
    d c4 h8 c4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'1~
    c4 h c g
    g8 g r4 r2
    r4 h8 h h h h4
    c8 g g e c c' c d
    d c4 h8 c4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'4^\tutti c c c8 c
    d4 d8 d e4 d8 d
    c h r4 r2
    r4 h8 h h h h4
    c r r8 c c d
    d c16 c c8[ h] c4 r
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do -- mi -- no, Do -- mi -- no
  me -- o:
  in -- i -- mi -- cos tu --
  os, sca -- bel -- lum
  pe -- dum tu -- o -- rum.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 g'8^\tutti g16 g g8 g
    g g r4 r2
    r4 g8 g g g g4
    g8 g g e c4 f
    f8 e16 e d4 e r
  }
}

AltoLyrics = \lyricmode {
  Se -- de a dex -- tris
  me -- is,
  in -- i -- mi -- cos tu --
  os, sca -- bel -- lum pe -- dum,
  pe -- dum tu -- o -- rum.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 c8^\tutti c16 c d8 d
    e d r4 r2
    r4 d8 d d d d4
    e8 e e c a4 a
    g8 g16 g g4 g e'^\solo
  }
}

TenoreLyrics = \lyricmode {
  Se -- de a dex -- tris
  me -- is,
  in -- i -- mi -- cos tu --
  os, sca -- bel -- lum pe -- dum,
  pe -- dum tu -- o -- rum. "Vir -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 c'8^\tutti c16 c h8 g
    c g g g g[ d h d]
    g g, g' g f f f4
    e r r8 f f d
    h c16 c g4 c r
  }
}

BassoLyrics = \lyricmode {
  Se -- de a dex -- tris
  me -- is, do -- nec po --
  _ nam in -- i -- mi -- cos tu --
  os, sca -- bel -- lum
  pe -- dum tu -- o -- rum.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c'16 h c8 h a a16 g a8 e
    f d g g, c c' h g
    c g r4 g, r
    g g' f2
    e4 r r8 f f d
    h c g' g, c4 r8 c-\solo
  }
}

BassFigures = \figuremode {
  r2.. <6>8
  r1
  r1
  r2 <2>
  r1
  <6 5>4 <4>8 <3> r2
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
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
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
