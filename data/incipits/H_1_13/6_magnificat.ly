\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 \pa c'2
    d4. d8 e4
    d e2\trill
    d4 d d
    g2.~
    g~
    g4 g8 a g f \pd
    e2 r4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e e
    g2 g4
    g g8 g g g
    g2 r4
    r e' d
    c d e
    e d2\trill
    c r4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4 c8 c c4
    g g8 g c4
    g c c8 c
    g2 r4
    r c g
    c g c
    c8 c g4 g8 g
    c2 r4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g''2
    g4. g8 g4
    h c4. c8
    h2 r4
    r g g
    g h c
    c2 h4
    c8 g e c g e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c'2
    d4. d8 e4
    d e4. e8
    d2 r4
    r c d
    e d g
    e d2\trill
    e8 c' g e c g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c'2^\tutti
    d4. d8 e4
    d e4. e8
    d2 r4
    r c d8 d
    e4 d8 d c4
    e d4. d8
    e2 r4
  }
}

SopranoLyrics = \lyricmode {
  Ma --
  gni -- fi -- cat,
  ma -- gni -- fi --
  cat
  a -- ni -- ma,
  a -- ni -- ma me --
  a Do -- mi --
  num.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'2^\tutti
    g4. g8 g4
    g g4. g8
    g4 d d8 d
    g2.~
    g
    g4 g4. g8
    g2 r4
  }
}

AltoLyrics = \lyricmode {
  Ma --
  gni -- fi -- cat,
  ma -- gni -- fi --
  cat a -- ni -- ma
  me --

  a Do -- mi --
  num.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e2^\tutti
    d4 h c
    h c4. c8
    h2 r4
    r e d8 d
    c4 h8 h c4
    c c h
    c2 r4
  }
}

TenoreLyrics = \lyricmode {
  Ma --
  gni -- fi -- cat,
  ma -- gni -- fi --
  cat
  a -- ni -- ma,
  a -- ni -- ma me --
  a Do -- mi --
  num.

}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c2^\tutti
    h4 g c
    g' c4. c8
    g2 r4
    r c h8 h
    c4 g8 g e4
    c g4. g8
    c2 r4
  }
}

BassoLyrics = \lyricmode {
  Ma --
  gni -- fi -- cat,
  ma -- gni -- fi --
  cat
  a -- ni -- ma,
  a -- ni -- ma me --
  a Do -- mi --
  num.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c2-\tutti c4
    h g c
    g' c c,
    g'2 r4
    r c h
    c g e
    c g2
    c r4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r2 <6>4
  r2.
  r4 <4> <3>
  r2.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
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
