\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace moderato"
    e'1 g2
    e d r4 g
    e2 a r4 a
    g1 g2
    g4 \pa g,8 g g4 g g g
    g2 \pd r r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace moderato"
    c'1 d2
    c g r4 e'
    c2 f r4 f
    d2 e2. e4
    d g,8 g g4 g g g
    g2 r r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace moderato"
    c4 c8 c c4 c g g
    c2 g r4 c
    c c8 c c2 r
    g c4 g c c8 c
    g4 g8 g g4 g g g
    g2 r r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace moderato"
    r4 c'2 e4 g d'
    c8 g e c' h d, h d g,2
    r4 e' a8 g f2 a4
    r d, g4. f8 e4 g~
    g8 h d h g4 d e c'
    h2 r r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace moderato"
    r4 e8 g c4 e d g
    e8 c g e' d h g h d4 g
    e8 d c4~ c8 h a2 f'8 d
    h a g2 c4. e8 e4
    d8 g, h d g4 d e8 d e4
    d2 r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    e'1^\tutti g2
    e d r4 c
    c2 f r4 f
    d2 g e
    d d c
    h d dis
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta, pec --
  ca -- ta mun --
  di: Mi -- "se -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    g'1^\tutti g2
    g g r4 g
    e2 a r4 a
    g1 g2
    g1.
    g2 r r
  }
}

AltoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta
  mun --
  di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    c1^\tutti d2
    c h r4 e
    c2 c r4 d
    h2 c1
    d2 h e
    d r r
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta
  mun -- _ _
  di:
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    c'1 h2
    c g r4 e
    a2 f r4 d
    g2 e c
    h h c
    g r r
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta, pec --
  ca -- ta mun --
  di:
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace moderato"
    c2-\tutti c' h
    c g r4 e
    a2 f r4 d
    g2 e c
    h1 c2
    g r r
  }
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
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
        \set Staff.instrumentName = "b"
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
  >>
}
