\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*5
    r1 d'
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*4
    g'1 e2 g
    a g4 fis g d e fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*5
    r1 d'
  }
}

SopranoLyrics = \lyricmode {
  "Lau -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*4
    g'1 e2 g
    a g4 fis g d e fis
  }
}

AltoLyrics = \lyricmode {
  Lau -- da Je --
  ru -- sa -- lem Do -- _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 d
    h2 d e d4 cis
    d a h cis d a d c
    h g a h c2 d
    c h4 a h1
  }
}

TenoreLyrics = \lyricmode {
  Lau --
  da Je -- ru -- sa -- lem
  Do -- _ _ _ _ _ _ _
  _ _ _ _ _ _
  _ mi -- _ num,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g'1 e2 g
    a g4 fis g d e fis
    g2. fis4 g2 a
    fis2. e4 d2 d
    e2. d4 c2 h
    a d g,1
  }
}

BassoLyrics = \lyricmode {
  Lau -- da Je --
  ru -- sa -- lem Do -- _ _ _
  _ _ _ _
  _ mi -- num, Je --
  ru -- sa -- lem Do --
  _ mi -- num,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g'1-! e2-! g
    a g4 fis << {
      d'1
      h2 d e d4 cis
      d a h cis d a d c
    } \\ {
      g4 d e fis %2
      g2. fis4 g2 a
      fis2. e4 d1
    } >>
    e2. d4 c2 h
    a d g,1
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r
  <5>
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
