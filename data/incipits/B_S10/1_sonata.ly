\version "2.24.2"
\include "header.ly"

CornettoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    g''4~ g16 a g f e8 c d e
    f g16 a g8 f e4~ e16 f e d
    c8 e d c d2
    g,8 c e16 d c8 g'4 g
    g4. fis8 g2
  }
}

CornettoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1
    r2 g''4~ g16 a g f
    e8 c d e f g16 a g8 f
    e4 c16 d e8 d4 e8 d
    c4. c8 d2
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    e1^\markup \remark "trb"
    d4 d e2
    e d
    e d4 e8 g
    a2 d,
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    g1^\markup \remark "trb"
    f4 g g2
    g f4 g
    g2 g4 g
    a2 h
  }
}

TromboneIII = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c1
    d4 h c2
    c c4 h
    c2 h4 c8 h
    a2 g
  }
}

Timpani = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c1
    d4 h c2
    c c4 h
    c2 h4 c8 h
    a2 g
  }
}

BassFigures = \figuremode {
  r1
  r4 <6>2.
  r2 <4 2>4 <6>
  r2 <6>
  <7>4. <6\\>8 r2
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
