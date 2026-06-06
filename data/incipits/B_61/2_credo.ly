\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    h'2 h h
    g c h
    c e c
    h h c~
    c h e~
    e dis e
    d1 cis2
    d d h
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- _ po --
  ten -- tem, fa --
  cto -- rem coe --
  li, coe --
  li et
  ter -- _
  rae, vi -- "si -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    g'2 g g
    e a gis
    a e a
    a gis g
    g1 g2
    fis2. g8[ a] h2
    a g4 fis g2
    fis fis gis
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- _ po --
  ten -- tem, fa --
  cto -- rem, fa --
  cto -- rem
  coe -- _ li
  et ter -- _ _
  rae, vi -- "si -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    d2 d h
    c e e
    e1 e2
    e1 e2
    d h2. h4
    h1 h2
    d e4 d e2
    a, h2. e4
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem, fa --
  cto -- rem
  coe -- li et
  ter -- rae,
  et ter -- _ _
  rae, vi -- "si -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
    g'2 g g,
    c1 e2
    a, c a
    e' e c
    g'1 e2
    h'2. a4 g2
    fis e1
    d2 h e
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po --
  ten -- tem, fa --
  cto -- rem, fa --
  cto -- rem
  coe -- _ li
  et ter --
  rae, vi -- "si -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Vivace moderato"
    g'1 g,2
    c1 e2
    a, c a
    e'1 c2
    g'1 e2
    h'2. a4 g2
    fis e1
    d2 h e
  }
}

BassFigures = \figuremode {
  r1.
  <5>2 <6> <_+>
  r1.
  <4>2 <_+> <5!>
  <4> <3>1
  <4>2 <_+> <6>
  <6> <7> <6\\>
  r <5> <_+>
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
