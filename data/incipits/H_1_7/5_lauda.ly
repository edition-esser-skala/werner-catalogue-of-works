\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Moderato"
    g''8\f e16 g c4 g
    g8 e16 g c4 g~
    g g, g'~
    g8 a g f e g
    a4. g8 f a
    h4. a8 g h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Moderato"
    e'8\f c16 e g4 e
    e8 c16 e g4 e
    d8 e d c h d
    c4. d8 e4
    c2 d4
    d2 e4~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    e'4^\tutti e, e'8 e
    e4 e, e'
    d8[ e] d[ c] h[ d]
    c4. d8 e4
    c2 d4
    d2 e4
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da, lau -- da,
  lau -- da Ie --
  ru -- sa -- lem,
  Do -- mi -- num,
  lau -- da
  De -- um
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    g'4^\tutti g g8 g
    g4 g g
    g4. g8 g4
    g4. g8 g4
    a4. g8 f[ a]
    g4 g g
  }
}

AltoLyrics = \lyricmode {
  Lau -- da, lau -- da,
  lau -- da Ie --
  ru -- sa -- lem,
  Do -- mi -- num,
  lau -- _ da
  De -- um "tu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    c4^\tutti c c8 c
    c4 c c
    d d d
    g,4. g8 c4
    a2 a4
    h2 h4
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da, lau -- da,
  lau -- da Ie --
  ru -- sa -- lem,
  Do -- mi -- num,
  lau -- da
  De -- um "tu -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    c'4^\tutti c, c'8 c
    c4 c, c'
    h8[ c] h[ a] g[ f]
    e[ f] e[ d] c4
    f8[ g f e] d[ f]
    g[ a] g[ f] e[ g]
  }
}

BassoLyrics = \lyricmode {
  Lau -- da, lau -- da,
  lau -- da Ie --
  ru -- sa -- lem,
  Do -- mi -- num,
  lau -- da
  De -- um "tu -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Moderato"
    c'4-\tutti c, c'8 c
    c4 c, c'
    h8 c h a g f
    e f e d c e
    f g f e d f
    g a g f e g
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r
  r
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
