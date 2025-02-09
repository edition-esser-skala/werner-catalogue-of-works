\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 3/2 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    R1.
    r2 c'2. a4
    d2 h4 g c2
    a g2. g4
    g2 r r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e e -- _ lei --
  son, Ky -- ri --
  e,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \lydian \time 3/2 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    R1.
    r2 r f~
    f4 d g2 e4 c
    f2 d1
    e2 g2. e4
  }
}

AltoLyrics = \lyricmode {
  Ky --
  ri -- e e -- _
  _ lei --
  son, Ky -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \lydian \time 3/2 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    c2. a4 d2
    h4 g c2 a
    h2. e4 c a~
    a d h1
    c2 r c
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e
  e -- _ lei -- son,
  e -- _ lei -- _
  _ _
  son, "Ky -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \lydian \time 3/2 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
    r2 f2. d4
    g2 e4 c f2
    d e a
    f4 d g1
    c,2 e2. c4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e -- _ lei --
  son, Ky -- ri --
  e e -- lei --
  son, Ky -- "ri -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \lydian \time 3/2 \tempoMarkup "Alla capella · Allegro"
    << {
      c'2. a4 d2
      h4 g s1
    } \\ {
      r2 f2. d4
      g2 e4 c f2
    } >>
    d e a
    f4 d g1
    c,2 e2. c4
  }
}

BassFigures = \figuremode {
  r1.
  r2 <6>1
  <6!>2 <5>1
  r1.
  r2 <6>1
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
