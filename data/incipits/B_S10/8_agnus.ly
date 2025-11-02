\version "2.24.2"
\include "header.ly"

CornettoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*7
  }
}

CornettoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*7
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*7
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*7
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    e4.^\markup \remark "trb & vla" e8 f4 f8 f
    f4 f8 f f4 e
    e2 e
    e4. e8 e4 e
    f4. f8 e4 e
    e d8 f e4 e
    e2 e
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    g4.^\markup \remark "trb & vla" g8 a4 a8 a
    a4 a8 a h4 g
    a2 gis
    gis4. gis8 a4 a
    a4. d8 g,4 c
    c4. d8 h4 c
    h2 cis
  }
}

TromboneIII = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c4. c8 f4 f8 f
    d4 d8 d g4 c,
    a2 e'
    e4. e8 a,4 a
    d4. d8 c4 c
    f4. d8 e4 a,
    e'2 a,
  }
}

Timpani = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*7
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    g''4. g8 f4 f8 f
    f4 f8 f f4 e
    e2 e
    e4. e8 e4 c
    f4. d8 e4 e
    a,4. f'8 h, e e4
    e4. e8 e2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'4. c8 c4 c8 c
    d4 d8 d d4 c
    c2 h
    h4. h8 c4 c
    c4. h8 h4 a
    a4. h8 gis4 a
    a4. gis8 a2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c'4.^\tutti c8 c4 c8 c
    d4 d8 d d4 c
    c2 h
    h4. h8 c4 c
    c4. h8 h4 a
    a4. h8 gis4 a
    a4. gis8 a2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- _ bis.
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    e4.^\tutti e8 f4 f8 f
    f4 f8 f f4 e
    e2 e
    e4. e8 e4 e
    f4. f8 e4 e
    e d8[ f] e4 e
    e2 e
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    g4.^\tutti g8 a4 a8 a
    a4 a8 a h4 g
    a2 gis
    gis4. gis8 a4 a
    a4. d8 g,4 c
    c4. d8 h4 c
    h2 cis
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- bis.
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c4.^\tutti c8 f4 f8 f
    d4 d8 d g4 c,
    a2 e'
    e4. e8 a,4 a
    d4. d8 c4 c
    f4. d8 e4 a,
    e'2 a,
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- bis.
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c2-\tutti f
    d g4 c,
    a2 e'
    e a,
    d c
    f4. d8 e4 a,
    e'2 a,
  }
}

BassFigures = \figuremode {
  r1
  r2 <7>
  <_!> <_+>
  q1
  <7>4 <6> <7> <6>
  <7> <6>8 q <_+>2
  <4>4 <_+>2.
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
