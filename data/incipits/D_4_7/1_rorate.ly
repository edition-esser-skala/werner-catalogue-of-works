\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "[no tempo]" c'1
    a2 a
    d2. c4
    b g a b
    c2. b4
    a2 b4 a
    g2 g
    a1
    R
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "[no tempo]" R1
    f
    d2 d
    g2. f4
    e c d e
    f2 f~
    f e
    f1
    f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "[no tempo]" c'1
    a2 a
    d2. c4
    b g a b
    c2. b4
    a2 b4 a
    g2 g
    a1
    R
  }
}

SopranoLyrics = \lyricmode {
  Ro -- %2
  ra -- te
  coe -- li
  de -- _ su -- _
  per, __
  coe -- li __ _
  de -- su --
  per,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "[no tempo]" R1
    f
    d2 d
    g2. f4
    e c d e
    f2 f~
    f e
    f1
    f
  }
}

AltoLyrics = \lyricmode {
  Ro --
  ra -- te
  coe -- li
  de -- _ su -- _
  per, de --
  su --
  per,
  et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "[no tempo]" R1*6
    c1
    a2 a
    d2. c4
  }
}

TenoreLyrics = \lyricmode {
  Ro -- %8
  ra -- te
  coe -- li
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a\fermata \bar "||"
    \time 2/2 \tempoMarkup "[no tempo]" R1*7
    f1
    d2 d
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ _ te.

  Ro --
  ra -- te
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 6/4
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a\fermata \bar "||"
    \clef soprano \time 2/2 \tempoMarkup "[no tempo]"
    << {
      c'1
      a2 a
      d2. c4
      b g a b
      c2. b4
      a2 b4 a
    } \\ {
      R1
      f
      d2 d
      g2. f4
      e c d e
      f1
    } >>
    \clef tenor c
    \clef bass f,
    d
  }
}

BassFigures = \figuremode {
  r4*6
  r1
  r
  r
  r
  r
  r
  <4>2 <3>
  r1
  r
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
