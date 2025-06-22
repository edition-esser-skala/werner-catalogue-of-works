\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Presto"
    R1*3
    d'2 g,4 g
    h4. h8 a4 d~
    d c h4. cis8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Presto"
    R1*2
    r2 g'
    d4 d e4. e8
    d4 g2 fis4
    g a4. d,8 g4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1*3
    d'2^\tutti g,4 g
    h4. h8 a4 d~
    d c h4. cis8
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te
  Do -- mi -- num, o --
  mnes gen -- \hy
}


Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1*2
    r2 g'^\tutti
    d4 d e4. e8
    d4 g2 fis4
    g a4. d,8 g4
  }
}

AltoLyrics = \lyricmode {
  Lau --
  da -- te Do -- mi --
  num, o -- mnes
  gen -- _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    r2 d^\tutti
    g,4 g h4. h8
    a4 d2 c4
    h8[ g a h] c[ c, e fis]
    g[ a h c] d4 d,
    e fis g e
  }
}

TenoreLyrics = \lyricmode {
  Lau --
  da -- te Do -- mi --
  num, o -- mnes
  gen -- _
  _ _ tes,
  o -- mnes gen -- \hy
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    g'2^\tutti d4 d
    e4. e8 d4 g~
    g fis e4. fis8
    g4 r r2
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te
  Do -- mi -- num, o -- _
  mnes gen --
  tes,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Presto"
    << {
      s2 d'
      g,4 g h4. h8
      a4 d
    } \\ {
      g,2 d4 d
      e4. e8 d4 g~
      g fis
    } >> e4. fis8
    g \clef tenor g[ a h] c c, e fis
    g a h c d4 d,
    e fis g e
  }
}

BassFigures = \figuremode {
  <1>1
  r
  r2 <10 7>4 <\t 6>
  <5 3>2. <6>4
  r2 <5 4>4 <8 _+>
  <7> <5 3> <10 9> <5>8 <6\\>
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
