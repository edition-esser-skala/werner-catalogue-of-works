\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "Alla capella · Vivace" \autoBeamOff
    d'1 e2
    cis d2. c4
    h2 c2. d4
    c h a1\trill
    g2 r r
    R1.
    r2 d' e
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e e -- _
  lei -- _ _
  _ _ _
  son,

  Ky -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \tempoMarkup "Alla capella · Vivace" \autoBeamOff
    r2 g'1
    a2 fis g~
    g4 f e2 fis
    g1 fis2
    g r r
    R1.
    a2 h gis
  }
}

AltoLyrics = \lyricmode {
  Ky --
  ri -- e e --
  _ lei -- son,
  e -- lei --
  son,

  Ky -- ri -- e
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \tempoMarkup "Alla capella · Vivace" \autoBeamOff
    R1.*3
    r2 d1
    e2 cis d~
    d4 c h2 cis
    d r r
  }
}

TenoreLyrics = \lyricmode {
  Ky --
  ri -- e e --
  _ lei -- _
  son,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Alla capella · Vivace" \autoBeamOff
    R1.*4
    g'2 a fis
    g2. fis4 e2
    d r r
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- _ lei --
  son,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "Alla capella · Vivace"
    << {
      d''1 e2
      cis d2. c4
      h2 c2. d4
      c h
    } \\ {
      r2 g1
      a2 fis g~
      g4 f e2 fis
      g
    } >> \clef tenor d1
    \clef bass g,2 a << {
      d~
      d4 c! h2 cis
    } \\ {
      fis,2
      g2. fis4 e2
    } >>
    d \clef soprano << {
      d'' e
    } \\ {
      h2 gis
    } >>
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r2 <5 4> <\t _+>
  <6> <_+>1
  r1.
  <5 8>
}

\score {
  <<
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
