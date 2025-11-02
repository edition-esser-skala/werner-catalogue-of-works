\version "2.24.2"
\include "header.ly"

CornettoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    e'4. e8 e e e e
    e4. e8 e2
    e8 e e a f4 d
    d8 g g g g4. g8
    g2 g\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

CornettoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'4. c8 c c c c
    h4. h8 h2
    e8 e e e d4 d
    d8 h c c c4 h
    c1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*4
    R1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*4
    R1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    e4.^\markup \remark "trb & vla" e8 e e e e
    e4. e8 e2
    e8 e e e f4 f
    f8 f e e d2
    e1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      g4^\markup \remark "trb" a g
    g2.
    a
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    g4.^\markup \remark "trb & vla" g8 a a a a
    gis4. gis8 gis2
    a8 a a a a4 a
    h8 d c g! g2
    g1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      c4^\markup \remark "trb" c d
    c2.
    c
  }
}

TromboneIII = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c4. c8 a a a a
    e4. e8 e2
    cis'8 cis cis cis d4 d
    g,8 g g g g2
    c,!1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      c'4 a h
    c2.
    fis,
  }
}

Timpani = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*4
    R1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    e'4. e8 e e e e
    e4. e8 e2
    e8 e e a f4 d
    d8 g g g g4. g8
    g2 g\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'4. c8 c c c c
    h4. h8 h2
    e8 e e e d4 d
    d8 h c c c4 h
    c1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c'4.^\tutti c8 c c c c
    h4. h8 h2
    e8 e e e d4 d
    d8 h c c c4 h
    c1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta -- _
  tis.
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    e4.^\tutti e8 e e e e
    e4. e8 e2
    e8 e e e f4 f
    f8 f e e d2
    e1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      e4^\solo f f
    e e e
    d4. d8 d4
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta --
  tis.
  Lau -- da -- mus
  te, be -- ne --
  di -- ci -- mus
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    g4.^\tutti g8 a a a a
    gis4. gis8 gis2
    a8 a a a a4 a
    h8 d c g! g2
    g1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta --
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c4.^\tutti c8 a a a a
    e4. e8 e2
    cis'8 cis cis cis d4 d
    g,8 g g g g2
    c!1\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.*3
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta --
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c2 a
    e'1
    cis2 d
    g,1
    c!\fermata \bar "||"
    \time 3/4
      \once \override Staff.TimeSignature.style = #'single-digit
      c4-\solo a h
    c2.
    fis,
  }
}

BassFigures = \figuremode {
  r1
  <_+>
  r2 <_!>
  <7 3>4 <6 4> <5 \t> <\t 3>
  r1
  r4 <6> <5>
  r2.
  <6 5>
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "cnto"
        \new Staff {
          \set Staff.instrumentName = "1"
          \CornettoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \CornettoII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      }
    >>
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = \markup \center-column { "trb" "2" "vla" }
          \TromboneII
        }
        \new Staff {
          \set Staff.instrumentName = "3"
          \TromboneIII
        }
      >>
    >>
    \new Staff \with { \smallStaffDistance } {
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
