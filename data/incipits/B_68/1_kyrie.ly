\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    d'2. d4 h d
    g,2. a8 h c4 d
    e d8 c h4 d2 cis4
    d a d c h c
    d2. c8 h a4 g
    fis a2 h8 c d4 a
    h g8 a h4 c8 d e4 fis
    g2 g, r
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*2
    g'2. g4 fis a
    d,2. e8 fis g4 a
    h a8 g fis4 g fis e
    d fis2 a4 d, fis
    g h8 a g4 fis e d8 c
    h2 r4 h' a e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    d'2. d4 h d
    g,2. a8[ h] c4 d
    e d8[ c] h4 d2 cis4
    d a d c h c
    d2. c8[ h] a4 g
    fis a a h8[ c] d4 a
    h g8[ a] h4 c8[ d] e4 fis
    g2 g, r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ _
  son, e -- lei -- _ _
  son, e -- lei -- _ _ _
  son, e -- lei -- _
  son, e -- lei -- _ _ _
  son, e -- lei -- _ _ _
  _ son,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*2
    g'2. g4 fis a
    d,2. e8[ fis] g4 a
    h a8[ g] fis4 g fis e
    d fis2 a4 d, fis
    g h8[ a] g4 fis e d8[ c]
    h2 r4 h' a e
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ _
  son, e -- lei -- _ _ _
  son, Ky -- ri -- e e --
  lei -- _ _ _ _ _
  son, e -- lei \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*5
    d2. d4 h d
    g,2. a8[ h] c4 d
    e d8[ c] h4 d2 cis4
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ _
  son, e -- lei -- _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*7
    g'2. g4 fis a
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e "e -"
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    d''2. d4 h d
    g,2. a8 h c4 d
    << {
      e d8 c h4 d2 cis4
      d a d c h c
      d2. c8 h a4 g
    } \\ {
      g2. g4 fis a
      d,2. e8 fis g4 a
      h a8 g fis4 g fis e
    } >>
    \clef tenor d2. d4 h d
    g,2. a8 h c4 d
    \clef bass g,2. g4 fis a
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  r
  r
  r
  <6>2 <5> <6>4 <_+>
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
