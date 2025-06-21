\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 g'
    h2 g c2. h4
    a2 d4 c h c h a
    g2 c1 h4 c
    d c h a g2 c~
    c c h g
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c1 e2 c
    g'2. f4 e2 a4 g
    f g f e d2 g4 f
    e2 d4 c d g, g'2~
    g4 a g f e c e f
    g f e f d2 g~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 g'
    h2 g c2. h4
    a2 d4 c h c h a
    g2 c1 h4 c
    d c h a g2 c~
    c c h g
  }
}

SopranoLyrics = \lyricmode {
  Re --
  gi -- na coe -- _
  li, lae -- _ ta -- _ _ _
  _ _ _ _
  _ _ _ _ re, al --
  le -- lu -- ia,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1 e2 c
    g'2. f4 e2 a4 g
    f g f e d2 g4 f
    e2 d4 c d g, g'2~
    g4 a g f e c e f
    g f e f d2 g
  }
}

AltoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- _ li, lae -- _
  ta -- _ _ _ _ _ _
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ re, al \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r1 g
    h2 g c1
    g2 g g4 a h c
  }
}

TenoreLyrics = \lyricmode {
  Re --
  gi -- na coe --
  li, lae -- ta -- _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*4
    r1 c
    e2 c g'2. a4
  }
}

BassoLyrics = \lyricmode {
  Re --
  gi -- na coe \hy
}

Organo = {
  \relative c {
    \clef soprano
    \twotwotime \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c'1
    << {
      g'
      h2 g c2. h4
      a2 d4 c h c h a
      g2 c
    } \\ {
      e,2 c
      g'2. f4 e2 a4 g
      f g f e d2 g4 f
      e2 d4 c
    } >>
    \clef tenor g1
    h2 g \clef bass c,1
    e2 c g'2. a4
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r1 <4>2 <3>
  r\breve
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
