\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    g''4 g2 c4
    h2 r
    g4 g2 c4
    h2 r
    r4 g2 g4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    e'4 c8 d e f g f16 e
    d4 g, r2
    e'4 c8 d e f g f16 e
    d4 g, r2
    r4 c8 d e4 e
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Presto"
    c4 c8 g c c16 c c8 c
    g4 g r2
    c4 c8 g c c16 c c8 c
    g8 g16 g g4 r2
    r4 c8 g c c16 c c8 c
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    e'8 f g f e f g a
    h16 c h c d8 c h16 c a h g a f g
    e f d e c4 e,8 f g a
    h16 c h c d8 c h16 c a h g a f g
    e f d e c4 g'16 c h c g c h c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    e'8 f g f e f g a
    h16 c h c d8 c h16 c a h g a f g
    e f d e c4 e,8 f g a
    h16 c h c d8 c h16 c a h g a f g
    e f d e c4 g'16 c h c g c h c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    e'4^\tutti e8 e e4 e
    d d r2
    e4 e8 e e4 e
    d d r2
    e4 e8 e e4 e
  }
}

SopranoLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in "ex -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    g'4^\tutti g8 g g4 g
    g g r2
    g4 g8 g g4 g
    g g r2
    g4 g8 g g4 g
  }
}

AltoLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in "ex -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    c4^\tutti c8 c c4 c
    h h r2
    c4 c8 c c4 c
    h h r2
    c4 c8 c c4 c
  }
}

TenoreLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in "ex -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    c4^\tutti c8 c c[ d] e[ f]
    g4 g, r2
    c4 c8 c c[ d] e[ f]
    g4 g, r2
    c4 c8 c c[ d] e[ c]
  }
}

BassoLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in ex --
  cel -- sis,
  glo -- ri -- a in "ex -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Presto"
    c8-\tutti d e d c d e f
    g a h a g f e d
    c d e d c d e f
    g a h a g f e d
    c d e d c d e c
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
}

\score {
  <<
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
