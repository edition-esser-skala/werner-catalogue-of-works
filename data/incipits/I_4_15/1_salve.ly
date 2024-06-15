\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'1
    a2 c
    h4 c d2~
    d c
    h4 g a h
    c g c2~
    c4 h a2
    g1
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*2
    g'1
    e2 a
    g f
    e2. d4
    c d e c
    d c h d
    g,2 r
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c'1
    a2 c
    h4 c d2
    d c
    h4 g a h
    c g c2~
    c4 h a2
    g1
    R1*2
  }
}

SopranoLyrics = \lyricmode {
  Sal --
  ve Re --
  gi -- _ na,
  sal -- ve
  ma -- _ _ _
  _ _ _
  _ _
  ter,
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    g'1
    e2 a
    g f
    e2. d4
    c d e c
    d c h d
    g,2 r
    R1
  }
}

AltoLyrics = \lyricmode {
  Ma --
  ter mi --
  se -- ri --
  cor -- _
  _ _ _ _
  _ _ di -- _
  ae,
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*5
    c1
    a2 c
    h4 c d2
    d c
    h4 g a h
  }
}

TenoreLyrics = \lyricmode {
  Sal --
  ve Re --
  gi -- _ na,
  sal -- ve
  "ma -"
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*7
    g'1
    e2 a
    g f
  }
}

BassoLyrics = \lyricmode {
  Ma --
  ter mi --
  "se -"
}

Organo = {
  \relative c {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c''1-!
    a2-! c-!
    << {
      h4 c d2~
      d c
      h4 g a h
    } \\ {
      g1
      e2 a
      g f
    } >>
    \clef tenor c1
    a2 c
    \clef bass g1
    e2 a
    g f
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
  r
  <7>
  r2 <\t>
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
