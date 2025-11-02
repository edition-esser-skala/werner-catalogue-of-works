\version "2.24.2"
\include "header.ly"

CornettoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    g''1 g2
    g a e
    fis1 h,2
    e e e
    e1 e2
    e e a,
    e'1.
  }
}

CornettoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
      e'1 e2
    d d h
    h1 h2
    g h c
    h1 h2
    c a1
    gis1.
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*7
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*7
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    g'1^\markup \remark "trb & vla" g2
    g fis e
    dis1 dis2
    e1 e2
    e1 e2
    e e d!
    e1.
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c1^\markup \remark "trb & vla" c2
    h a g
    fis1 fis2
    e h' a
    gis1 gis2
    g a1
    h1.
  }
}

TromboneIII = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c1 c2
    g' d e
    h1 h2
    c gis a
    e'1 e2
    c f,1
    e1.
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*7
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    g''1 g2
    g a e
    fis1 h,2
    e e e
    e1 e2
    e e a,
    e'1.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    e'1 e2
    d d h
    h1 h2
    g h c
    h1 h2
    c a1
    gis1.
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    e'1^\tutti e2
    d d h
    h1 h2
    g h c
    h1 h2
    c a1
    gis1.
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem,
  fa -- cto -- rem
  coe -- li
  et ter --
  rae,
}

Alto = {
  \relative c' {
    \clef alto
    \clef treble
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    g'1^\tutti g2
    g fis e
    dis1 dis2
    e e e
    e1 e2
    e e d!
    e1.
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem,
  fa -- cto -- rem
  coe -- li
  et ter -- _
  rae,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c1^\tutti c2
    h a g
    fis1 fis2
    e h' a
    gis1 gis2
    g a1
    h1.
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem,
  fa -- cto -- rem
  coe -- li
  et ter --
  rae,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c1^\tutti c2
    g' d e
    h1 h2
    c gis a
    e'1 e2
    c f,1
    e1.
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem,
  fa -- cto -- rem
  coe -- li
  et ter --
  rae,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c1.-\tutti
    g'2 d e
    h1.
    c2 gis a
    e'1.
    c2 f,1
    e1.
  }
}

BassFigures = \figuremode {
  r1.
  r2 <_+>1
  <_+>1.
  r2 <6>1
  <_+>1.
  r2 <7> <6>
  r1.
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
