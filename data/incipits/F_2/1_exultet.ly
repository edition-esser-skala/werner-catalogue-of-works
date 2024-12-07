\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    d'1 c2 a
    h c d2. d4
    a2 h c h4 a
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 g'
    f2 d e f
    g2. g4 d2 e
    f e4 d e2 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    d'1 c2 a
    h c d2. d4
    a2 h c h4 a
  }
}

SopranoLyrics = \lyricmode {
  Ex -- ul -- tet
  coe -- lum lau -- di --
  bus, re -- sul -- tet _
}

Alto = {
  \relative c' {
    \clef alto
    \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 g'
    f2 d e f
    g2. g4 d2 e
    f e4 d e2 f
  }
}

AltoLyrics = \lyricmode {
  Ex -- %3
  ul -- tet coe -- lum
  lau -- di -- bus, re --
  sul -- tet _ ter -- ra
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1 c2 a
    h c d2. d4
    g,2 a h a4 g
    a2 h c2. c4
    g1 r
    R\breve
  }
}

TenoreLyrics = \lyricmode {
  Ex -- ul -- tet
  coe -- lum lau -- di --
  bus, re -- sul -- tet _
  ter -- ra gau -- di --
  is,
}

Basso = {
  \relative c {
    \clef bass
    \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    g'1 f2 d
    e f g2. g4
    d1 a'2. a4
    e1 r
    R\breve
  }
}

BassoLyrics = \lyricmode {
  Ex -- ul -- tet
  coe -- lum lau -- di --
  bus, lau -- di --
  bus,
}

Organo = {
  \relative c {
    \clef tenor
    \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d'1-! c2-! a-!
    \clef bass << {
      h c d1
      g,2 a s2
    } \\ {
      g1 f2 d
      e f g1
    } >>
    d a'
    e \clef soprano << {
      d''
      a2 h c h4 a
    } \\ {
      d,2 e
      f e4 d e2 f
    } >>
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r1 <8 3>
  <5>2 <6> <5> <6>
  <5> <6>1.
  r\breve
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
