\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    e'4 e8 e d d d g
    e4 r r2
    e4 e8 e d d d g
    e4 r r2
    R1
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1
    c'4 c8 c g g g d'
    c4 r r2
    c4 c8 c g g g d'
    c4 r r2
    R1
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    g'4.-\tutti g8 g g g g
    g4 g r2
    g4. g8 g g g g
    g4 g r2
    R1*2
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4.-\tutti c8 h a g d'
    c4 c r2
    c4. c8 h a g d'
    c4 c r2
    R1*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 g' c e, d4 g,
    r8 e'' g e d16 e d c h c h a
    g8 e c' e, d4 g,
    r8 e'' g e d16 e d c h c h a
    g8 e r4 r8 c'\p f, a'
    g c, r4 r8 c16 a' a( g) g( f)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r2 r8 g' d' g,
    e g4 c8 h16 c h a g a g f
    e8 c r4 r8 g' d' g,
    e g4 c8 h16 c h a g a g f
    e8 c g'\p c a c, r4
    r8 e16 c' c( h) h( a) g8 c, r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e'4^\tutti e8 e d c d h
    e4 e r2
    e4 e8 e d c d h
    e4 e r2
    g,^\solo a
    c2. c4
  }
}

SopranoLyrics = \lyricmode {
  Glo -- ri -- a in ex -- cel -- sis
  De -- o,
  glo -- ri -- a in ex -- cel -- sis
  De -- o,
  glo -- _
  _ "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'4^\tutti g8 g g g g g
    g4 g r2
    g4 g8 g g g g g
    g4 g r2
    g^\solo a
    c2. c4
  }
}

AltoLyrics = \lyricmode {
  Glo -- ri -- a in ex -- cel -- sis
  De -- o,
  glo -- ri -- a in ex -- cel -- sis
  De -- o,
  glo -- _
  _ "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti c8 c h a g d'
    c4 c r2
    c4 c8 c h a g d'
    c4 c r2
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  Glo -- ri -- a in ex -- cel -- sis
  De -- o,
  glo -- ri -- a in ex -- cel -- sis
  De -- o,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti c8 c g' a h g
    c4 c, r2
    c4 c8 c g' a h g
    c4 c, r2
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Glo -- ri -- a in ex -- cel -- sis
  De -- o,
  glo -- ri -- a in ex -- cel -- sis
  De -- o,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti d e c g' a h g
    c c, e c g' a h g
    c c, e c g' a h g
    c c, e c g' a h g
    c c, e-\solo c f e f d
    e a g f e f e d
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  <6>
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
