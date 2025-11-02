\version "2.24.2"
\include "header.ly"

CornettoI = {
  \relative c' {
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

CornettoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'2^\markup \remark "trb" e4
    g2.
    f2 e8 f
    g2.
    e4 g a
    g2 e4
    a g2
    g2.
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4^\markup \remark "trb" h a
    g2.
    a4 d c
    h2.
    a4 c a
    h2 c4
    c c h
    c2.
  }
}

TromboneIII = {
  \relative c {
    \clef bass
      \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'4 g a
    e2.
    f4 h, c
    g2.
    a4 e f
    g2 a4
    f g2
    c2.
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    e'4^\tutti d c
    c2.~
    c4 d e
    d2.
    c4 g' f
    f2 e4
    d d2
    e2.
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e
  e --
  _ _
  _
  _ _ _
  lei -- son,
  e -- lei --
  son.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'2^\tutti e4
    g2.
    f2 e8[ f]
    g2.
    e4 g a
    g2 e4
    a g2
    g2.
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e
  e -- _
  _
  _ _ _
  lei -- son,
  e -- lei --
  son.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4^\tutti h a
    g2.
    a4 d c
    h2.
    a4 c a
    h2 c4
    c c h
    c2.
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e
  e --
  _ _ _
  _
  _ _ _
  lei -- son,
  e -- lei -- _
  son.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'4^\tutti g a
    e2.
    f4 h, c
    g2.
    a4 e f
    g2 a4
    f g2
    c2.
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e
  e --
  _ _ _
  _
  _ _ _
  lei -- son,
  e -- lei --
  son.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'4-\tutti g a
    e2.
    f4 h, c
    g2.
    a4 e f
    g2 a4
    f g2
    c2.
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  r4 <5>2
  r2.
  <_!>4 <6>2
  <7> <5>4
  r <4> <3>
  r2.
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
