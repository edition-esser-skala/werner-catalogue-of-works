\version "2.24.2"
\include "header.ly"

CornettoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'4. h8 c4. h8
    h4 a8 gis a4. g8
    g4 f4. g8 e f
    g4 a f2
    e h'4. c8
    d e a,4 g4. a8
  }
}

CornettoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'4. h8 c4. h8
    h4 a8 gis a4. g8
    g4 f4. g8 e f
    g4 a f2
    e h'4. c8
    d e a,4 g4. a8
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*6
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*6
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    e4.^\markup \remark "trb & vla" f8 g f d4
    c8 e4 d8 e f e4
    c f8 h, c d e d
    c4 c c h
    c2 g'4. fis8
    g4. fis8 fis4 e8 dis
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    g4.^\markup \remark "trb & vla" d'8 c a g4
    e a8 d, a' d h4
    a4. g8 f d' c h
    c4 a d2
    g, g4. a8
    h c d d, e4. fis8
  }
}

TromboneIII = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c4. d8 e f g g,
    a4. h8 c d e e,
    f4. g8 a h c d
    e4 f d2
    c r
    R1
  }
}

Timpani = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*6
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'4. h8 c4. h8
    h4 a8 gis a4. g8
    g4 f4. g8 e f
    g4 a f2
    e h'4. c8
    d e a,4 g4. a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c'4. h8 c4. h8
    h4 a8 gis a4. g8
    g4 f4. g8 e f
    g4 a f2
    e h'4. c8
    d e a,4 g4. a8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c'4.^\tutti h8 c4. h8
    h4 a8[ gis] a4. g8
    g4 f4. g8[ e f]
    g4 a f2
    e h'4. c8
    d[ e] a,4 g4. a8
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _ _
  _ _ _ _
  _ _ _
  _ ctus, san --
  ctus, san -- _
  _ _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    e4.^\tutti f8 g[ f] d4
    c8 e4 d8 e[ f] e4
    c f8[ h,] c[ d e d]
    c4 c c h
    c2 g'4. fis8
    g4. fis8 fis4 e8[ dis]
  }
}

AltoLyrics = \lyricmode {
  San -- _ _ _
  _ _ _ _ _
  _ _ _
  _ ctus, san -- _
  ctus, san -- _
  _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    g4.^\tutti d'8 c[ a] g4
    e a8[ d,] a'[ d] h4
    a4. g8 f[ d' c h]
    c4 a d2
    g, g4. a8
    h[ c d d,] e4. fis8
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _ _
  _ _ _ _
  _ _ _
  _ ctus, san --
  ctus, san -- _
  _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c4.^\tutti d8 e[ f g g,]
    a4. h8 c[ d e e,]
    f4. g8 a[ h c d]
    e4 f d2
    c r
    R1
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  _ _ _
  _ _ _
  _ ctus, san --
  ctus,
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c4. d8 e f g g,
    a4. h8 c d e e,
    f4. g8 a h c d
    e4 f d2
    c \clef tenor g'4. a8
    h c d d, e4. fis8
  }
}

BassFigures = \figuremode {
  r4. <6>8 q4 <4>8 <3>
  <9>4 <8>8 <6\\> <6>4 <4>8 <3>
  <9>4 <8> <6>8 q4 q8
  q2 <7>4 <6>
  r1
  <6>4 <4>8 <_+> <10 9\\>4. <6\\>8
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
