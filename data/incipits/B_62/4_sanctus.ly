\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    d'1~
    d4 c2 h4
    a2. g4
    g fis g2
    d'2. cis4~
    cis h2 ais4
    h2 d
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    d'1~
    d4 c2 h4
    a2. g4
    g fis g2
    d'2. cis4~
    cis h2 ais4
    h2 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d'1~^\tutti
    d4 c2 h4
    a2. g4
    g fis g2
    d'2. cis4~
    cis h2 ais4
    h2 d
  }
}

SopranoLyrics = \lyricmode {
  San --
  _ _
  _ ctus,
  san -- _ ctus,
  san -- _
  _ _
  ctus, "san -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 fis2^\tutti e4~
    e e fis g
    fis2 d4. e8
    d2 d
    r4 gis2 gis4
    fis4. g8 fis2
    fis r4 fis8[ g]
  }
}

AltoLyrics = \lyricmode {
  San -- _
  _ _ _
  _ _ ctus,
  san -- ctus,
  san -- ctus,
  san -- _ _
  ctus, "san -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 h^\tutti g gis
    a2. d4~
    d d d4. c8
    h4 a h2
    r4 h2 h4
    ais d2 cis4
    d2 r
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _
  _ _
  ctus, san -- _
  _ _ ctus,
  san -- ctus,
  san -- _ _
  ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 d~^\tutti
    d4 c h4. c8
    d2 g,
    r eis'
    e4 d8[ e] fis2
    h, r
  }
}

BassoLyrics = \lyricmode {
  San --
  _ _ _
  _ ctus,
  san --
  _ _ _
  ctus,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    d''4-!-\tutti \clef tenor h, g gis
    a2 \clef bass d,~
    d4 c h4. c8
    d2 g,
    r eis'
    e4 d8 e fis2
    h, r
  }
}

BassFigures = \figuremode {
  r4 <5> <7> <6 5>
  <5 4> <\t 3> <7> <6 4>
  <5 3> <\t \t> <7> <6>
  <6 4> <5 3>2.
  r2 <7 5>4 <6\\ \t>
  <4\+ 2> <6> <6 4> <5\+ _+>
  r1
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
