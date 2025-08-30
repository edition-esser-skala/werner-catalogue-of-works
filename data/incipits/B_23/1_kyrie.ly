\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    g'2. e4 a2
    r4 fis h g c2
    r4 a d4. c8 h4.\trill a8
    g2 c a4 d~
    d8[ c] d4 g, e'8[ d] c4.\trill h8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- _ son,
  e -- lei -- _ _ _
  son, e -- lei -- _
  _ son, e -- "lei -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    r2 c2. a4
    d2 r4 h e c
    f!2 r4 d g4. f8
    e4 e2 a4 fis d
    g2. e4 a4. g8
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei -- _
  son, e -- lei -- _
  son, e -- _ lei -- son,
  Ky -- ri -- e "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1.*2
    r2 r g~
    g4 e a2 r4 fis
    h g c2 r4 a
  }
}

TenoreLyrics = \lyricmode {
  Ky --
  ri -- e e --
  lei -- _ son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1.*3
    c2. a4 d2
    r4 h e c f!2
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- _ son,
}

Organo = {
  \relative c {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "Alla capella"
    << {
      g''2. e4 a2
      r4 fis h g c2
      r4 a d4. c8
    } \\ {
      r2 c,2. a4
      d2 r4 h e c
      f2 r4 d
    } >> \clef tenor g,2
    \clef bass c,2. a4 d2
    r4 h e c f!2
  }
}

BassFigures = \figuremode {
  r1.
  r
  r1 <3 8>2
  <5> <6> <_+>
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
