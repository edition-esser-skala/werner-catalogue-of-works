\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    h'8 c d2 fis4 g fis
    g d2 fis4 g fis
    g a h a g h
    a d, fis a d a
    h g, r h'2 g4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    g'4 g2 a4 h a
    h g2 a4 h a
    h d2 fis4 d g
    fis2 d2. d4
    d h e2. e4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    d'2^\tutti d d4 d
    d2 d d
    d4 d8 d d2. d4
    d2 d2. d4
    d h e2. e4
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da, lau -- da,
  lau -- da Ie --
  ru -- sa -- lem, Do -- mi --
  num, lau -- da,
  lau -- da, lau -- da,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    g'2^\tutti g4 fis g fis
    g4. g8 g4 fis g fis
    g a8 a g4 fis g2
    fis fis4 fis a fis
    d g2 g4 h g
  }
}

AltoLyrics = \lyricmode {
  Lau -- da, lau -- da, Ie --
  ru -- sa -- lem, lau -- da, Ie --
  ru -- sa -- lem, Do -- _ mi --
  num, lau -- da, lau -- _
  da, lau -- da, "lau -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    h2^\tutti h4 a h a
    h4. h8 h4 a h a
    h a8 a h4 a h2
    a a2. a4
    h2 h h4 h
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da, lau -- da, Ie --
  ru -- sa -- lem, lau -- da, Ie --
  ru -- sa -- lem, Do -- _ mi --
  num, lau -- da,
  lau -- da, lau -- da,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
    g'2^\tutti g4 d h d
    g4. g8 g4 d h d
    g fis8 fis g4 d h g
    d'2 d4 d fis d
    g2. e8[ fis] g4 e
  }
}

BassoLyrics = \lyricmode {
  Lau -- da, lau -- da, Ie --
  ru -- sa -- lem, lau -- da, Ie --
  ru -- sa -- lem, Do -- _ mi -- _
  num, lau -- da, lau -- da,
  lau -- _ _ da,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Andante"
    g'4-\tutti h8 a g4 d h d
    g h8 a g4 d h d
    g fis g d h g
    d' fis8 e d4 d' fis, d
    g, g'8 fis g4 e8 fis g4 e
  }
}

BassFigures = \figuremode {
  r1 <6>2
  r1 q2
  r1.
  r
  r2 <6>1
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
