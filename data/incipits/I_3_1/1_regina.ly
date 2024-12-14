\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Allabreve"
    R1
    g'
    h2 g
    c2. h4
    a2 d4 c
    h c h a
    g2 c~
    c h4 c
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Allabreve"
    c1
    e2 c
    g'2. f4
    e2 a4 g
    f g f e
    d2 g4 f
    e2 d4 c
    d g, g'2~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/2 \tempoMarkup "Allabreve" \autoBeamOff
    R1
    g'
    h2 g
    c2. h4
    a2 d4 c
    h c h a
    g2 c~
    c h4 c
  }
}

SopranoLyrics = \lyricmode {
  Re --
  gi -- na
  coe -- _
  li, lae -- _
  ta -- _ _ _
  _ _
  _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/2 \tempoMarkup "Allabreve" \autoBeamOff
    c1
    e2 c
    g'2. f4
    e2 a4 g
    f g f e
    d2 g4 f
    e2 d4 c
    d g, g'2~
  }
}

AltoLyrics = \lyricmode {
  Re --
  gi -- na
  coe -- _
  li, lae -- _
  ta -- _ _ _
  _ _ _
  _ _ _
  _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/2 \tempoMarkup "Allabreve" \autoBeamOff
    R1*7 %7
    g1
  }
}

TenoreLyrics = \lyricmode {
  "Re -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Allabreve" \autoBeamOff
    R1*8
  }
}

BassoLyrics = \lyricmode {
}

Organo = {
  \relative c {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Allabreve"
    c'1
    << {
      g'
      h2 g
      c2. h4
      a2 d4 c
      h c h a
      g2 c
    } \\ {
      e,2 c
      g'2. f4
      e2 a4 g
      f g f e
      d2 g4 f
      e2 d4 c
    } >>
    \clef tenor g1
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
  <4>2 <3>
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
