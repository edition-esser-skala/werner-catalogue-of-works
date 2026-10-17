\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    r2 c'4 g
    e c c' g
    e c e'2
    d g
    e4 c g e
    c2 r
    r g'4 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    r2 c'4 g
    e c c' g
    e c c'2
    h2. h4
    c4 e c g
    e2 r
    r g4 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 c'^\tutti
    h2. h4
    c2 r
    R1*2
  }
}

SopranoLyrics = \lyricmode {
  Ma --
  gni -- fi --
  cat,
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 g'^\tutti
    g2. g4
    g2 e~
    e4 g f e
    d c h2
  }
}

AltoLyrics = \lyricmode {
  Ma --
  gni -- fi --
  cat a --
  _ ni -- ma
  me -- _ a,
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 e^\tutti
    d2. d4
    e2 c~
    c4 e d c
    h a g2
  }
}

TenoreLyrics = \lyricmode {
  Ma --
  gni -- fi --
  cat a --
  _ ni -- ma
  me -- _ a,
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 c'^\tutti
    g2. g4
    c,2 r
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Ma --
  gni -- fi --
  cat,
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    r2 c'4-\tutti g
    e c c' g
    e c c'2
    g2. g4
    c,1
    R
    r2 g'4 d
  }
}

BassFigures = \figuremode {
  r1
  r
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
