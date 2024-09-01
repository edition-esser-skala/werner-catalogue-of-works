\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r8 c' c c c c
    d4 \pao g, g'8 f
    e f d2\trill
    c4 r8 e e e
    d g16 f g8 d d d
    e e16 f g8 g g g
    g4 d8 g f g
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r8 e e e e e
    g4 g d'
    c8 g g4. g8
    e4 r8 c' c c
    g4 g8 g g g
    c4 c c
    d d g,
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r8 c c c c c
    g4 g g
    c g g
    c r r8 c
    g4 g g
    c c c
    g r r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r8 g' c c c c
    d g,16 a h8 d g f
    e g f g d g
    e c16 d e8 g f e
    d g,16 a h8 d g d
    e e16 f g8 e16 f g8 e
    d g16 f g8 d h g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r8 g' c c c c
    d g,16 a h8 d g f
    e g f g d g
    e c16 d e8 g f e
    d g,16 a h8 d g d
    e e16 f g8 e16 f g8 e
    d g16 f g8 d h g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r e'^\tutti
    d2 d4
    e d2
    c e4
    d4. d8 d4
    r r e
    d4. d8 d4
  }
}

SopranoLyrics = \lyricmode {
  Te
  De -- um
  lau -- da --
  mus, te
  Do -- mi -- num,
  te
  Do -- mi -- num
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r g'^\tutti
    g2 g4
    g g2
    e g4
    g4. g8 g4
    r r g
    g4. g8 g4
  }
}

AltoLyrics = \lyricmode {
  Te
  De -- um
  lau -- da --
  mus, te
  Do -- mi -- num,
  te
  Do -- mi -- num
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r c^\tutti
    h2 h4
    c c h
    c2 c4
    h4. h8 h4
    r r c
    c4. h8 h4
  }
}

TenoreLyrics = \lyricmode {
  Te
  De -- um
  lau -- da -- _
  mus, te
  Do -- mi -- num,
  te
  Do -- mi -- num
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r c^\tutti
    g'2 g4
    c g2
    c, c4
    g'4. g8 g4
    r r c,
    g'4. g8 g4
  }
}

BassoLyrics = \lyricmode {
  Te
  De -- um
  lau -- da --
  mus, te
  Do -- mi -- num,
  te
  Do -- mi -- num
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r8 c-\tutti e c e c
    g' g h g h g
    c f, g4 g,
    c r8 c e c
    g' g16 a h8 g a h
    c c,16 d e8 c e c
    g'4 g, g'
  }
}

BassFigures = \figuremode {
  r2.
  r
  r4 <4> <3>
  r2.
  r
  r
  r
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
